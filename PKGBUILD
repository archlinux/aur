# Maintainer: Chris Trotman <chris+aur@trotman.io>

pkgname=terraform
pkgver=0.7.13
pkgrel=2
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('go' 'godep' 'git' 'mercurial')
conflicts=('terraform-bin')
_gourl=github.com/hashicorp
source=("${pkgname}::git+https://${_gourl}/${pkgname}.git#commit=2a4b4bbc3f315d100f76a83570e0364275e0fc6b")
sha256sums=('SKIP')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  rm -rf "${srcdir}/src/${_gourl}/${pkgname}"
  mv -f "${pkgname}" "${srcdir}/src/${_gourl}/${pkgname}"
  msg2 "Fetching dependencies"
  cd "${srcdir}/src/${_gourl}/${pkgname}"
  GOPATH="${srcdir}" go get -u github.com/mitchellh/gox
  GOPATH="${srcdir}" go get -u golang.org/x/tools/cmd/stringer
}

build() {
  msg2 "Build program"
  cd "${srcdir}/src/${_gourl}/${pkgname}"
  GOPATH="${srcdir}" PATH="${srcdir}/bin:${PATH}" TF_DEV=1 TF_QUICKDEV=1 make bin
}

package() {
  cd "${srcdir}/bin"
  install -Dm755 terraform "${pkgdir}/usr/bin/terraform"

  cd "${srcdir}/src/${_gourl}/${pkgname}"
  # Zsh completion
  install -D contrib/zsh-completion/_terraform $pkgdir/usr/share/zsh/site-functions/_terraform
}
