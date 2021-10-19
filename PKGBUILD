# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-semshi-git
pkgver=r110.252f07f
pkgrel=1
pkgdesc="Semantic highlighting for Python in Neovim"
arch=('any')
url="https://github.com/numirias/semshi"
license=('unknown')
groups=('neovim-plugins')
depends=('neovim>=0.5.0' 'python-pynvim')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=semshi.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 plugin/semshi.vim -t "$pkgdir/usr/share/nvim/runtime/plugin/"
	local _sitepkgs="$(python -c 'from site import getsitepackages as g; print(g()[0])')"
	install -d "$pkgdir/usr/share/nvim/runtime/rplugin/python3/"
	ln -s "${_sitepkgs}/semshi/" "$pkgdir/usr/share/nvim/runtime/rplugin/python3/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
