# Maintainer: Edmund Lodewijks <e.lodewijks at gmail.com>

pkgname=openarc-unofficial-patches
_pkgname=openarc
pkgver=1.0.0rc0
pkgrel=5
pkgdesc="OpenARC with patches from not-yet-merged PRs - by flowerysong"
arch=(x86_64)
url="https://github.com/flowerysong/OpenARC"
license=('BSD-2-Clause' 'LicenseRef-Sendmail-1.1')
depends=('sh' 'glibc' 'jansson' 'openssl' 'libbsd' 'libmilter')
optdepends=('smtp-server: for using a local mail server'
	    'bind: required only for signature verification (alternatives available)')
makedepends=('git' 'python-miltertest')
conflicts=('openarc' 'openarc-unofficial-patches-git')
#source=("git+https://github.com/flowerysong/OpenARC.git#tag=${pkgver}"
source=("https://github.com/flowerysong/OpenARC/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        openarc.service
        openarc.sysusers
        openarc.tmpfiles)
sha256sums=('a74bebfb4864288e84103da2a37cb31578d73225063e2b77b571969bd8dd4c4d'
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
     --sysconfdir="/etc/$pkgname" \
     --localstatedir=/var
  make
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
