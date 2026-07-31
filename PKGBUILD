#!/hint/bash
# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
pkgname=rhine-git
pkgver=r249.cc77e04
pkgrel=1
pkgdesc="A modular window manager for river"
arch=('x86_64')
url="https://codeberg.org/sivecano/rhine"
license=('GPL3')
depends=('libwayland-client.so' 'libdbus-1.so' 'river' 'glibc')
makedepends=('zig' 'libxkbcommon' 'git')
provides=('wayland-compositor' 'rhine')
conflicts=('rhine')
source=(${pkgname}::git+${url})
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	# add target and -Dcpu=baseline if building for others
	DESTDIR="build" zig build \
	--summary all \
	--prefix /usr \
	--search-prefix /usr \
	-Dpie=true \
	-Dnotify=true \
	-Doptimize=ReleaseSafe
}

package() {
	cd $pkgname

	cp -a build/* "$pkgdir"

	install -Dm644 README.asciidoc -t "$pkgdir/usr/share/$pkgname"
	install -Dm644 config.rh -t "$pkgdir/usr/share/$pkgname"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
# vim:set ts=8:
