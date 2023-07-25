# Maintainer: Christoph Brill <egore911@gmail.com>
_pkgname=abstreet
pkgname=${_pkgname}-git
pkgver=r8262.ffb1f3a8cc
pkgrel=1
pkgdesc="A traffic simulation game exploring how small changes to roads affect everyone"
arch=('x86_64')
url="https://github.com/a-b-street/abstreet"
license=('Apache')
depends=('libxcb')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/a-b-street/abstreet.git"
	"$_pkgname.desktop")
sha256sums=('SKIP'
            '8c20072d6d4270c380207c738d773682450b2b060fcfda0f994cab522087327f')

pkgver()  {
	printf "r%s.%s" "$(git -C ${_pkgname} rev-list --count HEAD)" "$(git -C ${_pkgname} rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	cargo run --bin updater -- download --minimal
}

check() {
	cd "${srcdir}/${_pkgname}"
	env CARGO_INCREMENTAL=0 cargo test --release
}

package() {
	cd "${srcdir}/${_pkgname}"
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "$srcdir/abstreet.desktop"
	install -D -m644 "data/system/assets/pregame/icon.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
	install -D -m755 "target/release" "$pkgdir/usr/share/$_pkgname/game/game"
	install -d m644 "$pkgdir/usr/share/$_pkgname/data"
	cp -dpr --no-preserve=ownership data/system "$pkgdir/usr/share/$_pkgname/data/system"
}

