# Maintainer: taotieren <admin@taotieren.com>

pkgname=sigma-file-manager
_tagname=2.0.0-beta.1
pkgver="${_tagname//-/_}"
# pkgver=1.7.0
pkgrel=6
pkgdesc="\"Sigma File Manager\" is a free, open-source, quickly evolving, modern file manager (explorer / finder) app for Windows and Linux."
arch=('any')
url="https://github.com/aleksey-hoffman/sigma-file-manager"
license=('GPL-3.0-or-later')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
replaces=()
depends=(npm)
makedepends=(
    git
    electron-builder
    node-gyp
)
backup=()
options=()
install=
source=("${pkgname}-${_tagname}.tar.gz::${url}/archive/refs/tags/v${_tagname}.tar.gz")
sha256sums=('37c55279b0e7681e0a226a953390b72cd5767897a27fafc87a1f648c39f2666e')
noextract=("${pkgname}-${_tagname}.tar.gz")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_tagname}.tar.gz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
