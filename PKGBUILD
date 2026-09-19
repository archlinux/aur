# Maintainer: Vaspyyy <lolbautz2 at gmail dot com>
pkgname=fthr-clips-git
pkgver=1.1.0alpha0.r3.g64a7b0b
pkgrel=1
pkgdesc='Instant replay capture and clip management (upstream Linux development branch)'
arch=('x86_64')
url='https://github.com/FTHR-Community/FTHR-Clips'
license=('GPL-3.0-only' 'MIT' 'LGPL-3.0-or-later' 'OFL-1.1' 'PSF-2.0' 'Apache-2.0' 'BSD-3-Clause' 'Zlib' '0BSD')
depends=('python' 'pyside6' 'qt6-multimedia' 'python-numpy' 'python-opencv'
         'python-keyboard' 'glibc' 'gcc-libs' 'libpulse' 'wayland' 'ca-certificates')
makedepends=('git' 'cmake' 'pkgconf' 'patchelf' 'licenses' 'python-installer' 'python-packaging' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-qt' 'python-typing_extensions')
optdepends=(
  'python-sounddevice: microphone recording and level meter (uses PortAudio)'
  'pipewire-pulse: desktop audio through PipeWire'
  'pulseaudio: alternative desktop audio server'
  'grim: screenshots on supported Wayland compositors'
  'openbsd-netcat: compositor hotkey socket commands'
  'xdg-utils: open the clips folder'
  'xorg-xwayland: run the UI with QT_QPA_PLATFORM=xcb when native Wayland fails'
  'libva-mesa-driver: AMD VA-API encoding'
  'nvidia-utils: NVIDIA NVENC encoding'
  'xdotool: X11 window detection'
  'xorg-xprop: X11 fullscreen detection'
  'xorg-xrandr: native X11 monitor geometry'
)
provides=("fthr-clips=$pkgver")
conflicts=('fthr-clips')
# Preserve the upstream per-library hashes and the sealed uploader payload.
options=('!strip' '!debug')
_ffmpeg=ffmpeg-n8.1.2-34-g9b6c8969e0-linux64-lgpl-shared-8.1
source=(
  'FTHR-Clips::git+https://github.com/FTHR-Community/FTHR-Clips.git#branch=linux'
  "https://github.com/BtbN/FFmpeg-Builds/releases/download/autobuild-2026-07-31-14-10/${_ffmpeg}.tar.xz"
  'https://files.pythonhosted.org/packages/53/60/b8db5f1a4b0fb228175f2ea0aa33f949adcc097fbe981cc524f9faf85777/pyinstaller-6.19.0-py3-none-manylinux2014_x86_64.whl'
  'https://files.pythonhosted.org/packages/88/f4/035fb8c06deff827f540a9a4ed9122c54e5376fca3e42eddf0c263730775/pyinstaller_hooks_contrib-2026.4-py3-none-any.whl'
  'https://files.pythonhosted.org/packages/a9/ba/000a1996d4308bc65120167c21241a3b205464a2e0b58deda26ae8ac21d1/altgraph-0.17.5-py2.py3-none-any.whl'
  'prepare-ffmpeg.py'
  'fthr-clips'
  'collect-uploader-licenses.py'
  'liblzma-0BSD.txt'
)
noextract=("${_ffmpeg}.tar.xz" 'pyinstaller-6.19.0-py3-none-manylinux2014_x86_64.whl'
           'pyinstaller_hooks_contrib-2026.4-py3-none-any.whl' 'altgraph-0.17.5-py2.py3-none-any.whl')
sha256sums=('SKIP'
            'c882a80f06617149198a98a07a0880a7e881953ae9f9cb931f5be09a4f93caae'
            'a0fc5f6b3c55aa54353f0c74ffa59b1115433c1850c6f655d62b461a2ed6cbbe'
            '1de1a5e49a878122010b88c7e295502bc69776c157c4a4dc78741a4e6178b00f'
            'f3a22400bce1b0c701683820ac4f3b159cd301acab067c51c653e06961600597'
            '4a351c53faee8b004fae2a1b31d24bdbae444534996013f0e184ae9d3b367fc2'
            '090ef9fa5b6ac5de8a7fdf2be24f0d8bbc43c241375c76d7b23d9ccc4bed714a'
            '248fc13c182338eced319efdaa0137334f9a773fedaaf0380f35a28a65c40f2a'
            '0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74bf1')

pkgver() {
  cd FTHR-Clips
  # Keep alpha/beta/rc attached to the numeric release so pacman orders them
  # below stable. Limit tags to the release vocabulary we deliberately support.
  local description release stage number revision commit
  description=$(git describe --tags --long --abbrev=7 --match 'v[0-9]*')
  if [[ $description =~ ^v([0-9]+\.[0-9]+\.[0-9]+)(-(alpha|beta|rc)(\.?[0-9]+)?)?-([0-9]+)-g([0-9a-f]+)$ ]]; then
    release=${BASH_REMATCH[1]} stage=${BASH_REMATCH[3]} number=${BASH_REMATCH[4]#.}
    revision=${BASH_REMATCH[5]} commit=${BASH_REMATCH[6]}
    # An explicit zero for an unnumbered prerelease keeps alpha0.rN below
    # alpha1/alpha2. Pacman otherwise ranks alpha.rN above alpha2.
    if [[ -n $stage ]]; then
      release+="${stage}${number:-0}"
    fi
    printf '%s.r%s.g%s\n' "$release" "$revision" "$commit"
  else
    printf 'Unrecognized upstream release tag: %s\n' "$description" >&2
    return 1
  fi
}

prepare() {
  python prepare-ffmpeg.py FTHR-Clips "${_ffmpeg}.tar.xz"
}

build() {
  cd FTHR-Clips
  cmake -S FTHRcapture_linux -B FTHRcapture_linux/build \
    -DCMAKE_BUILD_TYPE=Release -DFTHR_FFMPEG_ROOT="$PWD/FTHRcapture_linux/third_party/ffmpeg" \
    -DBUILD_TESTING=ON
  cmake --build FTHRcapture_linux/build --parallel "$(nproc)"
  # Only the optional, consent-gated uploader is frozen, exactly as upstream.
  # All build tools are declared wheels; no pip or remote fetch runs here.
  rm -rf "$srcdir/build-tools"
  python -m installer --destdir="$srcdir/build-tools" --no-compile-bytecode \
    "$srcdir/pyinstaller-6.19.0-py3-none-manylinux2014_x86_64.whl" \
    "$srcdir/pyinstaller_hooks_contrib-2026.4-py3-none-any.whl" \
    "$srcdir/altgraph-0.17.5-py2.py3-none-any.whl"
  PYTHONPATH="$srcdir/build-tools$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')" \
    PYTHONNOUSERSITE=1 PYINSTALLER_CONFIG_DIR="$srcdir/pyinstaller-cache" \
    python tools/build_linux_uploader.py --python /usr/bin/python
  rm -rf "$srcdir/uploader-licenses"
  python "$srcdir/collect-uploader-licenses.py" "$PWD" \
    "$srcdir/build-tools$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')" \
    "$srcdir/uploader-licenses"
  python tools/verify_release_licenses.py --tree .
}

check() {
  cd FTHR-Clips
  ctest --test-dir FTHRcapture_linux/build --output-on-failure
  # Headless suite: compositor/GPU qualification belongs to the real desktop
  # smoke test, not an automatic build. Keep test state out of the user's home.
  mkdir -p "$srcdir/check-home"
  env -u DISPLAY -u WAYLAND_DISPLAY HOME="$srcdir/check-home" \
    QT_QPA_PLATFORM=offscreen python -m pytest -o addopts='' -q
}

package() {
  cd FTHR-Clips
  local root="$pkgdir/usr/lib/fthr-clips"
  install -d "$root/FTHRcapture_linux/build" "$root/FTHRcapture_linux/third_party/ffmpeg"
  cp -a FTHR_UI "$root/"
  find "$root/FTHR_UI" -type d -name __pycache__ -prune -exec rm -rf {} +
  install -m755 FTHRcapture_linux/build/FTHRclips FTHRcapture_linux/build/libFTHRPlaybackMixer.so \
    "$root/FTHRcapture_linux/build/"
  cp -a FTHRcapture_linux/third_party/ffmpeg/lib "$root/FTHRcapture_linux/third_party/ffmpeg/"
  rm -rf "$root/FTHRcapture_linux/third_party/ffmpeg/lib/pkgconfig"
  install -d "$root/FTHRcapture_linux/third_party/ffmpeg/bin"
  install -m755 FTHRcapture_linux/third_party/ffmpeg/bin/{ffmpeg,ffprobe} \
    "$root/FTHRcapture_linux/third_party/ffmpeg/bin/"
  # BtbN's tools carry the broken relative RPATH "-Wl:../lib". Relocate only
  # these executables; upstream's checksum-pinned shared libraries stay intact.
  local tool
  for tool in ffmpeg ffprobe; do
    patchelf --force-rpath --set-rpath '$ORIGIN/../lib' \
      "$root/FTHRcapture_linux/third_party/ffmpeg/bin/$tool"
  done
  install -Dm644 plugin-packages/FTHR-Uploader-linux.fthrplugin \
    "$root/plugin-packages/FTHR-Uploader-linux.fthrplugin"
  install -Dm755 "$srcdir/fthr-clips" "$pkgdir/usr/bin/fthr-clips"
  install -Dm644 AppDir/fthr-clips.desktop "$pkgdir/usr/share/applications/fthr-clips.desktop"
  # Only adapt the AppImage executable to the installed command. Preserve
  # upstream categories/identity; pending desktop PRs are not included.
  sed -i 's/^Exec=AppRun$/Exec=fthr-clips/' "$pkgdir/usr/share/applications/fthr-clips.desktop"
  install -Dm644 AppDir/fthr-clips.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/fthr-clips.png"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cp -a LICENSE COPYRIGHT.md THIRD_PARTY_NOTICES.md licenses/. "$pkgdir/usr/share/licenses/$pkgname/"
  cp -a "$srcdir/uploader-licenses" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 FTHRcapture_linux/third_party/ffmpeg/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/FFmpeg-distribution-LICENSE.txt"
  install -Dm644 tools/ffmpeg_manifest_linux.json "$pkgdir/usr/share/doc/$pkgname/ffmpeg_manifest_linux.json"
}
