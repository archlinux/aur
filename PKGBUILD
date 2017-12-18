# Maintainer: Terin Stock <terinjokes@gmail.com>
# Contributor: Tom Tobin <archlinux@tomxtobin.com>

pkgname=dep
pkgver=0.3.2
pkgrel=1
_commitHash="8ddfc8afb2d520d41997ebddd921b52152706c01"
pkgdesc="Go dependency tool"
arch=('x86_64' 'i686')
url="https://github.com/golang/dep"
license=('BSD')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
provides=("dep")
source=("https://github.com/golang/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('327124953d76293eaba6001e17bb8a31371313ab39eed1fa9eac01f8b5c1de21')

_importpath='github.com/golang/dep'
_ldflags="-s -w -X main.buildDate=$(date "+%Y-%m-%d") -X main.commitHash=${_commitHash} -X main.Version=v${pkgver}"

prepare() {
  if [[ ! -r ${_importpath} ]]; then
    mkdir -p "src/$(dirname "${_importpath}")"
    ln -sf  "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/${_importpath}"
  fi
}

build() {
  export GOPATH="$srcdir"
  go install -ldflags="${_ldflags}" "${_importpath}/cmd/dep"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "../bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
