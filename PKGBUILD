# Maintainer: David Anderegg <dd.anderegg@hotmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: eolianoe <eolianoe [At] GmaiL [Dot] com>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=visit-bin
_pkgname=visit
pkgver=3.4.2
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="Interactive parallel visualization and graphical analysis tool"
url="https://wci.llnl.gov/simulation/computer-codes/visit"
arch=('x86_64')
license=('BSD' 'custom')
provides=('visit')
conflicts=('visit' 'visit-build')
depends=('glu')
makedepends=('bash' 'cpio' 'gendesk')
_ver=debian12
_url="https://github.com/visit-dav/visit/releases/download/v${pkgver}"
source=("${_url}/visit${_pkgver}.linux-x86_64-${_ver}.tar.gz"
        "${_url}/visit-install${_pkgver}"
        'visit.sh'
        'visit-libs.patch')
noextract=("${_pkgname}${_pkgver}.linux-x86_64-${_ver}.tar.gz")
sha256sums=('596fdebb35de0ec7797e42319ad5cf7cdf577d2f78e43400fec8421880e46973'
            '65b5ad7facc0f7281026c78c2adeff07a31965136da150e3d9d00341907367da'
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

  # create .desktop file
  gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc"
  
  # install .desktop file and icon
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
