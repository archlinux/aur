# Maintainer: John Bernard <loqusion@gmail.com>
pkgname=hyprshade
pkgver=2.0.1
pkgrel=1
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
makedepends=(git python-{build,hatchling,installer})
optdepends=('systemd: activate shader on schedule')
provides=($pkgname)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
		"https://raw.githubusercontent.com/loqusion/$pkgname/$pkgver/examples/config.toml")
sha256sums=('9539934760de683d1906d5fbdd2cb2d512aa04d0c77c1698c37c1176d6dcec72'
            '411517f06dc484fb8aad729d73d66cb5b91982ac0c5908184ec9343974392f0a')

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
	mkdir -p examples
	cp ../config.toml examples/

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
	install -Dm0644 -t "$pkgdir/usr/share/$pkgname/examples/" examples/*
	install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/" assets/completions/$pkgname.bash
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" assets/completions/$pkgname.fish
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" assets/completions/_$pkgname
}
