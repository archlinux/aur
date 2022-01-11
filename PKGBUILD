# Maintainer: Kien Dang <mail at kien dot ai>
# Maintainer: Julie Shapiro <jshapiro at nvidia dot com>

pkgname=nvidia-container-runtime

# Author's note
# I am so mad that this cannot be a split package with nvidia-container-toolkit
# due to it needing a different pkgver. That said, now that the code for this
# runtime has been moved into the toolkit repo, this file is basically
# identical to nvidia-container-toolkit's PKGBUILD.

pkgver=3.7.0
pkgrel=2

toolkit_ver=1.7.0

pkgdesc='NVIDIA opencontainer runtime fork to expose GPU devices to containers.'
arch=('x86_64')
# see note above.
url='https://github.com/NVIDIA/nvidia-container-toolkit'
license=('APACHE')

makedepends=('go')
depends=('libseccomp' 'nvidia-container-toolkit>=1.7.0')

source=("v${pkgver}-${pkgrel}.tar.gz"::"${url}/archive/v${toolkit_ver}.tar.gz")
sha256sums=('f096b2db7cc837164e9739fc31680ff7c1f4135e6b7290dc68f590df3c651a02')

_srcdir="nvidia-container-toolkit-${toolkit_ver}"

build() {
  cd "${_srcdir}"

  mkdir bin

  GO111MODULE=auto \
  GOPATH="${srcdir}/gopath" \
  go build -v \
    -buildmode=pie \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-s -w -extldflags ${LDFLAGS}" \
    -o bin \
    "./..."
    # -trimpath \  # only go > 1.13

  # go leaves a bunch of local stuff with 0400, making it break future `makepkg -C` _grumble grumble_
  GO111MODULE=auto \
  GOPATH="${srcdir}/gopath" \
  go clean -modcache
}

package_nvidia-container-runtime() {
  install -D -m755 "${_srcdir}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${_srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
