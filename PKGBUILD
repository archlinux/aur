# Maintainer: Damglador <vse.stopchanskyi@gmail.com>
# Thanks krunner-vscodeprojects-git for the base for this PKGBUILD

_pkgname=krunner-steam
pkgname=$_pkgname-git
pkgver=r16.da5747c
pkgrel=1
pkgdesc="Launch Steam games from Krunner"
arch=('any')
url="https://github.com/xTibor/krunner-steam.git"
groups=()
depends=(
    python
    python-gobject
    krunner
    kservice
)

provides=("$_pkgname")
conflicts=("$_pkgname")
install="${_pkgname}.install"
license=(LGPL-2.0-or-later)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname || exit 1
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_pkgname || exit 1
    site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    python_package=${pkgdir}/${site_packages}/${_pkgname}
    prefix="${pkgdir}/usr/share"
    krunner_dbusdir="$prefix/krunner/dbusplugins"
    services_dir="$prefix/dbus-1/services/"

    mkdir -p "$krunner_dbusdir"
    mkdir -p "$services_dir"
    mkdir -p "$python_package"

    cp krunnersteam.desktop "$krunner_dbusdir"
    cp src/* "$python_package"
    printf "[D-BUS Service]\nName=com.github.xtibor.krunnersteam\nExec=\"/${python_package}/main.py\"" > ${services_dir}/com.github.xtibor.krunnersteam.service
}
