# Maintainer: Nicholas Yim <nickyim05@gmail.com>

_extname=beast
_pkgname=php-${_extname}
pkgname=${_pkgname}-git
pkgver=r357.250c49c
pkgrel=2
pkgdesc='PHP source code encrypt module'
arch=('x86_64')
url="https://github.com/liexusong/${_pkgname}"
license=('PHP')
depends=('php')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=()
install=
source=("$_pkgname"::"git+https://github.com/liexusong/$_pkgname.git")
md5sums=('SKIP')
packager="Nicholas Yim <nickyim05@gmail.com>"
backup=("etc/php/conf.d/$_extname.ini")

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "$_pkgname"
    phpize
    ./configure
    make
}

package() {
	cd "$_pkgname"
	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}
