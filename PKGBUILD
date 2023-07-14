# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgname=grapejuice
_repository=https://gitlab.com/brinkervii/grapejuice.git
_pkgver=7.11.3
pkgname="${_pkgname}"
pkgver="${_pkgver}"
pkgrel=2
pkgdesc='A Wine+Roblox management tool'
arch=('x86_64')
url="${_repository}"
depends=(
    'python'
    'python-pip'
    'python-gobject'
    'python-psutil'
    'python-packaging'
    'python-requests'
    'python-setuptools'
    'python-unidecode'
    'python-click'
    'cairo'
    'gtk3'
    'gobject-introspection'
    'desktop-file-utils'
    'xdg-utils'
    'xdg-user-dirs'
    'gtk-update-icon-cache'
    'shared-mime-info'
    'lib32-gnutls'
    'lib32-openssl'
    'lib32-libpulse'
    'mesa-utils'
)
makedepends=('unzip')
conflicts=("${_pkgname}-git")
optdepends=(
    'wine: Required to run Roblox, but left out of depends to let the user decide on custom builds'
    'xorg-xrandr: Required for PRIME systems running XOrg, where XRandR based profiling is desired'
)
provides=("${_pkgname}")
license=('GPL3')
source=("${_pkgname}-${pkgver}.zip::https://gitlab.com/brinkervii/grapejuice/-/archive/v${_pkgver}/grapejuice-v${_pkgver}.zip")
sha512sums=('3f4aa4e27388c8eb43353e71f4139c5bf750a8c645a8d2180c5c8022ba520a5f99f67977598a5913025771df210f72062f570b698a4f98b66e9f90f7a4e43ab3')

prepare() {
    unzip -n "${_pkgname}-${pkgver}.zip"
}

_get_project_root() {
    echo "$srcdir/$_pkgname-v$_pkgver"
}

package() {
    _python_version=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')

    _project_root=$(_get_project_root)
    cd "${_project_root}" || exit 1

    export PYTHONPATH="$_project_root/src"
    python3 -m grapejuice_packaging linux_package

    _built_package_root="${_project_root}/dist/linux_package"
    cd "${_built_package_root}" || exit 1
    tar -xf *.tar.gz -C "${pkgdir}"

    _site_packages=${pkgdir}/usr/lib/python${_python_version}/site-packages
    mkdir -p "${_site_packages}"

    mv "${pkgdir}/usr/lib/python3/dist-packages"/* "${_site_packages}"
    rm -r "${pkgdir}/usr/lib/python3"
}
