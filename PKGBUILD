# Maintainer: Mckol <mckol363@gmail.com>

pkgname=airshipper-git
pkgver=0.1.2.r0.b9846f4
pkgrel=1
pkgdesc="The official launcher for Veloren - an open-world, open-source multiplayer voxel RPG"
arch=('x86_64' 'i686')
url='https://www.songtronix.com/'
license=('GPL3')
depends=('openssl')
makedepends=('git' 'rustup')
provides=("$pkgname" 'veloren')
conflicts=("$pkgname" 'veloren')
source=(
    "$pkgname"::'git+https://gitlab.com/veloren/airshipper.git'
    'airshipper.desktop'
    'veloren.png'
)
noextract=('airshipper.desktop' 'veloren.png')
sha512sums=('SKIP'
            'cfd0f354c112835254c26fa06e73e046477602f3d629967dcb0d3596481e9d2ca461fe605b249cf3a3aa9689325fac8de93e8ddabb3168c54ace82552231355f'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//'
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --bin airshipper
}

package() {
    # The executable needs to be called veloren for now because where it stores the game depends on it
    install -D "$srcdir/$pkgname/target/release/airshipper" -T "$pkgdir/usr/bin/veloren"
    install -Dm 644 "$srcdir/veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -D "$srcdir/airshipper.desktop" -t "$pkgdir/usr/share/applications"
}
