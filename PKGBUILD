# Maintainer: Duncan <duncan@vtllf.org>

pkgname=terraform
pkgver=0.6.0
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('go' 'git' 'mercurial')
conflicts=('terraform-bin')
_gourl=github.com/hashicorp
source=("${pkgname}::git+https://${_gourl}/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  rm -rf "${srcdir}/src/${_gourl}/${pkgname}"
  mv -f "${pkgname}" "${srcdir}/src/${_gourl}/${pkgname}"
  msg2 "Fetching dependencies"
  cd "${srcdir}/src/${_gourl}/${pkgname}"
  GOPATH="${srcdir}" make updatedeps
}

build() {
  msg2 "Build program"
  cd "${srcdir}/src/${_gourl}/${pkgname}"
  GOPATH="${srcdir}" PATH="${srcdir}/bin:${PATH}" TF_DEV=1 make bin
}

package() {
  cd "${srcdir}/bin"
  install -Dm755 terraform "${pkgdir}/usr/bin/terraform"
  install -Dm755 terraform-* "${pkgdir}/usr/bin"

  cd "${srcdir}/src/${_gourl}/${pkgname}"
  # Zsh completion
  install -D contrib/zsh-completion/_terraform $pkgdir/usr/share/zsh/site-functions/_terraform
}
