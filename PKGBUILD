# Maintainer: Edmund Lodewijks <e.lodewijks at gmail.com>

## NOTE: Since pkgver 1.2.0 this package builds from a new upstream!
##	 The Trusted Domain Project has not updated OpenARC in years.
##	 This AUR package now tracks flowerysong's fork, which is
##	 currently maintained.
pkgname=openarc
pkgver=1.2.1
pkgrel=1
pkgdesc="Open source implementation of the ARC email authentication system"
arch=(x86_64)
url="https://github.com/flowerysong/OpenARC"
license=('BSD-2-Clause' 'LicenseRef-Sendmail-1.1')
depends=('sh' 'glibc' 'jansson' 'openssl' 'libbsd' 'libidn2' 'libmilter')
optdepends=('smtp-server: for using a local mail server'
	    'bind: required only for signature verification (alternatives available)'
	    'python: required for build, but also for "openarc-keygen"'
	    'libmilter-sharedlib: libmilter, built with local CFLAGS, LDFLAGS, and shared library instead of static archive (recommended)'
            'dkimpy-milter: for optional tests'
            'perl-mail-dkim: for optional tests'
)
makedepends=('git' 'python-miltertest')
conflicts=('openarc-git' 'openarc-unofficial-patches' 'openarc-unofficial-patches-git')
source=("https://github.com/flowerysong/OpenARC/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "openarc.service"
        "openarc.sysusers"
        "openarc.tmpfiles"
	"Patch001-systemd-service-file-for-Arch-linux.patch"
)
backup=('etc/openarc/openarc.conf')
sha256sums=('08c6b35da8cf6d8953f8f203b38a5cdf1301a886bbd78eeb1026b48b0dc937ae'
            'd438b4a2e0ab5b247938213da7e8062fa5865e750e4f89d41471311edc163022'
            '31c399c0e3a69bb845b033ab5c0ad92d44cacb0fd58e0113cd1901e75900515e'
            'a27619fe3bbea2a0fd7c555851089722b1d67818bc014d1dce20620b5eb4bbc5'
            '89587b82ed71f2dd2cb68d232627d10e0c5763a5d1010bb65648033b90abeefc')

prepare() {
  cd "$srcdir"/"${pkgname}-${pkgver}"
  autoreconf -i

  patch -Np0 < ../Patch001-systemd-service-file-for-Arch-linux.patch
}

build() {
  cd "$srcdir"/"${pkgname}-${pkgver}"
  ./configure \
     --prefix=/usr \
     --sbindir=/usr/bin \
     --sysconfdir="/etc/pkgname" \
     --localstatedir=/var \
     --disable-static
  make
}

check() {
  cd "$srcdir"/"${pkgname}-${pkgver}"
  make -j1 check
}

package() {
  cd "$srcdir"/"${pkgname}-${pkgver}"
  
  make -j1 DESTDIR="$pkgdir/" install
  
  # systemd integration
  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

  # license
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  for f in LICENSE LICENSE.Sendmail; do
    cp $f "$pkgdir/usr/share/licenses/$pkgname/$f"
  done
}
