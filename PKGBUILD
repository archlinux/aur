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
source=("${pkgname%-git}::git+https://github.com/ShellShoccar-jpn/misc-tools")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Rename coreutils things
	mv base64 misc-tools-base64
	mv mktemp misc-tools-mktemp
	mv seq misc-tools-seq
	mv truncate misc-tools-truncate
	mv C_SRC/sleep.c C_SRC/misc-tools-sleep.c

	# Rename util-linux things
	mv rev misc-tools-rev

	# We don't need these things
	rm *.tmp *.old

	# TODO: fsed confliction against open-usp-tukubai
}

build() {
	cd "$srcdir/${pkgname%-git}"


	# build C programs
	cd C_SRC
	chmod a+x MAKE.sh
	./MAKE.sh
	chmod a-x MAKE.sh
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# list what to export
	for x in ./* ./C_SRC/*; do
		[[ -f $x && -x $x ]] || continue

		# finally
		install -Dm0755 -t "$pkgdir/usr/bin/" "$x"
	done

	# Also documentation
	install -Dm0644 -t "$pkgdir/usr/share/doc/${pkgname%-git}" README.md
	install -dm0755    "$pkgdir/usr/share/licenses/${pkgname%-git}"
	ln -s "../../doc/${pkgname%-git}/README.md" "$pkgdir/usr/share/licenses/${pkgname%-git}/README.md"
}
