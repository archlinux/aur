# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

pkg_ver=0.3.12

# Maintainer: Calacuda <youremail@domain.com>
pkgname=pentest-db-git
pkgver=0.3.12.r77f723a
pkgrel=1
epoch=
pkgdesc="a program to store and collect data during penetration tests"
arch=(x86_64 aarch64)
url="https://github.com/calacuda/PenTestDB"
license=('MIT')
groups=()
depends=()
makedepends=(git rust)
checkdepends=()
optdepends=()
provides=(ptdb)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()


pkgver() {
	cd "$srcdir/$_pkgname/PenTestDB"
	# printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	printf "$pkg_ver.r%s" "$(git show --oneline -s | cut -d ' ' -f 1)"
}

build() {
	cd "$srcdir/$_pkgname/PenTestDB"
 	cargo build --release --target-dir target
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	cd "$srcdir/$_pkgname/PenTestDB"

	install -Dm 755 target/release/ptdb "${pkgdir}/usr/bin/ptdb"

	mkdir -p "${pkgdir}"/etc/ptdb/parsers
	mkdir -p "${pkgdir}"/etc/skel/.config/ptdb/

	install -Dm 644 configs/etc/ptdb/make-db.sql "${pkgdir}/etc/ptdb/make-db.sql"
	install -Dm 644 configs/etc/ptdb/templates.toml "${pkgdir}/etc/ptdb/templates.toml"
	install -Dm 755 configs/etc/ptdb/parsers/* "${pkgdir}/etc/ptdb/parsers/"
	cp -r configs/.config "${pkgdir}/etc/ptdb/"
	cp -r configs/.config/ptdb/* "${pkgdir}/etc/skel/.config/ptdb/"
	install -Dm 755 shell/ptdb_start.sh "${pkgdir}/etc/ptdb/ptdb_start.sh"
	install -Dm 755 shell/ptdb_start.sh "${pkgdir}/etc/skel/.ptdb_start.sh"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -d "$pkgdir/usr/share"
}
