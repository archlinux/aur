# Maintainer: Aleksy Grabowski <qrdwibmkg@mozmail.com>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=moarvm
pkgver=2026.04
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
    65dc2242c9e71a52b85e636c1779408127910d51ecd462fb8c7376dc7a97917f
    8ae42b97b6124eef6508b7b9863b2974cd362aa69cf094a3ecafb6a76dfc217a
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
