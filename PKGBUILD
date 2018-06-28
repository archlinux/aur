# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Aurélien Chabot <contact@aurelienchabot.fr>
# Contributor: Étienne Deparis <etienne@depar.is>

set -u
_pkgname='progress'
pkgname="${_pkgname}-git"
pkgver=0.14.r0.gee9d5c0
pkgrel=1
_srcdir="${_pkgname}"
pkgdesc='Shows running coreutils basic commands and displays stats'
arch=('i686' 'x86_64')
url="https://github.com/Xfennec/${_pkgname}"
license=('GPL3')
depends=('ncurses')
makedepends=('gcc' 'make')
makedepends+=('git')
provides=("${_pkgname}=${pkgver%%.r*}" 'cv')
conflicts=("${_pkgname}" 'cv')
replaces=('cv')
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${_srcdir}::${url//https:/git:}")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"

  set +u; msg2 'Building...'; set -u
  make -s -j1 # -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  set +u; msg2 'Installing license...'; set -u
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}/"

  set +u; msg2 'Installing documentation...'; set -u
  local _doc
  for _doc in 'capture.png' 'README.md'; do
    install -Dpm644 "${_doc}" -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  done

  set +u; msg2 'Installing...'; set -u
  make DESTDIR="${pkgdir}" PREFIX='/usr' install
  set +u
}
set +u
