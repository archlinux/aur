# Maintainer: Wolfspirit Magic <wolfspirit at wolfspirit dot eu>
pkgname=firestorm-git
_pkgver=7.2.3
pkgver=7.2.3.80036
pkgrel=1
pkgdesc="Firestorm is a feature-packed third-party viewer for Second Life  and OpenSim grids (git/os version)"
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
  "$pkgname"::"git+https://github.com/FirestormViewer/phoenix-firestorm#branch=Firestorm_${_pkgver}"
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
sha256sums=('SKIP'
            'SKIP'
            'b8841839874bfd3ea930705bd7db7d256eee72ac35090a146a68c40da52dda0c'
            '4746dca154b7c5a014205e359197b7fcd346ad1c27b99c6df52de10b9169ec28'
            'cbef822d5ce2b1b9eb3bc88bfcaa59dfb2eec2cc698bdcb391b1c332a7ed93fb'
            '1598eb07a64909d50f6235d28ec88d37bc1fd7240f8809811f5f4b7f86d87ccb')
# The binaries are already stripped in the build system.
options=(!strip)

pkgver() {
	_pkgver=$(find "$srcdir/$pkgname/indra/newview/" -type f -iname viewer_version.txt -exec cat {} +)
	cd "$srcdir/$pkgname"
	_revnum=$(git rev-list --count HEAD)
	printf "%s.%s" $_pkgver $_revnum
}

prepare() {
  cd "$srcdir/$pkgname"

  for p in "$srcdir"/*.patch; do
    echo "Applying patch $(basename "$p")"
    patch -Np1 -i "$p" || exit 1
  done

  if [[ -f "$startdir/fmodstudioapi20307linux.tar.gz" ]]; then
    cp "$startdir/fmodstudioapi20307linux.tar.gz" "$srcdir/3p-fmodstudio/"
  fi

}

build() {
  cd "$pkgname"
  export AUTOBUILD_VARIABLES_FILE="$srcdir/fs-build-variables/variables"
  
  # Install Autobuild + python deps into an isolated venv
  python -m venv .venv
  source .venv/bin/activate
  python -m pip install --upgrade pip
  pip install -r requirements.txt

  # Build the project using Autobuild with the specified options:
  # - Package the output for installation to /opt/firestorm-os
  # - Enable AVX2 optimizations
  # - Don't use Kakadu for JPEG2000 support. KDU Requires license. Falling back to OpenJPEG for JPEG2000 support.
  # - Don't use FMOD Studio for audio. FMOD Studio requires an account to download the API. Falling back to OpenAL for audio support.
  # - Don't use Havok for physics. Havok requires license. This only affects Mesh uploads.
  # - Enable OpenSim support
  autobuild build -A 64 -c ReleaseFS -- --chan ReleaseOSArchx64 \
    --package \
    --avx2 \
    -DUSE_KDU:BOOL=OFF \
    -DUSE_FMODSTUDIO:BOOL=OFF \
    -DHAVOK_TPV:BOOL=OFF \
    -DOPENSIM:BOOL=ON
  
  # Deactivate the virtual environment after the build is complete
  deactivate
}

package() {
  mkdir -p "$pkgdir/opt"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"

  # Install the packaged output to /opt/firestorm-os
  mv "$pkgname/build-linux-x86_64/newview/packaged" "$pkgdir/opt/firestorm-os"

	install -Dm755 "firestorm.launcher" "$pkgdir/usr/bin/firestorm-os"
  install -Dm644 "firestorm.desktop" "$pkgdir/usr/share/applications/firestorm-os.desktop"
	install -Dm644 "$pkgdir/opt/firestorm-os/firestorm_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/firestorm-os.png"

  # rename "do-not-directly-run-firestorm-bin" to "do-not-directly-run-firestorm-os" in the bin directory
  # firestorm uses that as the class name.
  # This allows us to have both the OS version and the official version installed at the same time
  # The .desktop file needs to match this name in the StartupWMClass field to work properly with the window manager.
  mv "$pkgdir/opt/firestorm-os/bin/do-not-directly-run-firestorm-bin" "$pkgdir/opt/firestorm-os/bin/do-not-directly-run-firestorm-os"

  # replace "do-not-directly-run-firestorm-bin" with "do-not-directly-run-firestorm-os" in the "firestorm" script
  sed -i 's/do-not-directly-run-firestorm-bin/do-not-directly-run-firestorm-os/g' "$pkgdir/opt/firestorm-os/firestorm"
}
