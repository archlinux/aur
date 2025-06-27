# Maintainer: Edmund Lodewijks <edmund at proteamail.com>

## NOTE: Since pkgver 1.2.0 this package builds from a new upstream!
##	 The Trusted Domain Project has not updated OpenARC in years.
##	 This AUR package now tracks flowerysong's fork, which is
##	 currently maintained.
pkgname=openarc
pkgver=1.2.1
pkgrel=5
pkgdesc="Open source implementation of the ARC email authentication system"
arch=(x86_64)
url="https://github.com/flowerysong/OpenARC"
license=('BSD-2-Clause' 'Sendmail')
depends=('glibc' 'jansson' 'libcrypto.so' 'libidn2.so' 'libmilter')
optdepends=('systemd: system and service manager'
	    'smtp-server: for using a local mail server'
	    'bind: required only for signature verification (alternatives available)'
	    'python: required for build, but also for tool "openarc-keygen"'
	    'libmilter-sharedlib: libmilter, built with local CFLAGS, LDFLAGS, and shared library instead of static archive (recommended)'
            'dkimpy-milter: for optional tests'
            'perl-mail-dkim: for optional tests'
)
makedepends=('git' 'python-miltertest')
conflicts=('openarc-git' 'openarc-legacy')
provides=('libopenarc.so')
source=("https://github.com/flowerysong/OpenARC/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "openarc.service"
        "openarc.sysusers"
        "openarc.tmpfiles"
	"Patch01-systemd-service-file-upgrade-and-harden.patch"
	"Patch02-Remove-config-for-other-OSs.patch"
)
#backup=('etc/openarc/openarc.conf')
b2sums=('eb69d80886a593fafa70af8e8579a9ec82a4da602652e8abf610864f0357419ac20a9f48a9faa5b36f8bb34d1cae121348ca5ad028de3eab27fa2f5a0576b619'
        'c68fac3b34ed86048bf212c1b089bd70f950149053ecc23d07fd620d14e379817fd620d89ee89f4f50a95fed2cc231b5aa9c0121fd3e19d80883ad6ecbf1b6a3'
        '0e752b2322a8fcfd593ac03b4ec678b962530d7f390199ebe9aa98a3cba6a906e59f1dbe321cc5c9acb4bf92a670d1ab56ccbbf8e14d5c754f6467b416c54f25'
        '300b0f94ad747572b9f8b54304b7c784f8c3bbfd82f1ca65f49e3822a52fe16380326ec724fb02fffdbbedd5e064d4414d8810c571412a80327ee45885c3223c'
        'd59d303025140c90ba120f8536ff6b35d375c08a3f7da96c04594ddfe227198f7c75546ab0ee4d1466725633667bb7cb4fbff06a5f625a47f820d9a97a02e4b6'
        '1467a225fe4ad3169014bc1c85cf0eab70ed4da2eca2214f5aa35738990350099274814d3c9cc65b23590053dd83c76f2b47a17cd376237b4edc90852f9e16af')

prepare() {
  cd "$srcdir"/"${pkgname}-${pkgver}"
  
  patch -p1 -i ../Patch01-systemd-service-file-upgrade-and-harden.patch
  patch -p1 -i ../Patch02-Remove-config-for-other-OSs.patch

  autoreconf -fvi
}

build() {
  cd "$srcdir"/"${pkgname}-${pkgver}"

  ./configure \
     CC="gcc -std=gnu17" \
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
