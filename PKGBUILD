# Maintainer:  dreieck
# Contributor: Felix Golatofski <contact (at) xdfr.de>
# Contributor: juantascon <juantascon.aur (at) horlux.org>
# Contributor: Jaroslaw Swierczynski <swiergot (at) aur.archlinux.org>
# Contributor: arjan <arjan (at) archlinux.org>
# Contributor: Tom Newsom <Jeepster (at) gmx.co.uk>

_pkgname=libtrash
pkgname="${_pkgname}-git"
pkgver=3.9+7.r31.20240325.5c0725e
pkgrel=1
pkgdesc="A shared, preloaded library that implements a trash can under Linux"
arch=('i686' 'x86_64')
url="https://github.com/pete4abw/libtrash"
license=('GPL-2.0-or-later')
depends=('glibc')
makedepends=('autoconf')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=(
  "${_pkgname}::git+${url}.git"
  "${install}"
)
sha256sums=(
  'SKIP'
  '64fa677e8ee51caf6030283304bd8f437615adaf8a318db9f7ff4a31a435d13a'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"

  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --enable-shared

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/" "${srcdir}/git.log" AUTHORS ChangeLog INSTALL NEWS README.md TLDR.md TODO
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
