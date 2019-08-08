# Maintainer: Thibaut Sautereau (thithib) <thibaut.sautereau@clip-os.org>

pkgname=swtpm
pkgver=0.2.0
pkgrel=1
pkgdesc="Libtpms-based TPM emulator with socket, character device, and Linux CUSE interface"
arch=('x86_64')
url="https://github.com/stefanberger/swtpm"
license=('BSD')
depends=('glib2' 'fuse2' 'libtpms' 'gnutls' 'net-tools' 'tpm-tools' 'expect')
makedepends=('socat' 'python')
source=("https://codeload.github.com/stefanberger/swtpm/tar.gz/v${pkgver}"
        'tmpfiles.conf'
        'https://github.com/stefanberger/swtpm/commit/39673a0139b0ee14a0109aba50a0635592c672c4.patch')
sha256sums=('977477e341f8b5db0820c8d3cc9946652ef8d7a93403c4dcf88667f9a84ae999'
            'eb408adb3e40df1cbea7898426fd89c9a2774a970fd3e18a052a530f49c32336'
            '3ed1166141e4841e011d00d2c84bf4b691eba79321d399fb5ab3a17d9a324d8e')

prepare() {
  cd "$pkgname-$pkgver"
  # See https://github.com/stefanberger/swtpm/issues/166
  patch --strip=1 --input="$srcdir/39673a0139b0ee14a0109aba50a0635592c672c4.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  # The 'tss' user and group are already created by trousers, on which we
  # indirectly depend via tpm-tools
  ./configure \
    --prefix=/usr \
    --with-gnutls \
    --with-cuse \
    --with-openssl \
    --with-tss-user=tss \
    --with-tss-group=tss
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/swtpm.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
