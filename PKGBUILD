# Maintainer: Edmund Lodewijks <e.lodewijks at gmail.com>

## NOTE: Since pkgver 1.2.0 this package builds from a new upstream!
##	 The Trusted Domain Project has not updated OpenARC in years.
##	 This AUR package now tracks flowerysong's fork, which is
##	 currently maintained.

pkgname=openarc-git
_pkgname=openarc
pkgver=1.2.2.r6.ga3273d4
pkgrel=2
pkgdesc="Open source implementation of the ARC email authentication system"
arch=(x86_64)
url="https://github.com/flowerysong/OpenARC"
license=('BSD-2-Clause' 'LicenseRef-Sendmail-1.1')
depends=('sh' 'glibc' 'jansson' 'openssl' 'libmilter' 'libidn2' 'python')
optdepends=(
    'smtp-server: for using a local mail server'
    'bind: required only for signature verification (alternatives available)'
    'libmilter-sharedlib: libmilter, built with local CFLAGS, LDFLAGS, and shared library instead of static archive (recommended)'
    'dkimpy-milter: for optional tests'
    'python-authres: for dkimpy-sign test'
	'perl-mail-dkim: for optional tests'
)
makedepends=('git' 'python-miltertest')
provides=('openarc')
conflicts=('openarc')
source=(
    "openarc::git+https://github.com/flowerysong/OpenARC.git#branch=main"
    "Patch01-Set-config-in-systemd-unit-file.patch"
	"Patch02-Remove-config-for-other-OSs.patch"
    "openarc.sysusers"
    "openarc.tmpfiles"
    "openarc.pc"
)
backup=('etc/openarc/openarc.conf')
b2sums=('SKIP'
        'f51ffb557e267e3ada10e208684ac11464b09a6af2f25ff2edb915c12b0803d0d13b1427da69b5d077a5d590dc74928ce4b1d49c826c203a797171cd4eddb40b'
        '1467a225fe4ad3169014bc1c85cf0eab70ed4da2eca2214f5aa35738990350099274814d3c9cc65b23590053dd83c76f2b47a17cd376237b4edc90852f9e16af'
        '0e752b2322a8fcfd593ac03b4ec678b962530d7f390199ebe9aa98a3cba6a906e59f1dbe321cc5c9acb4bf92a670d1ab56ccbbf8e14d5c754f6467b416c54f25'
        '300b0f94ad747572b9f8b54304b7c784f8c3bbfd82f1ca65f49e3822a52fe16380326ec724fb02fffdbbedd5e064d4414d8810c571412a80327ee45885c3223c'
        '3c5e7bcf89c8298314d83a967418b9085aef7ce94674395281d7d8596e318ba99a10d8c6032d85d1ae3d7ec3c82b85503d46a4a30d5214534eef598388c1e3b8')
options=('!lto')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags | sed 's/rel.openarc.//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  patch -p1 -i ../Patch01-Set-config-in-systemd-unit-file.patch
  patch -p1 -i ../Patch02-Remove-config-for-other-OSs.patch

  autoreconf -fvi
}

build() {
  cd "$srcdir/$_pkgname"

  ./configure \
     --prefix=/usr \
     --sbindir=/usr/bin \
     --sysconfdir="/etc/$_pkgname" \
     --localstatedir=/var \
     --with-libjansson
  make
}

check() {
  cd "$srcdir/$_pkgname"
  make -j1 check
}

package() {
  cd "$srcdir/$_pkgname"

  make -j1 DESTDIR="$pkgdir/" install

  # systemd integration
  install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname/contrib/systemd/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

  # license
  mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
  for f in LICENSE LICENSE.Sendmail; do
    ln -s $f "$pkgdir/usr/share/licenses/$_pkgname/$f"
  done
  ln -s "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"

  # pkgconfig file
  install -Dm644 "$srcdir/$_pkgname.pc" "${pkgdir}/usr/lib/pkgconfig/"
}
