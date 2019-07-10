# Maintainer: tinywrkb <tinywrkb@gmail.com>

_gitname=arduino-create-agent
pkgbase=${_gitname}-git
pkgname=(${_gitname}-git ${_gitname}-cli-git)
pkgver=1.1.60.r137.gc2363f2
pkgrel=2
pkgdesc='The Arduino Create Multi Platform Agent'
arch=(x86_64)
url='https://www.arduino.cc/'
license=(GPL2)
makedepends=(git go libappindicator-gtk3)
backup=("usr/lib/${_gitname}/config.ini"
		"usr/lib/${_gitname}-cli/config.ini")
source=("${_gitname}::git+https://github.com/arduino/${_gitname}.git#branch=devel"
		"${_gitname}.service")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p gopath/src/github.com/arduino
  ln -rTsf ${_gitname} gopath/src/github.com/arduino/${_gitname}
  cd gopath/src/github.com/arduino/${_gitname}
  git submodule init
  git submodule update
}

build() {
  export GOPATH="${srcdir}"/gopath
  cd gopath/src/github.com/arduino/${_gitname}
  mkdir -p build
#  go build -i &&  go install
  go build -i -o build/${_gitname}
  go build -i -tags cli -o build/${_gitname}-cli
}

package_arduino-create-agent-git() {
  depends=('libappindicator-gtk3')

  _package
}

package_arduino-create-agent-cli-git() {
  pkgdesc='The Arduino Create Multi Platform Agent CLI'

  _package
  install -Dm644 "${srcdir}"/${_gitname}.service "${pkgdir}"/usr/lib/systemd/user/${_gitname}.service
}

_package() {
  cd gopath/src/github.com/arduino/${_gitname}

  install -Dm644 config.ini "${pkgdir}"/usr/lib/${pkgname%-git}/config.ini
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname%-git}/README.md
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname%-git}/LICENSE.md

  install -Dm755 build/${pkgname%-git} "${pkgdir}"/usr/lib/${pkgname%-git}/${pkgname%-git}
  mkdir -p "${pkgdir}"/usr/bin
  ln -rs "${pkgdir}"/usr/lib/${pkgname%-git}/${pkgname%-git} "${pkgdir}"/usr/bin/${pkgname%-git}
}
