# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=fanctl-git
pkgver=0.5.1.r2.578f7d1
pkgrel=3
pkgdesc="Replacement for fancontrol with more approachable and powerful config interface"
arch=('x86_64')
url="https://gitlab.com/mcoffin/fanctl"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('fanctl::git+https://gitlab.com/mcoffin/fanctl.git#branch=master'
        fanctl.service)
noextract=()
sha512sums=('SKIP'
            '973eb426edc2b6cb452bb4b241d78b31573baf215a530fe936847a6910c82c5f38e19ffe521c95d6c56c55e25142e03d4617f7ed25b82165dd857fabc8dc9ae6')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# legacy
	# printf "%s" "$((git get-version -a -v 2>/dev/null || git describe --long) | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

	# Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

	# Git, no tags available
	# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

	# Git, tags available (mcoffin edits to remove "v" prefix used in git tags
	local _tmpver="$(printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')")"
	echo -e "${_tmpver#v}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	env CARGO_INCREMENTAL=0 \
		cargo build --release --locked
}

package() {
	cd "$srcdir/${pkgname%-git}"
	# cargo install --path . --root "$pkgdir/usr" --bins
	# for f in "$pkgdir/usr/"{.crates.toml,.crates2.json}; do
	# 	if [ -e $f ]; then
	# 		rm $f
	# 	fi
	# done
	install -D -m 755 -t "$pkgdir/usr/bin" target/release/fanctl
	install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" ./COPYING
	install -D -m 644 fanctl.yml "$pkgdir/usr/share/fanctl.example.yml"
	install -D -m 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/fanctl.service"
}
