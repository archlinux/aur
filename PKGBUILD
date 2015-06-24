# Maintainer: Manuel Mazzuola <origin.of@gmail.com>

_pkgname=terraform
pkgname=${_pkgname}-git
pkgver=v0.5.3.r319.gcddd54c
pkgrel=1
pkgdesc="Terraform is a tool for building, changing, and combining infrastructure safely and efficiently."
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('go' 'git' 'mercurial' 'unzip')
conflicts=('terraform-bin')
_gourl=github.com/hashicorp
source=(${pkgname}::"git+https://${_gourl}/${_pkgname}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  rm -rf "${srcdir}/src/${_gourl}/${_pkgname}"
  mv -f "${pkgname}" "${srcdir}/src/${_gourl}/${_pkgname}"
  msg2 "Fetching dependencies"
  cd "${srcdir}/src/${_gourl}/${_pkgname}"
  GOPATH="${srcdir}" make updatedeps
}

build() {
  msg2 "Build program"
  cd "${srcdir}/src/${_gourl}/${_pkgname}"
  GOPATH="${srcdir}" PATH="${srcdir}/bin:${PATH}" make dev
}

package() {
  cd "${srcdir}/bin"
  install -Dm755 terraform "${pkgdir}/usr/bin/terraform"
  install -Dm755 terraform-* "${pkgdir}/usr/bin"

  cd "${srcdir}/src/${_gourl}/${_pkgname}"
  # Zsh completion
  install -D contrib/zsh-completion/_terraform $pkgdir/usr/share/zsh/site-functions/_terraform
}
