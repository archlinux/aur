# Maintainer: mia <mia@mia.jetzt>
_pkgname=revo
pkgname=${_pkgname}-git
pkgver=0.0.1a.053c50b
pkgrel=1
pkgdesc="a dynamic language for the joy of programming"
url="https://gills.pages.dev/revo"
source=("git+https://github.com/if-not-nil/revo" "git+https://github.com/jart/bestline.git")
arch=("x86_64")
license=("MIT")
makedepends=("zig>=0.16.0" pcre2)
sha256sums=(SKIP SKIP)

build() {
	cd "$srcdir/$_pkgname"
	git config submodule.vendor.url "$srcdir/bestline"
	git -c protocol.file.allow=always submodule update
	zig build -Doptimize=ReleaseFast
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 ./zig-out/bin/revo "$pkgdir/usr/bin/revo"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  echo -n "$(cat build.zig | pcre2grep -o1 'const VERSION = \"(.*)\";').$(git rev-parse HEAD | head -c7)"
}
