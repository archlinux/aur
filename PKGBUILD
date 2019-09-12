# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=nvidia-container-runtime

pkgver=3.1.3
pkgrel=1
# the 3.1.3 tag got removed for unknown reasons, use commit for now :(
_commit=2fc9b4b1df98b803f3ce5f3bfbad113ff39bb6da

pkgdesc='NVIDIA opencontainer runtime fork to expose GPU devices to containers.'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('BSD')

makedepends=('go')
depends=('libseccomp' 'nvidia-container-toolkit<2.0.0')

source=("https://github.com/NVIDIA/${pkgname}/archive/${_commit}.tar.gz")
sha256sums=('eb467f5b75f8c9eca6b7fb9a4c97db809e3912ce402a44adabf5348f9f4f9565')

#_srcdir="${pkgname}-${pkgver}"
_srcdir="${pkgname}-${_commit}"

prepare() {
  mkdir -p gopath/src
  ln -rTsf "${_srcdir}/runtime/src" "gopath/src/${pkgname}"
}

build() {
  GOPATH="${srcdir}/gopath" go install \
                            -buildmode=pie \
                            -gcflags "all=-trimpath=${PWD}" \
                            -asmflags "all=-trimpath=${PWD}" \
                            -ldflags "-extldflags ${LDFLAGS}" \
                            "$pkgname"
}

package() {
  install -D -m755 "${srcdir}/gopath/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${_srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
