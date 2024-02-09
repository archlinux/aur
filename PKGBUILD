# Maintainer: dreieck

_pkgname=nokiatool-mtk
pkgname="${_pkgname}"
pkgver=20230812T185930
pkgrel=1
pkgdesc='Simple interface Bash script to control MediaTek-based Nokia simple phones. !! Read README.md before usage. !!'
arch=('any')
url="https://gist.github.com/plugnburn/5b2582be521944f739e1"
license=('custom: unknown.')
depends=(
  'bash'
)
makedepends=(
  'curl'
)
optdepends=()
provides=()
conflicts=()
replaces=()
source=(
  "nokiatool.sh::${url}/raw/nokiatool.sh"
  "README.md::${url}/raw/README.md"
  "nokiatool-archpackage.patch"
  "license-dummy.txt"
)
sha256sums=(
  '7cd8cc4e8c5121e9b423d433a4b1cdf29b4e3dd077972a2d194028a468042995'
  'dbdc81409df13c60ae404c8d0e90d1f15b7f62c56c5bb715145d377fd08858ba'
  '3e780ccc3c36bb27b2336b5a516d5f59c0ea3715a1651485009326b987a47435'
  '340b8388afef3de4eb536574d6a43afd91e3576bd1faa77d7b6c95e0dbe43bf6'
)

prepare() {
  if [ -d "${srcdir}/build" ]; then
    rm -f "${srcdir}/build"/*
    rmdir "${srcdir}/build"
  fi
  mkdir "${srcdir}/build"
}

pkgver() {
  curl -s "${url}/revisions" | grep -F -m 1 'this gist <relative-time' | sed -E 's|^.*<relative-time.+datetime="([^"]*)".*$|\1|' | tr -d '\-:Z'
}

build() {
  patch -N --follow-symlinks -i "${srcdir}/nokiatool-archpackage.patch" -o "${srcdir}/build/nokiatool.sh" "${srcdir}/nokiatool.sh"
}

package() {
  install -D -v -m755 "${srcdir}/build/nokiatool.sh" "${pkgdir}/usr/bin/nokiatool-mtk"

  for _docfile in "${srcdir}/README.md"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -D -v -m644 "${srcdir}/license-dummy.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license-dummy.txt"
}
