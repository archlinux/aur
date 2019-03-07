# Maintainer: Arne Beer <arne@twobeer.de>

_gitname=encarne
pkgname=${_gitname}-git
pkgver='1.3.0.r0.gfbee758'
pkgrel=1
arch=('any')
pkgdesc='A program for automatic reencoding of all video containers to h.265 in a specific directory'
license=('MIT')
depends=('mediainfo' 'pueue' 'python-lxml' 'python-sqlalchemy' 'python-sqlalchemy-utils' 'python-humanfriendly')
makedepends=('git' 'python-setuptools')
provides=('encarne')
conflicts=('encarne')
url='https://github.com/nukesor/encarne'
source=("git+https://github.com/nukesor/encarne.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

package() {
    cd "${_gitname}"

    # We don't need anything related to git in the package
    rm -rf .git*

    # Install
    python setup.py install --optimize=1 --root="${pkgdir}"

    install -dm777 "${pkgdir}/var/lib/encarne"

    # Place systemd user service
    install -Dm644 "utils/${_gitname}.service" "${pkgdir}/usr/lib/systemd/system/${_gitname}.service"

    # Install License
    # MIT/X11 license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
