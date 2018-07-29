# Maintainer: BrainDamage
pkgname="authsae-git"
pkgrel=2
pkgver=20180729.3d4bd45
pkgdesc="Authsae provides secure password-based authentication for 802.11s mesh networking."
arch=('x86' 'x86_64')
url="https://github.com/cozybit/authsae"
license=("BSD")
depends=("openssl" "libconfig")
makedepends=("git" "cmake")
provides=("authsae")
conflicts=("authsae")
md5sums=("SKIP")
source=("git+https://github.com/cozybit/authsae.git")

pkgver() {
	cd "$srcdir/authsae"
	#uuuugly code to use date + current git hash in lieu of absent release tag
	echo "$(date +%Y%m%d).$(git describe --always)"
}

prepare() {
  cd "$srcdir/authsae"
  msg "Removing '-Werror' from 'CMakeLists.txt'"
  sed -e 's|\-Werror||' -i CMakeLists.txt
}

build() {
	cd "$srcdir/authsae"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	#FIXME: the cmake script does something very wrong and attempts to install the config file in prefix+/etc, submit patch to upstream to allow to change that
	sed -i 's/\/usr\/etc/\/etc/' cmake_install.cmake
	make
}

package() {
	cd "$srcdir/authsae"
	make DESTDIR=$pkgdir install
	install -D README "$pkgdir/usr/share/authsae/README"
}