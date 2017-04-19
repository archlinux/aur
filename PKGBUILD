# Maintainer: eolianoe <eolianoe [At] GmaiL [Dot] com>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>
pkgname=visit-bin
_pkgname=visit
pkgver=2.12.2
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="Interactive parallel visualization and graphical analysis tool"
url="https://wci.llnl.gov/simulation/computer-codes/visit"
arch=('x86_64')
license=('BSD' 'custom')
provides=('visit')
conflicts=('visit' 'visit-build')
depends=('libpng15' 'glu')
makedepends=('bash' 'cpio')
_ver=ubuntu14
_url="http://visit.ilight.com/svn/${_pkgname}/trunk/releases/${pkgver}"
source=("${_url}/${_pkgname}${_pkgver}.linux-x86_64-${_ver}.tar.gz"
        "${_url}/${_pkgname}-install${_pkgver}"
        'visit.sh'
        'visit-libs.patch')
noextract=("${_pkgname}${_pkgver}.linux-x86_64-${_ver}.tar.gz")
sha256sums=('07b40b6e809e1b850997634f53d8ebbf8b061b734cde2989edd151728c4e9d78'
            '09f8f546e4f271176e1d4678bf7ef4e648b6c95ddb5b9f50587b11bcde8a0570'
            'd07a11e67ad646579fbc341f30e1eb63ebd38a5fbdd4f3ea36e8f460419028da'
            'abc1c05f6567281cb8654dfbe3d0ef87ec3537e8e60191ba0625d4f99feb27c7')

package() {
  cd "${srcdir}"

  # Create destination directory
  install -dm755 "${pkgdir}/opt/${_pkgname}"

  # Install visit
  bash ${_pkgname}-install${_pkgver} -c none ${pkgver} linux-x86_64-${_ver} \
    "${pkgdir}/opt/${_pkgname}"

  # Patch to force the use of the libs provided by VisIt
  patch "${pkgdir}/opt/visit/bin/frontendlauncher" < "${srcdir}/visit-libs.patch"

  # Install script to set $PATH
  install -Dm755 visit.sh "${pkgdir}/etc/profile.d/visit.sh"

  # Fix permissions
  chown -R root:root "${pkgdir}/opt/${_pkgname}"
}
