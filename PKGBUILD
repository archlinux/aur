# Maintainer: dreieck

_pkgname=confclerk
pkgname="${_pkgname}-git"
_pkgver=latest
epoch=1
pkgver=0.7.2+r651.20240424.0.7.2
pkgrel=3
pkgdesc='Qt5 application to make conference schedules offline. Able to import schedules in XML format created by the ​PentaBarf (or ​frab) used by ​FOSDEM, ​DebConf, ​Grazer Linuxtage, ​CCC congresses, ​FrOSCon, and ​many others.'
arch=('i686' 'x86_64')
url="http://www.toastfreeware.priv.at/confclerk"
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'qt5-base'
  'libgcc_s.so'
  'libstdc++.so'
)
optdepends=()
makedepends=(
  'coreutils' # for `cut`
  'git'
  'libgcc'
  'libstdc++'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=("${_pkgname}")
options=()

source=(
  "${_pkgname}::git+https://git.toastfreeware.priv.at/toast/confclerk.git"
  "${_pkgname}.1::https://manpages.debian.org/confclerk/confclerk.1.gz"
)

sha256sums=(
  'SKIP'
  'dd298f7179b6e4a01b99c6ed950cd91c37830421099fa8ef77d173e567132d33'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _descr="$(git describe --tags)"
  _ver="$(printf '%s' "${_descr}" | cut -d '-' -f 1,2 | tr '-' '+')"
  _rev="r$(git rev-list --count HEAD)"
  _hash="$(printf '%s' "${_descr}" | cut -d '-' -f 3)"
  _date="$(git log -n 1 --format=tformat:%ci | cut -d ' ' -f 1 | tr -d '-')"
  printf '%s\n' "${_ver}+${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake
  make

  #gzip -c -9 "${srcdir}/confclerk.1" > "${srcdir}/${_pkgname}.1.gz" # No need: `makepkg` does it itself.

}

package() {
  cd "${srcdir}/${_pkgname}"

  ### I found no way to specify a custom installation directory. So we install manually ...
  install -v -D -m755 src/bin/confclerk "${pkgdir}/usr/bin/${_pkgname}"
  install -v -D -m644 data/confclerk.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -v -D -m644 data/confclerk.svg "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
  install -v -D -m644 "${srcdir}/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  install -v -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}" # Yes, we have an _additional_ ${_pkgname}-subdirectory, since we also have historic documentation from the time when this software was named fosdem-schedule.
  cp -rv docs/* "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -v -D -m644 -t "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}" AUTHORS BUGS COPYING INSTALL NEWS README git.log
}
