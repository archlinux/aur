pkgname=pcsclite-toolbox
pkgver=1.9.7
pkgrel=1
pkgdesc="PC/SC Architecture smartcard middleware library patched for a Fedora socket"
arch=('x86_64')
url='https://pcsclite.apdu.fr/'
license=('BSD')
depends=('python' 'systemd' 'libsystemd.so' 'libudev.so')
makedepends=('pkg-config')
conflicts=("pcsclite")
provides=('libpcsclite.so' 'libpcscspy.so' 'pcsclite')
options=('!docs')
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>
source=("https://pcsclite.apdu.fr/files/pcsc-lite-${pkgver}.tar.bz2"{,.asc} 
        "https://src.fedoraproject.org/rpms/pcsc-lite/raw/rawhide/f/pcsc-lite-1.9.1-maxreaders.patch")
sha256sums=('92c1ef6e94170ac06c9c48319a455ad6de5bcc60d9d055a823b72a2f4ff3e466'
            'SKIP'
            'SKIP') #Fix me

prepare() {
    cd "${srcdir}/${_pkgname}/pcsc-lite-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/pcsc-lite-1.9.1-maxreaders.patch"
}

build() {
  cd "pcsc-lite-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --enable-filter \
    --enable-ipcdir=/run/pcscd \
    --enable-libudev \
    --enable-usbdropdir=/usr/lib/pcsc/drivers \
    --with-systemdsystemunitdir=/usr/lib/systemd/system

  make
}

package() {
  cd "pcsc-lite-$pkgver"
  make DESTDIR="$pkgdir" install

  install -D -m0644 "$srcdir/pcsc-lite-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/lib/pcsc/drivers"
}
