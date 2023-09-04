# Maintainer: John Bernard <loqusion@gmail.com>
_pkgname=hyprshade
pkgname=${_pkgname}-git
pkgver=0.9.3.r6.gf59e8c1
pkgrel=1
pkgdesc="Hyprland shade configuration tool"
arch=('any')
url="https://github.com/loqusion/$_pkgname"
license=('MIT')
_py_deps=(
	click
	more-itertools
	pdm
)
depends=(
	hyprland
	"${_py_deps[@]/#/python-}"
	util-linux
)
makedepends=(git python-installer)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+https://github.com/loqusion/${_pkgname}.git)
sha512sums=('SKIP')

prepare() {
	git -C "${srcdir}/${_pkgname}" clean -dfx
}

pkgver() {
	cd $_pkgname
	{
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	}
}

build() {
	cd $_pkgname
	pdm install --no-editable
	pdm build
	mkdir -p assets/completions
	export PYTHONPATH="./src"
	_HYPRSHADE_COMPLETE=bash_source pdm run hyprshade >assets/completions/hyprshade.bash
	_HYPRSHADE_COMPLETE=fish_source pdm run hyprshade >assets/completions/hyprshade.fish
	_HYPRSHADE_COMPLETE=zsh_source pdm run hyprshade >assets/completions/_hyprshade
}

package() {
	cd $_pkgname
	export PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/"
	/usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/shaders/" shaders/*
	install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/examples/" examples/*
	install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/" assets/completions/hyprshade.bash
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" assets/completions/hyprshade.fish
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" assets/completions/_hyprshade
}
