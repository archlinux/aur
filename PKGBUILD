# Maintainer: Twann <tw4nn at disroot.org>

_init_system=runit
_basename=tblock
pkgname=${_basename}-${_init_system}
pkgver=2.5.0
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
        "f9cf2089c3ce2be08b250cbe451171ab21bd96315d21fd4a748776c22695cbd5328f3efa1d3c90641f15f8008ee6bdb8c89a113b4727aa44147cbec9370ccf44"
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
