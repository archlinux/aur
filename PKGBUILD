# Maintainer: BrinkerVII <brinkervii@gmail.com>

pkgname=grapejuice-git
_pkgname=grapejuice
_repository=https://gitlab.com/brinkervii/grapejuice.git
pkgver=4.0.0
pkgrel=2
pkgdesc='A Wine+Roblox management tool'
arch=('x86_64')
url="${_repository}"
makedepends=('git')
depends=(
    'python-pip'
    'python-gobject'
    'python-psutil'
    'python-packaging'
    'python-requests'
    'python-setuptools'
    'python-unidecode'
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
    'mesa-utils'
)
optdepends=(
    'wine: Required to run Roblox, but left out of depends to let the user decide on custom builds'
    'xorg-xrandr: Required for PRIME systems running XOrg, where XRandR based profiling is desired'
)
provides=("${_pkgname}")
license=('GPL3')
source=("${_pkgname}"::git+"${_repository}")
sha256sums=('SKIP')

_get_project_root() {
    echo "$srcdir/grapejuice"
}

pkgver() {
  cd "$_pkgname"

  _project_root=$(_get_project_root)
  export PYTHONPATH="$_project_root/src"
  
  _grapejuice_version=$(python3 -c 'from grapejuice import __version__; print(__version__)')

  echo "${_grapejuice_version}"
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

    mv "${pkgdir}/usr/lib/python3/dist-packages" "${pkgdir}/usr/lib/python${_python_version}"
    rm -r "${pkgdir}/usr/lib/python3"
}
