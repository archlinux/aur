# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=alac
pkgname=$_pkgname-git
pkgver=0.r5.c38887c
pkgrel=1
pkgdesc="a lossless audio codec developed by Apple and deployed on all of its platforms and devices"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://macosforge.github.io/alac"
license=('custom')
makedepends=('git')
provides=("$_pkgname" "$_pkgname-svn" 'alacconvert' 'libalac')
conflicts=("$_pkgname" "$_pkgname-svn" 'alacconvert' 'libalac')
source=("$_pkgname::git+https://github.com/macosforge/alac.git")
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
