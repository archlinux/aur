pkgname=pcsclite-toolbox
pkgver=1.9.5
pkgrel=2
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
        "https://src.fedoraproject.org/rpms/pcsc-lite/raw/f35/f/pcsc-lite-1.9.1-maxreaders.patch")
sha256sums=('9ee3f9b333537562177893559ad4f7b8d5c23ebe828eef53056c02db14049d08'
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
