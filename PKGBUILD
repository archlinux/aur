# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=cxo
pkgname1=cxo
projectname=skycoin
githuborg=skycoinproject
pkgdesc="CX Object Storage System for the Skycoin Blockchain"
pkgver=3.1.0
pkggopath="github.com/${githuborg}/${pkgname1}"
pkgrel=4
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=('go' 'dep' 'skycoin-keyring')
source=("https://${pkggopath}/archive/v${pkgver}.tar.gz"
"PKGBUILD.sig")
sha256sums=('e4fc5221d89b0f548a0093c944829c0b3e94f96efcc339effc5fea34f4accbd3'
'SKIP')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC'  # Moses Narrow <moe_narrow@use.startmail.com>
                           '98F934F04F9334B81DFA3398913BBD5206B19620') #iketheadore skycoin <luxairlake@protonmail.com>


prepare() {
  gpg --import key
  #verify PKGBUILD signature
  gpg --verify ../PKGBUILD.sig ../PKGBUILD
  mkdir -p ${srcdir}/go/src/${pkggopath//${pkgname1}/} ${srcdir}/go/bin
  ln -rTsf ${srcdir}/${pkgname1}-${pkgver} ${srcdir}/go/src/${pkggopath}
  cd ${srcdir}/go/src/${pkggopath}/
  #git submodule --quiet update --init --recursive
  export GOPATH="${srcdir}"/go
  export GOBIN=${GOPATH}/bin
  export PATH=${GOPATH}/bin:${PATH}
  msg2 'installing go dependencies'
  #dep init
  dep ensure
  cmddir=${srcdir}/go/src/github.com/${githuborg}/${pkgname1}/cmd
  #using go build for determinism
	cd ${cmddir}/cxocli
  msg2 'building cxocli binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  cd ${cmddir}/cxod
  msg2 'building cxod binary'
  go build -trimpath -ldflags '-extldflags ${LDFLAGS}' -ldflags=-buildid= -o $GOBIN/ .
  #binary transparency
  cd $GOBIN
  msg2 'binary sha256sums'
  sha256sum $(ls)

}

package() {
  options=(!strip staticlibs)
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/lib/${projectname}/go/bin
  export GOPATH=${pkgdir}/usr/lib/${projectname}/go
  export GOBIN=${pkgdir}/usr/lib/${projectname}/go/bin
  cxobin="${srcdir}"/go/bin
  cxobins=$( ls $cxobin )
    for i in ${cxobins}; do
      install -Dm755 ${srcdir}/go/bin/${i} ${pkgdir}/usr/lib/${projectname}/go/bin/${i}
      ln -rTsf ${pkgdir}/usr/lib/${projectname}/go/bin/${i} ${pkgdir}/usr/bin/${i}
      chmod 755 ${pkgdir}/usr/bin/${i}
    done
}
