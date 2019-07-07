# Maintainer: tinywrkb <tinywrkb@gmail.com>
_pkgname='arduino-create-agent'
pkgname="${_pkgname}-git"
pkgver=1.1.60.r137.gc2363f2
pkgrel=1
pkgdesc='The Arduino Create Multi Platform Agent'
arch=('x86_64')
url='https://www.arduino.cc/'
license=('GPL2')
depends=('libappindicator-gtk3')
makedepends=('git' 'go')
backup=("usr/lib/${_pkgname}/config.ini")
source=("${_pkgname}::git+https://github.com/arduino/${_pkgname}.git#branch=devel"
	"${_pkgname}.service")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p gopath/src/github.com/arduino
  ln -rTsf ${_pkgname} gopath/src/github.com/arduino/${_pkgname}
  cd gopath/src/github.com/arduino/${_pkgname}
  git submodule init
  git submodule update
}

build() {
  export GOPATH="${srcdir}"/gopath
  cd gopath/src/github.com/arduino/${_pkgname}
#  go build -i
#  go install
  go build -i -o ${_pkgname}
  go build -i -tags cli -o ${_pkgname}-cli
}

package() {
  cd gopath
#  install -Dm755 bin/${_pkgname} "${pkgdir}"/usr/lib/${_pkgname}/${_pkgname}
  install -Dm755 src/github.com/arduino/${_pkgname}/${_pkgname} "${pkgdir}"/usr/lib/${_pkgname}/${_pkgname}
  install -Dm755 src/github.com/arduino/${_pkgname}/${_pkgname}-cli "${pkgdir}"/usr/lib/${_pkgname}/${_pkgname}-cli
  mkdir -p "${pkgdir}"/usr/bin
  ln -rs "${pkgdir}"/usr/lib/${_pkgname}/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
  ln -rs "${pkgdir}"/usr/lib/${_pkgname}/${_pkgname}-cli "${pkgdir}"/usr/bin/${_pkgname}-cli
  install -Dm644 src/github.com/arduino/${_pkgname}/config.ini "${pkgdir}"/usr/lib/${_pkgname}/config.ini
  install -Dm644 src/github.com/arduino/${_pkgname}/LICENSE.md "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE.md
  install -Dm644 src/github.com/arduino/${_pkgname}/LICENSE.md "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE.md
  install -Dm644 "${srcdir}"/${_pkgname}.service "${pkgdir}"/usr/lib/systemd/user/${_pkgname}.service
}
