# Maintainer: John Bernard <loqusion@gmail.com>
pkgname=hyprshade
pkgver=0.10.0
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
provides=($pkgname)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
		"https://raw.githubusercontent.com/loqusion/$pkgname/v$pkgver/shaders/blue-light-filter.glsl"
		"https://raw.githubusercontent.com/loqusion/$pkgname/v$pkgver/shaders/vibrance.glsl"
		"https://raw.githubusercontent.com/loqusion/$pkgname/v$pkgver/examples/config.toml")
sha256sums=('2a0be0f0057bc8386beaf387787a5ee8a7bdb0ab0b54b19aeedad2cb551aeadb'
            'd547a819a41c91ce0d0a44508b5467c542f7d0f46e395d5fe07dd7970d7bb1b8'
            '2e099ef86bab2e5a0c118a415460a744b52cc29e960a0240b8fb470193c5ed6c'
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
	mkdir -p shaders examples
	cp ../{blue-light-filter,vibrance}.glsl shaders/
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
	install -Dm0644 -t "$pkgdir/usr/share/bash-completion/completions/" assets/completions/$pkgname.bash
	install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d/" assets/completions/$pkgname.fish
	install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions/" assets/completions/_$pkgname
}
