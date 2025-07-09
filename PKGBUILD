# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=mbake
_pkgname=${pkgname#m}
pkgver=1.2.4.post2
pkgrel=2
pkgdesc='A Python-based Makefile formatter and linter'
arch=(any)
license=(MIT)
url="https://github.com/EbodShojaei/$_pkgname"
_pydeps=(rich
         tomli
         typer)
depends=(python
        "${_pydeps[@]/#/python-}")
makedepends=(git
             python-{build,installer,wheel}
             python-hatchling)
provides=("python-$pkgname=$pkgver")
source=("git+$url.git#tag=v$pkgver")
sha256sums=('098a91a16ae2ca732754cc6d8da337ae3b59e5447241569f531d2a28b87576d2')

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
		PYTHONPATH="$pkgdir/$_site_packages" "$pkgdir/usr/bin/$pkgname" completions $1 |
			install -Dm0644 /dev/stdin "$pkgdir/$2"
	}
	_comp_inst bash "usr/share/bash-completion/completions/$pkgname"
	_comp_inst fish "usr/share/fish/vendor_completions.d/$pkgname.fish"
	_comp_inst zsh  "usr/share/zsh/site-functions/_$pkgname"
}
