# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=cxo
_pkgname=cxo
_projectname=skycoin
_githuborg=${_projectname}
pkgdesc="CX Object Storage System for the Skycoin Blockchain"
pkgver=3.1.0
pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgrel=5
arch=('any')
url="https://${_pkggopath}"
license=()
makedepends=('go' 'dep' 'musl' 'kernel-headers-musl')
source=("https://${pkggopath}/archive/v${pkgver}.tar.gz")
sha256sums=('e4fc5221d89b0f548a0093c944829c0b3e94f96efcc339effc5fea34f4accbd3')
#validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
#                           '98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>


prepare() {
  #gpg --import key
  #verify PKGBUILD signature
  #gpg --verify ../PKGBUILD.sig ../PKGBUILD
  mkdir -p ${srcdir}/go/src/${_pkggopath//${_pkgname}/} ${srcdir}/go/bin
  ln -rTsf ${srcdir}/${_pkgname}-${pkgver} ${srcdir}/go/src/${_pkggopath}
  cd ${srcdir}/go/src/${_pkggopath}/
  #git submodule --quiet update --init --recursive
  export GOPATH="${srcdir}"/go
  export GOBIN=${GOPATH}/bin
  #export PATH=${GOPATH}/bin:${PATH}
  msg2 'installing go dependencies'
  #dep init
  dep ensure
}

build() {
export GOPATH="${srcdir}"/go
export GOBIN=${GOPATH}/bin
export CC=musl-gcc
  _cmddir=${srcdir}/go/src/github.com/${_githuborg}/${_pkgname}/cmd
  #using go build for determinism
	cd ${_cmddir}/cxocli
  msg2 'building cxocli binary'
  go build -trimpath --ldflags '-linkmode external -extldflags "-static" -buildid=' -o $GOBIN/ .
  cd ${_cmddir}/cxod
  msg2 'building cxod binary'
  go build -trimpath --ldflags '-linkmode external -extldflags "-static" -buildid=' -o $GOBIN/ .
  #binary transparency
  cd $GOBIN
  msg2 'binary sha256sums'
  sha256sum $(ls)

}

package() {
  options=(!strip staticlibs)
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/opt/${_pkgname}/bin
  _cxobin=${srcdir}/go/bin
  _cxobins=$( ls $_cxobin )
    for i in ${_cxobins}; do
      install -Dm755 ${srcdir}/go/bin/${i} ${pkgdir}/opt/${_pkgname}/bin/${i}
      ln -rTsf ${pkgdir}/opt/${_pkgname}/bin/${i} ${pkgdir}/usr/bin/${i}
      chmod 755 ${pkgdir}/usr/bin/${i}
    done
}
