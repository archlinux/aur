# Maintainer: Justin Jagieniak <justin@jagieniak.net>
# Contributor: Nicky D

pkgname=firestorm-nightly
pkgver=r57620.595189b1b1da
pkgrel=1
pkgdesc="Firestorm is FOSS where you can build & share Virtual Reality (VR) in OpenSim/SecondLife (P2P). Meet people in 3D! Source build."
arch=('i686' 'x86_64')
url=https://www.firestormviewer.org/
license=('LGPL')
depends=(dbus-glib gconf glu gtk2 lib32-libidn lib32-libsndfile lib32-util-linux lib32-zlib libgl libidn libjpeg-turbo libpng libxss libxml2 mesa nss openal sdl vlc zlib)
optdepends=(
  'alsa-lib: for ALSA support'
  'pepper-flash: for inworld Flash support'
  'freealut: for OpenAL support'
  'gstreamer: For video support - may need good, bad and ugly plugins'
  'lib32-libidn11: for voice support'
  'libpulse: for PulseAudio support'
  'mesa-libgl: For Intel, Radeon, Nouveau support'
  'nvidia-libgl: for NVIDIA support'
  'nvidia-utils: for NVIDIA support')
makedepends=('cmake' 'gcc' 'python2-virtualenv' 'python2-pip' 'mercurial')
conflicts=('firestorm-bin' 'firestorm' 'firestorm-beta')
provides=('firestorm-nightly')

source=("$pkgname"::'hg+http://hg.phoenixviewer.com/phoenix-firestorm-lgpl' 'autovars' 'firestorm.desktop' 'firestorm.launcher' 'dontTarSelf.patch')
md5sums=('SKIP' '7245883fbdba303d4f827f60907574c6' '5e3dade65948533ff8412da776029179' '3daa9e24492337e62bcac318df4ab370' '5ce1e87b6cbdd300d52906de7444f264')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
	virtualenv2 "$pkgname"
	export AUTOBUILD_VARIABLES_FILE="$srcdir/autovars"

	cd "$pkgname"
	source bin/activate
	pip install --upgrade autobuild

	autobuild configure -A 64 -c ReleaseFS_open -- -DLL_TESTS:BOOL=FALSE
	cd indra/newview
	patch -Np0 -i "$srcdir/dontTarSelf.patch"
}

build() {
    export AUTOBUILD_VARIABLES_FILE="$srcdir/autovars"
    cd "$pkgname"
    source bin/activate
    
    autobuild build -A 64 -c ReleaseFS_open -- -Dchan=Linux-Nightly
}

package() {
    mkdir -p "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/share/applications"
    
    mv "$pkgname/build-linux-x86_64/newview/packaged" "$pkgdir/opt/firestorm"
    
    install -Dm644 "firestorm.desktop" "$pkgdir/usr/share/applications/firestorm.desktop"
    install -Dm755 "firestorm.launcher" "$pkgdir/usr/bin/firestorm"
}

