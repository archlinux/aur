# Maintainer: Aleksy Grabowski <qrdwibmkg@mozmail.com>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=moarvm
pkgver=2026.05.1
pkgrel=1
pkgdesc="A VM with adaptive optimization and JIT compilation, built for Rakudo"
arch=(i686 x86_64 aarch64)
url="http://moarvm.com/"
license=('Artistic-2.0 AND custom')
depends=('zstd')
makedepends=('perl>=5.10')
options=('!makeflags')
changelog=Changelog
validpgpkeys=(
    2832BDB33241A14EFCCA61470F09888FE017A4C2
)
source=(
    "https://moarvm.com/releases/MoarVM-$pkgver.tar.gz"
    "https://moarvm.com/releases/MoarVM-$pkgver.tar.gz.asc"
)
sha256sums=(
    801a43c2e87bdbb5030318e3c649c52f859a10f2bd21b6f26d4da8e9fda0bddf
    9f66cae523cbb8d4344a3ef69fdb44503b316b9794354da44c909a1196525165
)

build() {
    if echo $LDFLAGS | grep -sq nodlopen
    then
        cat <<EOT
You can't use nodlopen option to build moarvm. Remove it from LDFLAGS environment variable:
    $LDFLAGS

Most probably it is set in /etc/makepkg.conf
EOT
        exit 1
    fi
    cd MoarVM-${pkgver}
    perl Configure.pl --prefix=/usr
    make
}

package() {
    cd MoarVM-${pkgver}
    make DESTDIR="$pkgdir/" install
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
