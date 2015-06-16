# Maintainer: Your Name <petar.petrov.georgiev@gmail.com>
pkgname=savagewheels
pkgver=1.6.0
pkgrel=1
pkgdesc="Savage Wheels is a 2D car crashing arcade game similar to the old classic Destruction Derby."
arch=('i686' 'x86_64')
url="https://code.google.com/p/savagewheels/"
license=('MIT')
groups=()
depends=('cmake' 'sdl' 'sdl_mixer')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/petarov/savagewheels/archive/v$pkgver.tar.gz https://savagewheels.googlecode.com/files/savagewheels-gamedata.tar.gz)
noextract=(savagewheels-gamedata.tar.gz)
md5sums=('8154fe4ba5471dac31319b93d247785e'
         '98f2c9750c0dab008fbb74fa97a5f10d')

if [ "${CARCH}" = 'x86_64' ] ; then
	_arch='x64'
else
	_arch="x86"
fi

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	echo Extracting binary resources ...
	binfile="savagewheels-gamedata.tar.gz"
	cd bin
	tar zxf ../../../$binfile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cd release
	cmake -G "Unix Makefiles" ../ -DCMAKE_BUILD_TYPE:STRING=Release
	make
	cpack -G TGZ
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	cd release
	if [ ! -f savagewheels ]; then
	  echo "Binary not found! Is compile successful?"
	fi
}

package() {
	install -d "$pkgdir/opt"
	
	install_name="savagewheels-$pkgver-Linux-$_arch"
	tgzfile="$install_name.tar.gz"
	cd "$srcdir/$pkgname-$pkgver/release"
	tar zxf $tgzfile -C "$pkgdir/opt"
	
	cd "$pkgdir/opt"
	mv $install_name $pkgname
}
