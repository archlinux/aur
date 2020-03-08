# Maintainer: dreieck

_pkgname=confclerk
pkgname="${_pkgname}-git"
_pkgver=latest
epoch=1
pkgver=0.6.4_1+r605.20171208.g4498f2e
pkgrel=1
pkgdesc='QT4/QT5 application to make conference schedules offline. Able to import schedules in XML format created by the ​PentaBarf (or ​frab) used by ​FOSDEM, ​DebConf, ​Grazer Linuxtage, ​CCC congresses, ​FrOSCon, and ​many others.'
arch=('i686' 'x86_64')
url="http://www.toastfreeware.priv.at/confclerk"
license=('GPLv2')
depends=(
  # 'qt4' # QT4 or AT5 are possible. Change also the corresponding qmake-statement in build() accordingly.
  'qt5-base'
)
optdepends=()
makedepends=(
  'coreutils' # for `cut`
  'git'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=("${_pkgname}")
options=()

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _descr="$(git describe --tags)"
  _ver="$(printf '%s' "${_descr}" | cut -d '-' -f 1,2 | tr '-' '_')"
  _rev="r$(git rev-list --count HEAD)"
  _hash="$(printf '%s' "${_descr}" | cut -d '-' -f 3)"
  _date="$(git log -n 1 --format=tformat:%ci | cut -d ' ' -f 1 | tr -d '-')"
  printf '%s\n' "${_ver}+${_rev}.${_date}.${_hash}"
}

source=(
  "${_pkgname}::git+http://git.toastfreeware.priv.at/toast/confclerk.git"
  "${_pkgname}.1.gz::http://manpages.ubuntu.com/manpages.gz/zesty/man1/confclerk.1.gz"
)

sha256sums=(
  'SKIP'
  'SKIP'
)

build() {
  cd "${srcdir}/${_pkgname}"
  # qmake-qt4 # QT4 or QT5 possible. Change also the dependency accordingly.
  qmake-qt5
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  ### I found no way to specify a custom installation directory. So we install manually ...
  install -v -D -m755 src/bin/confclerk "${pkgdir}/usr/bin/${_pkgname}"
  install -v -D -m644 data/confclerk.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -v -D -m644 data/confclerk.svg "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
  install -v -D -m644 "${srcdir}/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

  install -v -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}" # Yes, we have an _additional_ ${_pkgname}-subdirectory, since we also have historic documentation from the time when this software was named fosdem-schedule.
  cp -rv docs/* "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -v -m644 AUTHORS BUGS COPYING INSTALL NEWS README "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}"
}
