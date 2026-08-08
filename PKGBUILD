# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=sooperlooper.lv2-git
pkgdesc="A LV2 version of the old LADSPA SooperLooper plugin."
pkgver=r61.edcc0d4
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/moddevices/sooperlooper-lv2-plugin"
license=(GPL)
groups=()
depends=()
makedepends=('git' 'lv2')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(sooperlooper.lv2-git::git+https://github.com/moddevices/sooperlooper-lv2-plugin)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$pkgname"
  git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	# ./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
	# Makefile doesn't install TTL files — do it manually
	for d in sooperlooper sooperlooper-2x2; do
		install -Dm644 "$d/src/manifest.ttl" "$pkgdir/usr/lib/lv2/$d.lv2/manifest.ttl"
		install -Dm644 "$d/src/sooperlooper.ttl" "$pkgdir/usr/lib/lv2/$d.lv2/sooperlooper.ttl"
	done
}
