# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=alac
pkgname=$_pkgname-git
pkgver=0.r3.35e1d01
pkgrel=1
pkgdesc="an audio codec developed by Apple and supported on iPhone, iPad, most iPods, Mac and iTunes"
arch=('i686' 'x86_64')
url="https://alac.macosforge.org/"
license=('custom')
depends=('gcc-libs')
makedepends=('git')
provides=("$_pkgname" "$_pkgname-svn" 'alacconvert' 'libalac')
conflicts=("$_pkgname" "$_pkgname-svn" 'alacconvert' 'libalac')
source=("$_pkgname::git+git://git.macosforge.org/alac.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
	sed -i 's/LFLAGS) $(OBJS) -o alacconvert/OBJS) -o alacconvert $(LFLAGS)/' convert-utility/makefile
	sed -i 's/CFLAGS =/CFLAGS := $(CFLAGS)/' {codec,convert-utility}/makefile
}

build() {
  cd "$_pkgname"
	CFLAGS=-Wno-multichar make -C convert-utility
}

package() {
  cd "$_pkgname"
	install -Dm755 convert-utility/alacconvert "$pkgdir/usr/bin/alacconvert"
	install -Dm644 codec/APPLE_LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
