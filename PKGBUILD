# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=winrm-cli-git
pkgver=r23.af1d5d0
pkgrel=1
pkgdesc="Command-line tool to remotely execute commands on Windows machines through WinRM"
arch=('x86_64')
url='https://github.com/masterzen/winrm-cli'
license=('Apache')
provides=("${pkgname%-git}")
depends=('glibc')
makedepends=('git' 'dep' 'go-pie')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p gopath/src/github.com/${pkgname%-git}
  ln -rTsf ${pkgname%-git} gopath/src/github.com/${pkgname%-git}/${pkgname%-git}
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/${pkgname%-git}/${pkgname%-git}
  if [[ ! -f Gopkg.toml ]]; then
    dep init -v
  fi
  dep ensure -v
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/github.com/${pkgname%-git}/${pkgname%-git}
  go install -v .
}

package() {
  install -Dm755 "${srcdir}/gopath/bin/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 "${srcdir}/${pkgname%-git}/README.md" "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}