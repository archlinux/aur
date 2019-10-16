# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Thomas Kowaliczek-Schmer <thomas.kowaliczek@posteo.de>

pkgname=unknown-horizons-git
pkgver=2019.1.r47.gc196f0704
pkgrel=2
pkgdesc="Open source real-time strategy game with the comfy Anno1602 feeling."
arch=('any')
url="http://www.unknown-horizons.org"
license=('GPL' 'CCPL')
depends=('fife' 'python-distro' 'python-future' 'python-pillow' 'python-yaml')
makedepends=('git' 'intltool' 'python-setuptools')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+https://github.com/${pkgname%-git}/${pkgname%-git}.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s.%s" \
        "$(egrep -o 'RELEASE_VERSION=[0-9]+\.[0-9]+' < development/create_release_tarball.sh | sed -r 's/RELEASE_VERSION=//g')" \
        "$(git describe --long --tags | awk -F '-' '{print "r" $(NF-1) "." $(NF)}')"
}

# unknown-horizons build system misses a few files if the build step is seperated from the install
# step
build() {
    cd "$srcdir/${pkgname%-git}"
    # UH_USER_DIR="$srcdir/UH_USER_DIR" python setup.py build
    UH_USER_DIR="$srcdir/UH_USER_DIR" python horizons/engine/generate_atlases.py 2048
}

package() {
    cd "$srcdir/${pkgname%-git}"
    UH_USER_DIR="$srcdir/UH_USER_DIR" python setup.py install --root="$pkgdir/" --optimize=1 #--skip-build
}
