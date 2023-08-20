# Maintainer: Xunhua Guo <xunhua.guo@gmail.com>
# Contributer: m4dz <code@m4dz.net>

pkgname=projecteur
pkgver=0.9.2
pkgrel=1
pkgdesc="Linux Desktop Application for the Logitech Spotlight device."
arch=('x86_64')
url="https://github.com/jahnf/Projecteur"
license=('MIT')
depends=('qt5-graphicaleffects>=5.7' 'udev')
install='projecteur.install'
makedepends=('cmake' 'make')
provides=('projecteur')
conflicts=('projecteur-git')
source=("https://github.com/jahnf/Projecteur/releases/download/v${pkgver}/projecteur-${pkgver}_source.tar.gz"
        "projecteur.install"
		"array.patch")
sha256sums=('2924f5f4ec5deb41a523292e2207e4d298c17bd70e855897dfdafe3b15a01c9d'
            'a8d406a61d84834358aba36718547be20eb6ee1d055c4ffdb28fe9f56d22aaaf'
			'c58eedbee9d61d18309e90d0a97d6d4ef49ecb4f1e2c554218215f8bae6c2fde')

prepare() {
		cd "$srcdir/$pkgname-$pkgver"
		patch --forward --strip=1 --input="${srcdir}/array.patch"
        mkdir -p "$srcdir/build"
        cd "$srcdir/build"
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr "$srcdir/$pkgname-$pkgver"
}

build() {
        cd "$srcdir/build"
        make
}

package() {
        # PKG
        cd "$srcdir/build"
        make DESTDIR="$pkgdir/" install

        # LICENSE
        install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
