# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mbake-git
pkgver=1.3.0.r0.gf4b1c9f
pkgrel=1
pkgdesc='A Python-based Makefile formatter and linter'
arch=(any)
license=(MIT)
url="https://github.com/EbodShojaei/bake"
_pkgname=${url##*/}
_pydeps=(rich
         tomli
         typer)
depends=(python
        "${_pydeps[@]/#/python-}")
makedepends=(git
             python-{build,installer,wheel}
             python-hatchling)
provides=("${pkgname%-git}=$pkgver"
          "python-${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}"
           python-bake)
replaces=(python-bake-git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python -m build -wn
}

package () {
	cd "$_pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	# So we don't conflict with ruby-bake
	rm -f "$pkgdir/usr/bin/bake"
	local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	_comp_inst () {
		PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir/usr/bin/$_pkgname" completions $1 |
			install -Dm0644 /dev/stdin "$pkgdir/$2"
	}
	_comp_inst bash "usr/share/bash-completion/completions/$_pkgname"
	_comp_inst fish "usr/share/fish/vendor_completions.d/$_pkgname.fish"
	_comp_inst zsh  "usr/share/zsh/site-functions/_$_pkgname"
}
