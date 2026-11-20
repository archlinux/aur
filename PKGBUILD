# Maintainer: Aleksy Grabowski <qrdwibmkg@mozmail.com>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=moarvm
pkgver=2026.11
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
    75d3ebf889351294fab7222ad4eb966c74cefbef4cbe0073e397083394a663d4
    b7c25ecb32de76cc57194203a210cc61b69f179fb5d982b718a919e9e9f1299c
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
