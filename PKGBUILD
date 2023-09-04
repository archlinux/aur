# Maintainer: John Bernard <loqusion@gmail.com>
pkgname=hyprshade
pkgver=0.9.3
pkgrel=2
pkgdesc="Hyprland shade configuration tool"
arch=('any')
url="https://github.com/loqusion/$pkgname"
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
makedepends=(git python-{build,installer,pdm-backend})
provides=($pkgname)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9da46b90e979c867201086f7cc2bea7dd0c26a9f7914183e40ef7ef530821d96')

_get_wheel() {
	local wheel=
	local file
	for file in ./dist/${pkgname}-*.whl; do
		if [ -n "$wheel" ]; then
			echo "Multiple wheels found: $wheel and $file" >&2
			exit 1
		fi
		wheel=$file
	done
	echo "$wheel"
}

build() {
	cd "$pkgname-$pkgver"
	/usr/bin/python -m build --wheel --no-isolation
	mkdir -p assets/completions
	local wheel=$(_get_wheel)
	export PYTHONPATH="$wheel"
	_HYPRSHADE_COMPLETE=bash_source /usr/bin/python "$wheel/$pkgname" >assets/completions/$pkgname.bash
	_HYPRSHADE_COMPLETE=fish_source /usr/bin/python "$wheel/$pkgname" >assets/completions/$pkgname.fish
	_HYPRSHADE_COMPLETE=zsh_source /usr/bin/python "$wheel/$pkgname" >assets/completions/_$pkgname
}

package() {
	cd "$pkgname-$pkgver"
	export PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/"
	/usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 -t "$pkgdir/usr/share/$pkgname/shaders/" shaders/*
	install -Dm0644 -t "$pkgdir/usr/share/$pkgname/examples/" examples/*
	install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/" assets/completions/$pkgname.bash
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" assets/completions/$pkgname.fish
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" assets/completions/_$pkgname
}
