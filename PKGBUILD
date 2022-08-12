# Maintainer: Jacqueline Fisher <weretiger95@gmail.com>
# Maintainer: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Nicky D

pkgname=firestorm
pkgver=6.5.6
pkgrel=1
pkgdesc="This is the Firestorm Viewer!"
arch=('i686' 'x86_64')
url=https://www.firestormviewer.org
license=('LGPL')
depends=(dbus-glib gconf glu gtk2 lib32-libidn lib32-libsndfile lib32-util-linux lib32-zlib libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl vlc zlib)
optdepends=(
  'alsa-lib: for ALSA support'
  'pepper-flash: for inworld Flash support'
  'freealut: for OpenAL support'
  'lib32-libidn11: for voice support'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support')
makedepends=('cmake' 'gcc' 'make' 'python-virtualenv' 'python2-pip' 'git' 'boost' 'xz')
conflicts=('firestorm-bin' 'firestorm-nightly' 'firestorm-beta-bin')
provides=('firestorm')
#options=(debug !strip)

source=("$pkgname"::"git+https://vcs.firestormviewer.org/phoenix-firestorm#branch=Firestorm_$pkgver" "fs-build-variables"::'git+https://vcs.firestormviewer.org/fs-build-variables' 'firestorm.desktop' 'firestorm.launcher')
md5sums=('SKIP' 'SKIP' '5e3dade65948533ff8412da776029179' '3daa9e24492337e62bcac318df4ab370')

pkgver() {
	cat $(find "$srcdir/$pkgname/indra/newview/" -type f -iname viewer_version.txt)
}

prepare() {
	export AUTOBUILD_VARIABLES_FILE="$srcdir/fs-build-variables/variables"
	cd "$pkgname"
	virtualenv ".venv" -p python3
	source .venv/bin/activate
	pip3 install git+https://vcs.firestormviewer.org/autobuild-3.0
	pip3 install llbase
	export CXXFLAGS="$CXXFLAGS -Wno-error"
	export CFLAGS="$CFLAGS -Wno-error"
	autobuild configure -A 64 -c ReleaseFS_open -- -DLL_TESTS:BOOL=FALSE -DREVISION_FROM_VCS=ON --chan="ArchLinux"
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
	mkdir -p "$pkgdir/opt"
	mkdir -p "$pkgdir/usr/share/applications"

	mv "$pkgname/build-linux-x86_64/newview/packaged" "$pkgdir/opt/firestorm"

	install -Dm644 "firestorm.desktop" "$pkgdir/usr/share/applications/firestorm.desktop"
	install -Dm755 "firestorm.launcher" "$pkgdir/usr/bin/firestorm"
}
