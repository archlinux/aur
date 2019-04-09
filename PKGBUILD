# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
pkgname=ifdnfc-git
pkgver=r64.0e48e8e
pkgrel=1
pkgdesc="PC/SC IFD Handler based on libnfc"
arch=('x86_64')
url="https://github.com/nfc-tools/ifdnfc"
license=('GPL3')
source=(
    "ifdnfc::git+https://github.com/nfc-tools/ifdnfc.git"
    "fix-pcsc-lib-path.patch"
)
sha256sums=(
    'SKIP'
    '9ac432e7f32f20e312ff7f42e0cf052c3d0ffa2cf4fa6412bc3be51279fe2c9e'
)
depends=('libnfc')
backup=('etc/reader.conf.d/ifdnfc')

pkgver() {
    cd "$srcdir/ifdnfc"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/ifdnfc"
    patch --forward --strip=1 --input="${srcdir}/fix-pcsc-lib-path.patch"
}

build() {
    cd "$srcdir/ifdnfc"
    autoreconf -vis
    ./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib
    make
}

package() {
    cd "$srcdir/ifdnfc"
    make DESTDIR="$pkgdir/" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
