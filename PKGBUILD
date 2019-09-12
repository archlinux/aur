# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Joel Shapiro <jshapiro at nvidia dot com>

pkgname=nvidia-container-toolkit

pkgver=1.0.4
pkgrel=1
# the 3.1.3 tag got removed for unknown reasons, use commit for now :(
#_runtime_pkgver=3.1.3
_commit=2fc9b4b1df98b803f3ce5f3bfbad113ff39bb6da

pkgdesc='NVIDIA container runtime toolkit'
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-container-runtime'
license=('BSD')

makedepends=('go')
depends=('libnvidia-container-tools' 'docker>=1:19.03')
conflicts=('nvidia-container-runtime-hook' 'nvidia-container-runtime<2.0.0')
replaces=('nvidia-container-runtime-hook')

source=("https://github.com/NVIDIA/nvidia-container-runtime/archive/${_commit}.tar.gz")
sha256sums=('eb467f5b75f8c9eca6b7fb9a4c97db809e3912ce402a44adabf5348f9f4f9565')

#_srcdir="nvidia-container-runtime-${_runtime_pkgver}"
_srcdir="nvidia-container-runtime-${_commit}"

prepare() {
  mkdir -p gopath/src
  ln -rTsf "${_srcdir}/toolkit/${pkgname}" "gopath/src/$pkgname"
}

build() {
  GOPATH="${srcdir}/gopath" go install \
                            -buildmode=pie \
                            -gcflags "all=-trimpath=${PWD}" \
                            -asmflags "all=-trimpath=${PWD}" \
                            -ldflags "-extldflags ${LDFLAGS}" \
                            "$pkgname"
                            #-ldflags " -s -w -extldflags=-Wl,-z,now,-z,relro" \
}

package() {
  install -D -m755 "${srcdir}/gopath/bin/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  pushd "$pkgdir/usr/bin/"
  ln -sf "${pkgname}" "nvidia-container-runtime-hook"
  popd
  install -D -m644 "${_srcdir}/toolkit/config.toml.centos" "$pkgdir/etc/nvidia-container-runtime/config.toml"

  install -D -m644 "${_srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
