# Maintainer: Wolfspirit Magic <wolfspirit at wolfspirit dot eu>
pkgname=firestorm
pkgver=7.2.5.81788
_src=Firestorm_Release_$pkgver
_extension=os
pkgrel=1
pkgdesc="Feature-packed third-party viewer for Second Life and OpenSim grids ($_extension version)"
arch=('x86_64')
url=https://www.firestormviewer.org
license=('LGPL-2.1-only')
install='firestorm.install'
# Packaging release notes. Shown by AUR helpers before updating and by "pacman -Qc firestorm".
changelog='firestorm.changelog'
# Libraries the packaged binaries link against directly. Everything else
# (APR, OpenAL, ALUT, SDL2, libsndfile, CEF, ...) is bundled by the build.
depends=(alsa-lib at-spi2-core cairo dbus expat fontconfig glib2 glu
         libcups libgl libx11 libxcb libxcomposite libxcrypt-compat
         libxdamage libxext libxfixes libxkbcommon libxrandr mesa nspr
         nss pango systemd-libs util-linux-libs hicolor-icon-theme)
# Libraries loaded at runtime only if present, plus the 32-bit runtime
# for the Vivox voice client (SLVoice), which is only used on OpenSim grids.
# Second Life voice uses the 64-bit WebRTC library instead.
optdepends=(
  'gst-plugins-good: for in-world media playback (GStreamer)'
  'gst-plugins-bad: additional media codecs'
  'gst-plugins-ugly: additional media codecs'
  'gst-libav: additional media codecs'
  'libpulse: for PulseAudio audio support'
  'pipewire: for PipeWire audio support'
  'jack: for JACK audio support'
  'libnotify: for desktop notifications'
  'gtk3: for the native file picker'
  'xdg-utils: for opening links in your web browser'
  'lib32-glibc: for OpenSim voice (Vivox)'
  'lib32-gcc-libs: for OpenSim voice (Vivox)'
  'lib32-util-linux: for OpenSim voice (Vivox)'
  'lib32-zlib: for OpenSim voice (Vivox)'
  'lib32-libidn11: for OpenSim voice (Vivox, AUR)'
)
# libxinerama and libpulse are only checked for at configure time (indra/cmake/OpenGL.cmake,
# MediaPluginBase.cmake); the packaged binaries don't link against them.
makedepends=('cmake' 'python-pip' 'git' 'xz' 'libxinerama' 'libpulse')
conflicts=()
provides=('firestorm-os')
source=(
  "$pkgname"::"git+https://github.com/FirestormViewer/phoenix-firestorm#tag=${_src}"
  "fs-build-variables"::'git+https://github.com/FirestormViewer/fs-build-variables'
  'firestorm.desktop'
  'firestorm.launcher'
# This patch fixes the fortify check. Arch defines _FORTIFY_SOURCE by default, 
# These are in CMAKE_CXX_FLAGS and not in CMAKE_CXX_COMPILER_ARG1, 
# so the check for _FORTIFY_SOURCE in CMAKE_CXX_COMPILER_ARG1 fails and the fortify check is not disabled, 
# which causes build failures.
  '001-fix-fortify-check.patch'

# We want to be able to use the OS version together with the official firestorm-bin version so we want a different config directory for the OS version.
# This patch changes the default config directory to ~/.firestorm_x64-os instead of ~/.firestorm_x64
  '002-set-different-config-dir.patch'

# GCC 16 introduced -Wsfinae-incomplete which triggers on valid SFINAE patterns used in llinitparam.h.
# This patch disables that warning-as-error for GCC 16+.
  '003-fix-sfinae-incomplete-gcc16.patch'

# libwebrtc.a bundles protobuf/protozero build-tool plugins (cppgen_plugin.o, protozero_plugin.o)
# that both define main. Newer ld rejects multiple definitions even when building a shared library.
  '004-fix-webrtc-multiple-definition.patch'

# The D-Bus SLURL handoff never replied and its sender ignored the result. Check for a running viewer
# by bus name owner instead; otherwise opening a link without a running viewer made it quit.
  '005-fix-slurl-handoff-without-running-viewer.patch'
)
sha256sums=('801a58c9b348cd913546c507f00611d23352e45677b1390342f7015c6b288d3e'
            'SKIP'
            '785af910134b3f221290e5a6b3341da040e48f6c9f12cb944761df0d1e59a974'
            'eb225e8886f347ad8708cd7c3c42f0761d23f11ed7b2164538782ecc5c4b4548'
            'cbef822d5ce2b1b9eb3bc88bfcaa59dfb2eec2cc698bdcb391b1c332a7ed93fb'
            '5eec78e0196e51d58e45078b84dc277353ef635ff160ff61ac58ab5966245011'
            '761502b9fe2a12d160b463b3dbe42d05cfa863b6ffde1fae8305c37f7eaa414c'
            'cc754541b0ed40f80acee048ca038d32eccf5452e409d373638c055ccdb82dda'
            'c09a364743107a5cda971407a82fb714c4c4e17bec784de9a3a81aec8ec9d1af')
# The binaries are already stripped in the build system, so no separate debug package either.
options=(!strip !debug)

prepare() {
  cd "$srcdir/$pkgname"

  for p in "$srcdir"/*.patch; do

    # Replace [EXTENSION] with the actual extension in the patch file
    sed -i "s/\[EXTENSION\]/$_extension/g" "$p"
    echo "Applying patch $(basename "$p")"
    patch -Np1 -i "$p" || exit 1
  done
}

build() {
  # Rename _GLIBCXX_ASSERTIONS to _NO_GLIBCXX_ASSERTION if defined
  # The problem is that makepkg might define -D_GLIBCXX_ASSERTIONS.
  # There is a bug in FS right now that causes the assertion to trigger a crash so we rename it to NO_GLIBCXX_ASSERTIONS to disable the assertions.
  # This is not ideal but it is a workaround until the underlying issue in FS is fixed.
  CPPFLAGS=${CPPFLAGS//_GLIBCXX_ASSERTIONS/_NO_GLIBCXX_ASSERTIONS}
  CXXFLAGS=${CXXFLAGS//_GLIBCXX_ASSERTIONS/_NO_GLIBCXX_ASSERTIONS}

  # Firestorm builds with -Werror. Without LTO, GCC 16 reports false positives for -Warray-bounds (in
  # llviewerassetstorage.cpp and particleeditor.cpp); current Firestorm master also trips -Wformat-truncation
  # (in lldatapacker.cpp). With LTO these checks don't run at compile time, so whether the build failed
  # depended on the user's lto option and on the AUR helper (Shelly doesn't use LTO). Keep these two as warnings.
  CXXFLAGS+=" -Wno-error=array-bounds -Wno-error=format-truncation"
  export CPPFLAGS CXXFLAGS


  cd "$pkgname"
  export AUTOBUILD_VARIABLES_FILE="$srcdir/fs-build-variables/variables"
  
  # Install Autobuild + python deps into an isolated venv
  python -m venv .venv
  source .venv/bin/activate
  python -m pip install --upgrade pip
  pip install -r requirements.txt

  case "$_extension" in
    os)
      channel="ReleaseOSArchx64"
      ;;
    beta)
      channel="BetaOSArchx64"
      ;;
    *)
      channel="DevOSArchx64"
      ;;
  esac

  # Build the project using Autobuild with the specified options:
  # - Package the output for installation to /opt/firestorm-$_extension
  # - Enable AVX2 optimizations
  # - Don't use Kakadu for JPEG2000 support. KDU Requires license. Falling back to OpenJPEG for JPEG2000 support.
  # - Don't use FMOD Studio for audio. FMOD Studio requires an account to download the API. Falling back to OpenAL for audio support.
  # - Don't use Havok for physics. Havok requires license. This only affects Mesh uploads.
  # - Enable OpenSim support
  # - Pass --fresh to cmake to ensure flags are up to date

  autobuild build -A 64 -c ReleaseFS -- --chan "$channel" \
    --package \
    --avx2 \
    -DUSE_KDU:BOOL=OFF \
    -DUSE_FMODSTUDIO:BOOL=OFF \
    -DHAVOK_TPV:BOOL=OFF \
    -DOPENSIM:BOOL=ON \
    --fresh
  
  # Deactivate the virtual environment after the build is complete
  deactivate
}


package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"

  # Install the packaged output to /opt/firestorm-$_extension
  cp -a --reflink=auto "$pkgname/build-linux-x86_64/newview/packaged" "$pkgdir/opt/firestorm-$_extension"

  install -Dm755 "firestorm.launcher" "$pkgdir/usr/bin/firestorm-$_extension"
  install -Dm644 "firestorm.desktop" "$pkgdir/usr/share/applications/firestorm-$_extension.desktop"

  # Replace [EXTENSION] with the actual extension in the launcher and desktop file
  sed -i "s/\[EXTENSION\]/$_extension/g" "$pkgdir/usr/bin/firestorm-$_extension"
  sed -i "s/\[EXTENSION\]/$_extension/g" "$pkgdir/usr/share/applications/firestorm-$_extension.desktop"

  install -Dm644 "$pkgdir/opt/firestorm-$_extension/firestorm_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/firestorm-$_extension.png"

  # rename "do-not-directly-run-firestorm-bin" to "do-not-directly-run-firestorm-$_extension" in the bin directory
  # firestorm uses that as the class name.
  # This allows us to have both the OS version and the official version installed at the same time
  # The .desktop file needs to match this name in the StartupWMClass field to work properly with the window manager.
  mv "$pkgdir/opt/firestorm-$_extension/bin/do-not-directly-run-firestorm-bin" "$pkgdir/opt/firestorm-$_extension/bin/do-not-directly-run-firestorm-$_extension"

  # replace "do-not-directly-run-firestorm-bin" with "do-not-directly-run-firestorm-$_extension" in the "firestorm" script
  sed -i "s/do-not-directly-run-firestorm-bin/do-not-directly-run-firestorm-$_extension/g" "$pkgdir/opt/firestorm-$_extension/firestorm"
}

