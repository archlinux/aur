# Maintainer: Tpaefawzen <GitHub: Tpaefaezen>

pkgname=misc-tools-git
pkgver=r285.244c657
pkgrel=3
pkgdesc="ShellShoccar-jpn's miscellaneous tools"
arch=(any)
url="https://github.com/ShellShoccar-jpn/misc-tools"
license=(custom:CC0)
groups=(shellshocar-jpn)
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/ShellShoccar-jpn/misc-tools"
	'rename-coreutils-util-linux.patch')
noextract=()
md5sums=('SKIP'
	'80df841296beaa5144df620f19e941f9')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 < "$srcdir"/rename-coreutils-util-linux.patch
	chmod a+x misc-tools-*
}

build() {
	cd "$srcdir/${pkgname%-git}"

# build C programs
	cd C_SRC
	./MAKE.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# list what to export
	for x in ./* ./C_SRC/*; do
		[[ -f $x && -x $x ]] || continue

		# should be updated when upstream repo's policy is changed
		case "$x" in *MAKE.sh|*.tmp|*.old) continue;; esac

		# finally
		install -Dm0755 -t "$pkgdir/usr/bin/" "$x"
	done

	# Also documentation
	install -Dm0644 -t "$pkgdir/usr/share/doc/${pkgname%-git}" README.md
	install -dm0755    "$pkgdir/usr/share/licenses/${pkgname%-git}"
	ln -s "../../doc/${pkgname%-git}/README.md" "$pkgdir/usr/share/licenses/${pkgname%-git}/README.md"
}
