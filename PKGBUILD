# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>
# Contributor: Axper Jan <483ken _at_ gmail
_gitname=udis86
pkgname=lib32-${_gitname}-git
pkgver=1.7.2.186.g5336633
pkgrel=1
pkgdesc="Disassembler library for x86 (32-bit shared library)"
arch=('x86_64')
url="http://${_gitname}.sourceforge.net"
license=('custom:BSD-2-clause')
depends=(lib32-glibc)
makedepends=(cmake git lib32-gcc-libs python)
provides=(libudis86.so lib32-${_gitname} deepin-udis86)
conflicts=(lib32-${_gitname})
source=(git+https://github.com/canihavesomecoffee/${_gitname}.git?signed)
sha512sums=('SKIP')
validpgpkeys=('A5DD905196EF3973280DA13CB965BC5D279F42ED') ## canihavesomecoffee

# To fetch the gpg key:
# $ curl https://github.com/canihavesomecoffee.gpg | gpg --import

CFLAGS+=" -m32"
PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

pkgver() {
  cd ${_gitname}
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g;s|^v||'
}

prepare() {
	cd "$_gitname"
	./autogen.sh
}

build() {
	cd "$_gitname"
	./configure \
    --program-suffix="-32" \
    --lib{exec,}dir=/usr/lib32 \
    --includedir=/usr/include/"$_gitname"-32 \
    --build=i686-pc-linux-gnu \
		--prefix=/usr \
		--with-python=/usr/bin/python \
		--enable-shared
	make
}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  rm -r "$pkgdir"/usr/share/doc
}
