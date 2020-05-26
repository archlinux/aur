# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: eolianoe <eolianoe [At] GmaiL [Dot] com>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=visit-bin
_pkgname=visit
pkgver=3.1.2
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="Interactive parallel visualization and graphical analysis tool"
url="https://wci.llnl.gov/simulation/computer-codes/visit"
arch=('x86_64')
license=('BSD' 'custom')
provides=('visit')
conflicts=('visit' 'visit-build')
depends=('libpng15' 'glu' 'libicu50')
makedepends=('bash' 'cpio')
_ver=rhel7
_url="https://github.com/visit-dav/visit/releases/download/v${pkgver}"
source=("${_url}/visit${_pkgver}.linux-x86_64-${_ver}.tar.gz"
        "${_url}/visit-install${_pkgver}"
        'visit.sh'
        'visit-libs.patch')
noextract=("${_pkgname}${_pkgver}.linux-x86_64-${_ver}.tar.gz")
sha256sums=('79e91b7b8b75b0305064579a689608fae7c2486e1852132773d68d2f5686e652'
            'ed4806c4edec7941a11ccf9329f303c663a757723fb8dc3a09f5a6999c9f354f'
            'd07a11e67ad646579fbc341f30e1eb63ebd38a5fbdd4f3ea36e8f460419028da'
            '4f0cd7507721974e3545eefb7087c3d2a7ad661945c60407f3a0455590108fef')

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
