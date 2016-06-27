# Maintainer: Sergio Conde <skgsergio@gmail.com>

pkgname=mfcuk-git
pkgver=r54.5acc9f4
pkgrel=1
pkgdesc="MiFare Classic Universal toolKit (MFCUK)"
arch=('i686' 'x86_64')
url='https://github.com/nfc-tools/mfcuk'
license=('GPL')
depends=('libnfc')
makedepends=('git' 'automake' 'autoconf')
source=("$pkgname::git+https://github.com/nfc-tools/mfcuk.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  sed -i 's|./data/tmpls_fingerprints|/usr/share/mfcuk|' src/mfcuk_finger.c
}


build() {
    cd "$pkgname"
    autoreconf -vis
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" install

    install -Dm644 src/data/tmpls_fingerprints/* -t  "$pkgdir"/usr/share/mfcuk
}
