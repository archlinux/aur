# Maintainer: Carter Green <crtrgreen@gmail.com>
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

_pkgname=ccat
pkgname=ccat-git
pkgver=1.1.0.r31.g7cf6d90
pkgrel=1
pkgdesc="Colorizes output for cat."
arch=('any')
url="https://github.com/jingweno/ccat"
license=('CUSTOM')
makedepends=('go' 'git')
conflicts=('ccat' 'ccrypt')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed "s/-/.r/;s/-/./g;s/^v//"
}

check() {
  cd "${srcdir}/${_pkgname}"
  ./bin/test
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${srcdir}/go"
  export GOPATH="${srcdir}/go"
  msg2 "Getting dependencies..."
  go get github.com/mattn/go-colorable
  go get github.com/spf13/cobra
  go get github.com/mattn/go-isatty
  go get github.com/sourcegraph/syntaxhighlight
  msg2 "Building..."
  ./bin/build
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  mkdir -p "$pkgdir/usr/share/licenses/${_pkgname}"
  install -m 0644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/"
}

