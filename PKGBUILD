# Maintainer: Matt Coffin <mcoffin13@gmail.com>

pkgname=libscfg-git
# _pkgver='tag=v0.1.1?signed'
_pkgver='branch=master'
pkgver=0.1.1.r7.e2554a5
pkgrel=1
pkgdesc="A C library for scfg"
arch=(x86_64)
url="https://codeberg.org/emersion/libscfg.git"
license=('MIT')
groups=()
depends=()
makedepends=(git meson ninja zsh gyosu) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=(libscfg)
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=('staticlibs')
install=
source=("${pkgname%-git}::git+https://codeberg.org/emersion/libscfg.git#${_pkgver}")
noextract=()
b2sums=('SKIP')
validpgpkeys=(
	34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48 # Simon Ser
)

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	# cd "$srcdir/${pkgname%-git}"
	# printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

	git -C "$srcdir/${pkgname%-git}" describe --long \
		| awk -F '-' '{ sub(/^v/, ""); v = $1 ".r" $2 "." substr($3, 2); printf "%s", v; }'
}

prepare() {
	return 0
}

build() {
	arch-meson \
		-Ddefault_library=both \
		-Db_lto=false \
		"$srcdir/${pkgname%-git}" \
		"$srcdir/build"
	ninja -C "$srcdir/build" -v
	[ ! -e "$srcdir/docs" ] \
		|| rm -rf "$srcdir/docs" \
		&& mkdir -p "$srcdir/docs"
	find "$srcdir/${pkgname%-git}/include" -type f -name '*.h' -print0 \
		| xargs -0 gyosu \
		-I "$srcdir/${pkgname%-git}/include" \
		-ffile-prefix-map="$srcdir/${pkgname%-git}/include"/= \
		-o "$srcdir/docs"
}

check() {
	ninja -C "$srcdir/build" test
}

package() {
	DESTDIR="$pkgdir/" ninja -C "$srcdir/build" install
	[ -d "$pkgdir/usr/share/$pkgname" ] || mkdir -p "$pkgdir/usr/share/$pkgname"
	[ ! -e "$pkgdir/usr/share/$pkgname/docs" ] || rm -rf "$pkgdir/usr/share/$pkgname/docs"
	cp -r "$srcdir"/docs "$pkgdir"/usr/share/"$pkgname"/
	install -Dm0644 -t "$pkgdir"/usr/share/licenses/"$pkgname" "$srcdir/${pkgname%-git}/LICENSE"
}
