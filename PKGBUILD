# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>

_pkgname=nbnc
pkgname=nbnc-git
pkgver=r4.ff12d7d
pkgrel=1
pkgdesc='a simple null (transparent) bnc (development version)'
url='https://ngrok.com'
license=('MIT')
source=('git+https://github.com/neersighted/nbnc.git')
sha256sums=('SKIP')
backup=('etc/nbnc.conf')
arch=('i686' 'x86_64')
makedepends=('git' 'go')
conflicts=('nbnc')
provides=('nbnc')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  rm -rf "${srcdir}/.go/src"
  mkdir -p "${srcdir}/.go/src"
  ln -sf "${srcdir}/${_pkgname}" "${srcdir}/.go/src/${_pkgname}" 
  cd "${srcdir}/.go/src/${_pkgname}/"

  export GOPATH="${srcdir}/.go"

  # Build it!
  go get
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the config.
  install -Dm644 nbnc.conf  "${pkgdir}/etc/nbnc.conf"
  # Install the service.
  install -Dm644 nbnc.service  "${pkgdir}/usr/lib/systemd/system/nbnc.service"

  cd "${srcdir}/.go/bin"

  # Install the program.
  install -Dm755 nbnc  "${pkgdir}/usr/bin/nbnc"
}

# vim: ft=sh ts=2 sw=2 et
