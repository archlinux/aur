# Maintainer: taotieren <admin@taotieren.com>

pkgname=mqtt-monitor-git
pkgver=1325555
pkgrel=1
pkgdesc="MQTT Monitor UI using react and mqtt.js"
arch=('any')
url="https://github.com/mcxiaoke/mqtt-monitor"
license=('Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname}  ${pkgname%-git} )
#replaces=(${pkgname})
depends=('npm' 'poppler' 'ghostscript')
makedepends=()
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
#noextract=("${pkgname}-${_pkgver}.tar.gz")

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --always --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname%-git}"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
