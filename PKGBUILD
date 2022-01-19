# Maintainer: morguldir <morguldir@protonmail.com>
# Contributor: Sebastian Gumprich <sebastian.gumprich@38.de>
pkgname=tuxemon-git
pkgver=0.4.33.r47.gee807080
pkgrel=1
pkgdesc="A free, open source monster-fighting RPG."
arch=('any')
url="http://www.tuxemon.org"
license=('GPL3')
groups=('games')
depends=('python' 'python-cbor' 'python-pytmx' 'python-neteria' 'python-pyscroll' 'python-babel' 'python-lxml' 'python-natsort' 'python-pillow' 'python-click' 'python-prompt_toolkit')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('tuxemon-git::git+https://github.com/Tuxemon/Tuxemon.git#branch=development')
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $pkgname
    sed -i s/"pytmx.*"/"pytmx>=3.20.17"/g requirements.txt
}

package() {
    cd $pkgname
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
    cp -r mods "${pkgdir}/$site_packages"
}
