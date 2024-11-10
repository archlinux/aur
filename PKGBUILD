# Maintainer: gigamicro <gammamicro@gmail.com>
_pkgver=2
_pkgname=smaz$_pkgver
pkgname="$_pkgname-git"
pkgdesc='compression for very short messages'
pkgver=2.9.g71ecc43
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/antirez/$_pkgname"
license=(MIT)
#depends=()
makedepends=(git)
provides=("$_pkgname")
source=("$_pkgname::git+$url.git" example.c smaz2.c.patch)
sha256sums=(SKIP 709aa5ff17a83368bbfe34c932b0e9b2fc147a8f31f5ca133071a4fbd99129cd 34c7dbebfe92bbf368f5134c6d32440d2e98f5d30ac19a572769900e4a785056)

prepare() {
	ln -ft "$_pkgname" example.c
	git -C "$_pkgname" apply ../smaz2.c.patch
}

pkgver() {
	printf %s.%s.g%s "$_pkgver" \
	"$(git -C "$srcdir/$_pkgname" rev-list  --count HEAD)" \
	"$(git -C "$srcdir/$_pkgname" rev-parse --short HEAD)"
}

build() { make smaz2 -C "$srcdir/$_pkgname"; }

check() {
	"$srcdir/$_pkgname/smaz2"<"$srcdir/$_pkgname/README.md"|"$srcdir/$_pkgname/smaz2" -d|diff -q - "$srcdir/$_pkgname/README.md"
	"$srcdir/$_pkgname/smaz2"<"$srcdir/$_pkgname/smaz2.c"  |"$srcdir/$_pkgname/smaz2" -d|diff -q - "$srcdir/$_pkgname/smaz2.c"
}

package() {
	install -Dvm755 -t "$pkgdir"/usr/bin/ \
	"$srcdir/$_pkgname/$_pkgname"
}
