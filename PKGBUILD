# Maintainer: Edmund Lodewijks <e.lodewijks at gmail.com>

pkgname=openarc-unofficial-patches
_pkgname=openarc
pkgver=1.1.0
pkgrel=1
pkgdesc="OpenARC with patches from not-yet-merged PRs - by flowerysong"
arch=(x86_64)
url="https://github.com/flowerysong/OpenARC"
license=('BSD-2-Clause' 'LicenseRef-Sendmail-1.1')
depends=('sh' 'glibc' 'jansson' 'openssl' 'libbsd' 'libidn2')
optdepends=('smtp-server: for using a local mail server'
	    'bind: required only for signature verification (alternatives available)')
makedepends=('git' 'python-miltertest' 'libmilter')
conflicts=('openarc' 'openarc-unofficial-patches-git')
#source=("git+https://github.com/flowerysong/OpenARC.git#tag=${pkgver}"
source=("https://github.com/flowerysong/OpenARC/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        openarc.service
        openarc.sysusers
        openarc.tmpfiles)
backup=('etc/openarc/openarc.conf')
sha256sums=('39e3327ea5e868633891cb3a04e9528f18a2efa6e6576c072881e1331fef0dab'
            'd438b4a2e0ab5b247938213da7e8062fa5865e750e4f89d41471311edc163022'
            '31c399c0e3a69bb845b033ab5c0ad92d44cacb0fd58e0113cd1901e75900515e'
            'a27619fe3bbea2a0fd7c555851089722b1d67818bc014d1dce20620b5eb4bbc5')
validpgpkeys=(5CDD574C22FF4D2480ACABDF5254B96BC608B511) # The OpenDKIM Project <security@opendkim.org>

prepare() {
  cd "$srcdir"/"${_pkgname}-${pkgver}"
  autoreconf -i
}

build() {
  cd "$srcdir"/"${_pkgname}-${pkgver}"
  ./configure \
     --prefix=/usr \
     --sbindir=/usr/bin \
     --sysconfdir="/etc/_pkgname" \
     --localstatedir=/var \
     --disable-static
  LDFLAGS+=' -Wl,-z,cet-report=error' make
}

check() {
  cd "$srcdir"/"${_pkgname}-${pkgver}"
  make -j1 check
}

package() {
  cd "$srcdir"/"${_pkgname}-${pkgver}"
  
  make -j1 DESTDIR="$pkgdir/" install
  
  # systemd integration
  install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

  # license
  mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
  for f in LICENSE LICENSE.Sendmail; do
    ln -s $f "$pkgdir/usr/share/licenses/$_pkgname/$f"
  done
}
