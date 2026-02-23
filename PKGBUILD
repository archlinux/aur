# $Id$
# Maintainer: Philipp Marmet
# Contributor: Joe Julian

pkgname=mgmt
pkgver=1.0.2
pkgrel=0
epoch=1
pkgdesc='Next generation config management.'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
pkggopath='github.com/purpleidea/mgmt'
url="https://${pkggopath}"
license=('GPL3')
makedepends=('augeas' 'go' 'go-md2man' 'go-tools' 'libpcap' 'libvirt' 'rubygems' 'ragel')
depends=('augeas' 'libvirt')
conflicts=('mgmt-bin')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
backup=("etc/${pkgname}/${pkgname}.conf")

source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz"
  "mgmt.service")
sha256sums=('de68bba23b8cd63d9c81ae52bab293cdf7a7641c39b83c48a1d533ac37c0fa26'
  'eeb4174a8556161b94f62808b4453ef91574797070ada53ffb90cb013aff9799')

prepare() {
  # extract tarball to path expected by go
  mkdir -p "${srcdir}/src/${pkggopath}"
  cd "${srcdir}/${pkgname}-${pkgver}"

  git submodule --quiet update --init --recursive
  git archive --prefix="${pkggopath}/" --format="tar" HEAD | tar xf - -C "${srcdir}/src"
  git submodule foreach 'git archive --prefix="${path}/" --format="tar" HEAD | tar xvf - -C "'${srcdir}'/src/'${pkggopath}'"'

  # fetch dependencies
  export GOPATH="${srcdir}"
  export PATH=${GOPATH}/bin:${PATH}
  cd "${srcdir}/src/${pkggopath}"
  msg2 'installing go dependencies'
  go install github.com/blynn/nex@latest
  go install golang.org/x/tools/cmd/goyacc@latest      # formerly `go tool yacc`
  go install golang.org/x/tools/cmd/stringer@latest    # for automatic stringer-ing
  go install golang.org/x/lint/golint@latest           # for `golint`-ing
  go install golang.org/x/tools/cmd/goimports@latest   # for fmt
  go install github.com/dvyukov/go-fuzz/go-fuzz@latest # for fuzzing the mcl lang bits

}

build() {
  export GOPATH="${srcdir}"
  export PATH=${GOPATH}/bin:${PATH}:/usr/lib/go/pkg/tool/linux_amd64
  cd "${srcdir}/${pkgname}-${pkgver}"
  go mod tidy
  make VERSION="${pkgver}" SVERSION="${pkgver}" PROGRAM="${pkgname}"
}

package() {
  msg2 'installing files'
  install -Dm644 "mgmt.service" "${pkgdir}/usr/lib/systemd/system/mgmt.service"

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "misc/bashrc.sh" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "misc/example.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
}
