#Maintainer: Alessandro Bernardello <abernardello at disroot dot org>
pkgname=bindtointerface-git
pkgver=r14.d477326
pkgrel=1
arch=("x86_64")
pkgdesc="With this program you can bind applications to a specific network interface / network adapter."
url="https://github.com/JsBergbau/BindToInterface"
license=('AGPL3')
source=("git+https://github.com/JsBergbau/BindToInterface.git")
sha256sums=('SKIP')
provides=("bindtointerface")
conflicts=("bindtointerface")
makedepends=('git' 'gcc')

build() {
    cd "$srcdir/BindToInterface"
	gcc \
	-nostartfiles \
	-fpic \
	-shared bindToInterface.c \
	-o bindToInterface.so \
	-ldl \
	-D_GNU_SOURCE
}

pkgver() {
  cd "$srcdir/BindToInterface"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
    cd "$srcdir/BindToInterface"
	install -Dm755 "./bindToInterface.so" "$pkgdir/usr/lib/bindToInterface.so"
	ln -s "bindToInterface.so" "$pkgdir/usr/lib/bindtointerface.so"
}
