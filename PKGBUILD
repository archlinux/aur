# Maintainer: Jacqueline Fisher <weretiger95@gmail.com>
# Maintainer: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Nicky D

pkgname=firestorm
_pkgver=7.1.13
pkgver=7.1.13.78266
pkgrel=1
pkgdesc="An open source 3D browser for Second Life & OpenSIM metaverse."
arch=('i686' 'x86_64')
url=https://www.firestormviewer.org
license=('LGPL')
depends=(apr-util dbus-glib gconf glu gtk2 lib32-libidn lib32-libsndfile lib32-util-linux lib32-zlib libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl vlc zlib 'libcrypt.so=1')
optdepends=(
  'alsa-lib: for ALSA support'
  'pepper-flash: for inworld Flash support'
  'freealut: for OpenAL support'
  'lib32-libidn11: for voice support'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support')
makedepends=('cmake' 'python-virtualenv' 'python-pip' 'git' 'boost' 'xz')
conflicts=('firestorm-bin' 'firestorm-git')
#options=(debug !strip)

source=("$pkgname"::"git+https://github.com/FirestormViewer/phoenix-firestorm#branch=Firestorm_${_pkgver}" "fs-build-variables"::'git+https://github.com/FirestormViewer/fs-build-variables' 'firestorm.desktop' 'firestorm.launcher')
sha512sums=('SKIP'
            'SKIP'
            'b39127e496e69d39223529dbd2e2078e7e29e13fef8978dd4e5d77dd516a53268cea524e395302978df55a47a8fbcdb9544fa01f33b128fd2ed968ed077cc80b'
            'b78572b906fdebb3043016bda0c88b62c56ef3fba190fd7ee6aeaaa6da1035d7630b06fd2e1039dea9808cdeb66d66035f4b3225e2aa38cfcd69e6dd2aeb0306')

pkgver() {
	_pkgver=$(find "$srcdir/$pkgname/indra/newview/" -type f -iname viewer_version.txt -exec cat {} +)
	cd "$srcdir/$pkgname"
	_revnum=$(git rev-list --count HEAD)
	printf "%s.%s" $_pkgver $_revnum
}

prepare() {
	export AUTOBUILD_VARIABLES_FILE="$srcdir/fs-build-variables/variables"
	cd "$pkgname"
	virtualenv ".venv" -p python3
	source .venv/bin/activate
	pip3 install -r "$srcdir/$pkgname/requirements.txt"
# 	pip3 install git+https://github.com/FirestormViewer/autobuild-3.0
# 	pip3 install llbase
	export CXXFLAGS="$CXXFLAGS -Wno-error"
	export CFLAGS="$CFLAGS -Wno-error"
	autobuild configure -A 64 -c ReleaseFS_open -- -DLL_TESTS:BOOL=FALSE -DREVISION_FROM_VCS=ON -DPACKAGE:BOOL=Off --chan="ArchLinux"
}

build() {
	cd "$srcdir/$pkgname"
	source .venv/bin/activate
	cd "$srcdir/$pkgname/build-linux-x86_64"
	export CXXFLAGS="$CXXFLAGS -Wno-error"
	export CFLAGS="$CFLAGS -Wno-error"
	make
}

package() {
	mkdir -p "$pkgdir/opt/firestorm"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
	
	cp -rT "$pkgname/build-linux-x86_64/newview/packaged" "$pkgdir/opt/firestorm"

	install -Dm644 "firestorm.desktop" "$pkgdir/usr/share/applications/firestorm.desktop"
	install -Dm644 "$pkgname/build-linux-x86_64/newview/packaged/firestorm_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/firestorm.png"
	install -Dm755 "firestorm.launcher" "$pkgdir/usr/bin/firestorm"
}
