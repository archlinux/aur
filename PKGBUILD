# Maintainer: Chris Trotman <chris+aur@trotman.io>

pkgname=terraform
pkgver=0.9.2
pkgrel=2
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
makedepends=('go' 'godep' 'git' 'mercurial')
conflicts=('terraform-bin')
_gourl=github.com/hashicorp
source=("https://github.com/hashicorp/terraform/archive/v${pkgver}.tar.gz")
sha256sums=('5ba2b1bf3e395ed1f5615f47b5e86b267d6f0bdf33efa3531cf6059222dd4477')

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  rm -rf "${srcdir}/src/${_gourl}/${pkgname}"
  mv -f "terraform-${pkgver}" "${srcdir}/src/${_gourl}/${pkgname}"
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
  install -D contrib/zsh-completion/_terraform /usr/share/zsh/site-functions/_terraform
}
