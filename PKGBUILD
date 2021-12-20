pkgname=qbittorrent-enhanced-ua
pkgver=4.3.9.10
pkgrel=1
pkgdesc="An advanced BitTorrent client programmed in C++, based on Qt toolkit and libtorrent-rasterbar. (Enhanced Edition with original user-agent)"
arch=('x86_64')
_name="qBittorrent-Enhanced-Edition"
url="https://github.com/c0re100/${_name}"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt5-base' 'qt5-svg' 'hicolor-icon-theme')
makedepends=('boost' 'qt5-tools')
optdepends=('python: needed for torrent search tab')
provides=('qbittorrent')
conflicts=('qbittorrent')

_rel="release-${pkgver}"
_snapshot="${_name}-${_rel}"

source=(
    "${_snapshot}.tar.gz::${url}/archive/${_rel}.tar.gz"
    "revert-ua.patch"
)

sha256sums=(
    '4b450edf5cf6c58c1f9d330891f0d76d47db6d61c6d09961c533529035d66ad0'
    '0008902d772eb4120276af7a3306a1ae5ec3475dcdba869c90041003da8afaec'
)

prepare() {
    cd "${srcdir}/${_snapshot}"

    patch -p0 -N -i "${srcdir}/revert-ua.patch"
}

build() {
    cd "${srcdir}/${_snapshot}"

    # tell qmake not to break makepkg's debug/!strip options
    export QBT_ADD_CONFIG='nostrip'

    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${_snapshot}"

    make INSTALL_ROOT="${pkgdir}" install

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "COPYING"
}
