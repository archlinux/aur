# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Serge Pavlyuk <flopss at gmail dot com>
# Contributor: phi-mah

pkgname=toggldesktop-git
_pkgname="${pkgname%-*}"
pkgver=7.5.473.r0.g322fb942e
pkgrel=1
pkgdesc="Toggl time tracking software"
arch=('x86_64')
url="https://github.com/toggl-open-source/toggldesktop"
license=('BSD')
depends=(
  'jsoncpp'
  'lua'
  'poco'
  'qt5-networkauth'
  'qt5-webengine'
  'qt5-x11extras'
)
makedepends=(
  'cmake'
  'git'
)
conflicts=("${_pkgname}" "${_pkgname}-bin" 'toggl-bin')
provides=("${_pkgname}")
source=("${_pkgname}::git+$url"
        "jsoncpp.patch")
sha512sums=('SKIP'
            '05813df185163e1361d99cf24291bd44bdfefeee050b56f2923fb909c2c57d532e0a459cdaea96504ed10d27004fe3ee9f3c34ec35bcc9f9f2e064cccd8cfe77')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  patch -p1  < ../jsoncpp.patch
}

build() {
  cmake -S "${_pkgname}" \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTOGGL_VERSION:STRING="${pkgver}" \
    -DTOGGL_PRODUCTION_BUILD=ON \
    -DTOGGL_ALLOW_UPDATE_CHECK=ON \
    -DUSE_BUNDLED_LIBRARIES=OFF

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 ${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

