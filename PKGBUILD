# Maintainer: Twann <tw4nn at disroot.org>

_init_system=runit
_basename=tblock
pkgname=${_basename}-${_init_system}
pkgver=2.1.0
pkgrel=1
provides=("$_basename")
pkgdesc="An anti-capitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
conflicts=("$_basename")
makedepends=(
        "make"
        "pandoc"
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
	"tblockd.run"
)
sha512sums=(
        "b47352f822e671e18405c4c0834c905be7d48d81dc9326d0f3b37e164c2c749bb3742bebea1ba979bf2fd07830cf20cee4291675fcbf15db4def0c14cc0a77f5"
        "90e3f2164894176088ae2e7bf55a05e6bdbd2def96dd8cada08f31ae56cdcadf9e781ba0e954129c06aea54baf936719c7d06f6c322f5c86af3eb6700a745501"
)
backup=("etc/tblock.conf")

build()
{
        cd "$srcdir/$_basename"
        make
}

package()
{
        install -Dm755 tblockd.run "$pkgdir/etc/runit/sv/tblockd/run"
        cd "$srcdir/$_basename"
        # Install the package
        make install-files install-python-module ROOT="$pkgdir"
        # Install the configuration file
        make install-config ROOT="$pkgdir"
}
