# Maintainer: Wolfspirit Magic <wolfspirit at wolfspirit dot eu>
pkgname=firestorm
pkgver=7.2.3.80036
_src=Firestorm_Release_$pkgver
_extension=os
pkgrel=1
pkgdesc="Firestorm is a feature-packed third-party viewer for Second Life  and OpenSim grids ($_extension version)"
arch=('x86_64')
url=https://www.firestormviewer.org
license=('LGPL')
install='firestorm.install'
depends=(apr-util dbus-glib glu gtk2 lib32-libidn lib32-libsndfile
         lib32-util-linux lib32-zlib libbsd libgl libidn libjpeg-turbo
         libpng libxcrypt-compat libxss libxml2 mesa nss openal sdl
         vlc zlib)
optdepends=(
  'alsa-lib: for ALSA support'
  'pepper-flash: for inworld Flash support'
  'freealut: for OpenAL support'
  'lib32-gst-plugins-good: for voice support'
  'lib32-libidn11: for voice support'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support'
)
makedepends=('cmake' 'python-pip' 'git' 'boost' 'xz')
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
)
sha256sums=('bd531ea153457066b46a0d8c80bae77f43f7a886154ace8688a3519338747b16'
            'SKIP'
            'db34a50f4b7fda4a465cd0536f17a0f6040ff6b2e40c32594b1f244ebe8e2d60'
            '465f1611c17f90bba8bc7e7cc3e05ffe8cf20fb9c1b7df59053f54a6bceb8283'
            'cbef822d5ce2b1b9eb3bc88bfcaa59dfb2eec2cc698bdcb391b1c332a7ed93fb'
            '5eec78e0196e51d58e45078b84dc277353ef635ff160ff61ac58ab5966245011')
# The binaries are already stripped in the build system.
options=(!strip)

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

