# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=unblob-git
_pkgname=${pkgname%-git}
pkgver=0.0.0.r1226.g639ec9a
pkgrel=1
pkgdesc='Extract files from any kind of container formats'
arch=(any)
url="https://github.com/onekey-sec/$_pkgname"
license=(MIT)
_py_deps=(arpy
          attrs
          click
          cstruct
          dissect.cstruct
          pyperscan # pyperscan replaces hyperscan (brings vectorscan too)
          # see : https://github.com/onekey-sec/unblob/pull/411#issuecomment-1555961215
          jefferson
          lark-parser
          lief
          lz4
          plotext
          pluggy
          python-lzo
          magic
          rarfile
          structlog
          ubi-reader
          treelib
          blob-native)
# yaffshiv removed see : https://github.com/onekey-sec/unblob/pull/513
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(git
             git-lfs
             python-{build,installer,wheel}
             python-poetry)

# git clone using source array
# Fails with git-lfs error
prepare() {
    rm -rf $_pkgname
    git clone $url $_pkgname
}

pkgver() {
	cd "$_pkgname"
    git tag v0.0.0 1958a226e2ffe86262ddd5a8e8f87a0f98816cdf^
	  git describe --long --abbrev=7 --tags --match="v*" |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python -m build -wn
}

package() {
	cd "$_pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
