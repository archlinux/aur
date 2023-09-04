# Maintainer: BrinkerVII <brinkervii@gmail.com>

_pkgname=grapejuice
_repository=https://gitlab.com/brinkervii/grapejuice.git
_pkgver=7.19.8
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
sha512sums=('d10f452c15b9e41aa3ade1b488ee9c5a9be5ff9ed1d2aa35bedd821820279bb77fd963da931414bea5b771425b9d5e07913f88839829b7f854e5c5a946a80050')

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
