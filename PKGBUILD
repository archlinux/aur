# Maintainer: Twann <tw4nn at disroot.org>

_init_system=runit
_basename=tblock
pkgname=${_basename}-${_init_system}
pkgver=2.5.1
pkgrel=1
provides=("$_basename")
pkgdesc="An anti-capitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
conflicts=("$_basename")
makedepends=(
        "make"
        "gzip"
        "python>=3"
        "python-setuptools"
)
depends=(
        "python-urllib3"
        "python-requests"
        "python-colorama"
        "${_init_system}"
)
source=(
        "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz"
)
sha512sums=(
        "5656631eb28c5841295e88ed9d6f2b735eeb6f5eeed347e47b4d1440974f6c14d2067484f27c276e2cd6160add5432e5ab494bac800d5b44febfd9d07b2baa0a"
)
backup=("etc/tblock.conf")

build()
{
        cd "$srcdir/$_basename"
        make build-files
        python3 ./setup.py build
}

package()
{
        cd "$srcdir/$_basename"
        # Install the python package
        python3 ./setup.py install --root="$pkgdir" --skip-build --optimize=1
        # Install man pages and LICENSE
        make install-files install-service-${_init_system} ROOT="$pkgdir"
        # Install the configuration file
        make install-config ROOT="$pkgdir"
}
