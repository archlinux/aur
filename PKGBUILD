# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

pkgname=vim-gdscript-git
gitname=vim-gdscript3
pkgver=r151.ebfa25f
pkgrel=1
pkgdesc="Vim syntax highliting for the Godot Game Engine scripting language GDScript"
arch=('any')
license=('custom:MIT')
url="https://github.com/clktmr/$gitname"
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$gitname"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	local vim_file="gdscript3.vim"
	local vim_share="/usr/share/vim/vimfiles"

	cd "$srcdir/$gitname"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv LICENSE "$pkgdir/usr/share/licenses/$pkgname"

	# Remove useless data
	rm README.md
	rm screenshot.png

	mkdir -p "$pkgdir/$vim_share"
	cp -r * "$pkgdir/$vim_share"

	# Compile all the python scripts into bytecode
	python3 -m compileall "$pkgdir" || :
}

