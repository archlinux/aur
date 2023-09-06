# Maintainer: John Bernard <loqusion@gmail.com>
_pkgname=hyprshade
pkgname=${_pkgname}-git
pkgver=0.10.1.r1.gd976e0b
pkgrel=1
pkgdesc="Hyprland shade configuration tool"
arch=('any')
url="https://github.com/loqusion/$_pkgname"
license=('MIT')
_py_deps=(
	click
	more-itertools
)
depends=(
	hyprland
	"${_py_deps[@]/#/python-}"
	util-linux
)
makedepends=(git python-{build,hatchling,installer})
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

_get_wheel() {
	local wheel=
	local file
	for file in ./dist/${_pkgname}-*.whl; do
		if [ -n "$wheel" ]; then
			echo "Multiple wheels found: $wheel and $file" >&2
			exit 1
		fi
		wheel=$file
	done
	echo "$wheel"
}

build() {
	cd $_pkgname
	/usr/bin/python -m build --wheel --no-isolation
	mkdir -p assets/completions
	local wheel=$(_get_wheel)
	export PYTHONPATH="$wheel"
	_HYPRSHADE_COMPLETE=bash_source /usr/bin/python "$wheel/$_pkgname" >assets/completions/$_pkgname.bash
	_HYPRSHADE_COMPLETE=fish_source /usr/bin/python "$wheel/$_pkgname" >assets/completions/$_pkgname.fish
	_HYPRSHADE_COMPLETE=zsh_source /usr/bin/python "$wheel/$_pkgname" >assets/completions/_$_pkgname
}

package() {
	cd $_pkgname
	export PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/"
	/usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/$_pkgname/examples/" examples/*
	install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/" assets/completions/$_pkgname.bash
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" assets/completions/$_pkgname.fish
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" assets/completions/_$_pkgname
}
