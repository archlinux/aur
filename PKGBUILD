# Maintainer: Alberto Oliveira <orkan.aos at gmail dot com>
# SPDX-License-Identifier: 0BSD

pkgname=neostation
pkgver=1.0.0rc2.3002
pkgrel=2
pkgdesc='Controller-friendly emulation frontend with artwork and RetroAchievements integration (source build)'
arch=('x86_64')
url='https://neostation.dev/'
license=('GPL-3.0-only' 'LicenseRef-MDK-SDK' 'Apache-2.0 WITH LLVM-exception')
depends=(
  'alsa-lib' 'at-spi2-core' 'bash' 'cairo' 'gcc-libs' 'gdk-pixbuf2'
  'glib2' 'glibc' 'gtk3' 'harfbuzz' 'libglvnd' 'libpulse' 'libsecret'
  'libx11' 'libxi' 'pango' 'zlib' 'ffmpeg' 'flac' 'libogg' 'libvorbis' 'opus' 'jre17-openjdk'
)
makedepends=(
  'binutils' 'clang' 'cmake' 'curl' 'git' 'jdk17-openjdk'
  'jq' 'jsoncpp' 'ninja' 'patchelf'
  'pkgconf' 'unzip' 'xz' 'desktop-file-utils' 'patch' 'pax-utils'
)
optdepends=(
  'retroarch: launch games through Libretro cores'
  'org.freedesktop.secrets: store account credentials using a desktop keyring'
  'xdg-utils: open web links in the default browser'
)
conflicts=('neostation-bin')
options=('!strip' '!debug')

_commit='a91f2f0bfe0484ca961163a2acac0f677b9f1245'
_flutter_version='3.47.9'
_mdk_version='0.40.1'
_mdk_sha256='e53a38b6bcdce99cea852ecff25b0e4acc67539418a04b7c27868c24c130021d'
_project="neostation-frontend-${_commit}"
source=(
  "neostation-${pkgver}.tar.gz::https://github.com/misobadev/neostation-frontend/archive/${_commit}.tar.gz"
  'neostation'
  'MDK-LICENSE.md::https://raw.githubusercontent.com/wang-bin/mdk-sdk/37f03efa8cfc45a040c2eec835116981fe8dd728/README.md'
  'LLVM-LICENSE.txt::https://raw.githubusercontent.com/llvm/llvm-project/4a1b95bda0c444798a5240fe924dd127b776d12d/libcxx/LICENSE.TXT'
  'system-audio.patch'
  'desktop-dialog-scaling.patch'
)
source_x86_64=(
  "flutter-${_flutter_version}-linux-x64.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${_flutter_version}-stable.tar.xz"
  "mdk-sdk-${_mdk_version}-linux-x64.tar.xz::https://github.com/wang-bin/mdk-sdk/releases/download/v${_mdk_version}/mdk-sdk-linux-x64.tar.xz"
)
noextract=("mdk-sdk-${_mdk_version}-linux-x64.tar.xz")
sha256sums=('50e220dc1922f36435dbcf16e4430ab6b479be6db4d84949f9d8d506f3dea02f' 'a9bf248c8311d4f4551ed49ad67feafcd98b1ac5a13269f2996c4ef4eb4d6dc2' 'db2f6936bbbc92e91a957b0e1ffc1b87ffa6c954be1b20151f095051b3c9a3d0' '539dd7aed86e8a4f12cbdd0e6c50c189c7d74847e4fecc64ce2c6ee3a01da38b' '898da5b8311543eb1812666ed620a6d8ae0f3fa2cc17f0ce9b53f7399321974d' '2b485f83f66caacf87a7a78a3b83b7a1c6ed376a8397aecddffb7a8ca3364b77')
sha256sums_x86_64=('25ed8c3c29d51a7353f2a944310b478af8214920639524b19c50a19e6c044c5a' "${_mdk_sha256}")

_flutter_environment() {
  # Keep SDK, package downloads and tool preferences inside the build tree.
  export FLUTTER_ROOT="${srcdir}/flutter"
  export PATH="${FLUTTER_ROOT}/bin:${PATH}"
  export HOME="${srcdir}/build-home"
  export PUB_CACHE="${srcdir}/pub-cache"
  export XDG_CACHE_HOME="${HOME}/.cache"
  export FLUTTER_SUPPRESS_ANALYTICS=true
  export DART_SUPPRESS_ANALYTICS=true
  export CI=true
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
  export FVP_DEPS_URL="https://github.com/wang-bin/mdk-sdk/releases/download/v${_mdk_version}"
  export FVP_DEPS_SHA256="$_mdk_sha256"
  unset FVP_DEPS_LATEST
  mkdir -p "$HOME" "$PUB_CACHE" "$XDG_CACHE_HOME"
}

prepare() {
  _flutter_environment
  cd "${srcdir}/${_project}" || return
  [[ $(jq -r .flutter .fvmrc) == "$_flutter_version" ]]
  patch -Np1 -i "${srcdir}/system-audio.patch"
  patch -Np1 -i "${srcdir}/desktop-dialog-scaling.patch"
  flutter config --no-analytics --enable-linux-desktop
  flutter pub get --enforce-lockfile
  # Seed the plugin cache with the checksum-verified release, not its nightly URL.
  install -Dm644 "${srcdir}/mdk-sdk-${_mdk_version}-linux-x64.tar.xz" \
    "${PUB_CACHE}/hosted/pub.dev/fvp-0.40.0/linux/mdk-sdk-linux-x64.tar.xz"
}

_build_linux() {
  # Flutter can exit zero while asking for a second build after generated files change.
  local attempt log status
  for attempt in 1 2; do
    log="${srcdir}/flutter-build-${attempt}.log"
    if flutter build linux --release --no-pub > "$log" 2>&1; then
      cat "$log"
    else
      cat "$log"
      return 1
    fi
    status=0
    grep -Fq 'File modified during build. Build must be rerun.' "$log" || status=$?
    case $status in
      1) return 0 ;;
      0) ;;
      *) return "$status" ;;
    esac
  done
  printf '%s\n' 'Flutter still reports modified build inputs after its requested retry.' >&2
  return 1
}

build() {
  _flutter_environment
  cd "${srcdir}/${_project}" || return
  _build_linux || return

  local bundle=build/linux/x64/release/bundle
  # Use Arch FFmpeg and omit optional proprietary camera-format decoder add-ons.
  rm -- "${bundle}/lib/libffmpeg.so.9" "${bundle}/lib/libmdk-braw.so" "${bundle}/lib/libmdk-r3d.so"
  # Remove build-machine paths from the compiled plugins. The ELF loader expands ORIGIN.
  local plugin
  for plugin in libfvp.so libfullscreen_window_plugin.so libflutter_soloud_plugin.so \
    libflutter_secure_storage_linux_plugin.so libgamepads_linux_plugin.so liburl_launcher_linux_plugin.so; do
    # shellcheck disable=SC2016
    patchelf --set-rpath '$ORIGIN' "${bundle}/lib/${plugin}"
  done
}

check() {
  cd "${srcdir}/${_project}" || return
  local library output rpath
  for library in build/linux/x64/release/bundle/neostation build/linux/x64/release/bundle/lib/*.so*; do
    rpath=$(patchelf --print-rpath "$library") || return
    [[ $rpath != *"${srcdir}"* ]] || return 1
    output=$(lddtree "$library") || return
    if grep -Eq '^[[:space:]]+[^ ]+ => None' <<< "$output"; then
      printf '%s\n' "Unresolved dependency in $library" >&2
      return 1
    fi
  done
  test ! -e build/linux/x64/release/bundle/lib/libffmpeg.so.9
  test ! -e build/linux/x64/release/bundle/lib/libmdk-braw.so
  test ! -e build/linux/x64/release/bundle/lib/libmdk-r3d.so
  for library in build/linux/x64/release/bundle/lib/lib{FLAC,ogg,opus,vorbis}*; do
    [[ ! -e $library ]] || return 1
  done
  test -x build/linux/x64/release/bundle/neostation
  test -f build/linux/x64/release/bundle/lib/libapp.so
  desktop-file-validate build-utils/appimage/com.neogamelab.neostation.desktop
}

package() {
  cd "${srcdir}/${_project}" || return
  install -dm755 "${pkgdir}/opt/neostation"
  cp -a build/linux/x64/release/bundle/. "${pkgdir}/opt/neostation/"
  install -Dm755 "${srcdir}/neostation" "${pkgdir}/usr/bin/neostation"
  install -Dm644 build-utils/appimage/com.neogamelab.neostation.desktop "${pkgdir}/usr/share/applications/neostation.desktop"
  install -Dm644 build-utils/appimage/Icon-512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/neostation.png"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/MDK-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/MDK.md"
  install -Dm644 "${srcdir}/pub-cache/hosted/pub.dev/fvp-0.40.0/linux/mdk-sdk/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/MDK-SDK.md"
  install -Dm644 "${srcdir}/LLVM-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/libcxx.txt"
  install -Dm644 "${srcdir}/flutter/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/Flutter"
}
