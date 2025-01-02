# Maintainer: taotieren <admin@taotieren.com>

pkgname=mqtt-monitor-git
pkgver=r12.1325555
pkgrel=1
pkgdesc="MQTT Monitor UI using react and mqtt.js"
arch=('any')
url="https://github.com/mcxiaoke/mqtt-monitor"
license=('Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=('npm' 'poppler' 'ghostscript')
makedepends=(git)
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
#noextract=("${pkgname}-${_pkgver}.tar.gz")

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
