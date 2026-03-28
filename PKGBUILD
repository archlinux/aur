# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Gokberk Yaltirakli <aur at gkbrk dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_rdnn=io.github.ellie_commons.reminduck
pkgname=reminduck
pkgver=2.3.1.5
pkgrel=1
pkgdesc='Simple reminder app with notifications, built with GTK4 and Granite'
arch=('x86_64')
url='https://github.com/elly-code/reminduck'
license=('GPL-3.0-or-later')
depends=('gtk4' 'granite7' 'libgee' 'sqlite' 'libportal')
makedepends=('meson' 'vala')

# Upstream tags use X.Y.Z-N (iteration suffix); Arch pkgver uses X.Y.Z.N
_vertag=${pkgver}
[[ ${pkgver} =~ ^([0-9]+\.[0-9]+\.[0-9]+)\.([0-9]+)$ ]] && _vertag="${BASH_REMATCH[1]}-${BASH_REMATCH[2]}"

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_vertag}.tar.gz")
sha256sums=('3adfd1a89c4d665a0271e2aa4c72a83c42d9912c7c00d64bf784e585b75f6fc2')

latestver() {
    curl -fsSL 'https://api.github.com/repos/elly-code/reminduck/releases/latest' |
    jq -r '.tag_name // empty' | sed 's/-/./g'
}

prepare() {
    # Normalize extracted directory name (upstream tag may use hyphen)
    [[ -d "${pkgname}-${_vertag}" ]] && mv "${pkgname}-${_vertag}" "${pkgname}-${pkgver}"
}

build() {
    cd "${pkgname}-${pkgver}"
    meson setup build --prefix=/usr --buildtype=release
    ninja -C build
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" ninja -C build install
    ln -s "${_rdnn}" "${pkgdir}/usr/bin/${pkgname}"
}
