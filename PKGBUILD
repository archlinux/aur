# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Thomas Kowaliczek-Schmer <thomas.kowaliczek@posteo.de>
# shellcheck shell=bash
# shellcheck disable=SC2034,SC2154

pkgname=unknown-horizons-git
_pkgname=${pkgname%-git}
pkgver=2019.1.r109.gac387940c
pkgrel=1
pkgdesc="Open source real-time strategy game with the comfy Anno1602 feeling."
arch=('any')
url="https://unknown-horizons.org/"
license=('GPL' 'CCPL')
depends=('fife' 'python-distro' 'python-future' 'python-pillow' 'python-yaml')
makedepends=('git' 'intltool' 'python-setuptools')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$pkgname::git+https://github.com/$_pkgname/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname" || exit
    printf "%s.%s" \
        "$(grep -E -o 'RELEASE_VERSION=[0-9]+\.[0-9]+' <development/create_release_tarball.sh | sed -r 's/RELEASE_VERSION=//g')" \
        "$(git describe --long --tags | awk -F '-' '{print "r" $(NF-1) "." $(NF)}')"
}

build() {
    cd "$pkgname" || exit
    # unknown-horizons build system misses a few files if the build step is seperated from the install step
    # -> Do not build here for now
    # UH_USER_DIR="UH_USER_DIR" python setup.py build
    UH_USER_DIR="UH_USER_DIR" python horizons/engine/generate_atlases.py 2048
}

package() {
    cd "$pkgname" || exit
    UH_USER_DIR="UH_USER_DIR" python setup.py install --root="$pkgdir/" --optimize=1 #--skip-build
}
