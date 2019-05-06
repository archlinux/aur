# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=divine2-ltsmin
pkgver=1.3
pkgrel=1
pkgdesc='LTSmin-enabled version of DiVinE 2'
depends=()
makedepends=('gcc' 'cmake')
optdepends=()
arch=('any')
url='https://github.com/utwente-fmt/divine2'
license=('custom')
provides=('divine')
conflicts=('divine')
source=("https://github.com/utwente-fmt/divine2/archive/$pkgver.tar.gz"
        '000-explicit_storage.patch'
        '001-ltl.patch'
        '002-map.patch')
sha256sums=('596e0614bcfe8d65bd26c08a0d5b4085e310004cdaf9b5eb11f0ede8b4332a16'
            '5b379c10726548d20dcbe1e587fb1451d12b9eaa952b279a9fc287b90b87a615'
            'bf688aa819f957c90e22df6584f56f2b36b6b00e3db8bcd95f6aab27d67dab6a'
            '2a357e606e85292141627f79e6ba510fe8b0c3814ea37785b8e1a5f0cd44f5d1')

prepare() {
    cd "$srcdir/divine2-$pkgver"
    patch -p1 < "$srcdir/000-explicit_storage.patch"
    patch -p1 < "$srcdir/001-ltl.patch"
    patch -p1 < "$srcdir/002-map.patch"
    mkdir build
}

build() {
    cd "$srcdir/divine2-$pkgver/build"
    cmake -E env CXXFLAGS='-Wno-narrowing' cmake .. \
        -Wno-dev -Wno-error=dev -DGUI=OFF -DRX_PATH='' -DMURPHI=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/divine2-$pkgver/build"
    make DESTDIR="${pkgdir}" install
    cd "$srcdir/divine2-$pkgver"
    install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set sw=4 ts=4 et:
