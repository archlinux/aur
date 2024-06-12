# Maintainer: Edmund Lodewijks <e.lodewijks at gmail.com>

pkgname=openarc-unofficial-patches
_pkgname=openarc
pkgver=1.0.0.Beta3
pkgrel=2
_commit=0676227216f69bb52a4da2e52faf1978062b1fd7
pkgdesc="OpenARC with patches from not-yet-merged PRs - by flowerysong"
arch=(x86_64)
url="https://github.com/flowerysong/OpenARC"
license=('BSD-2-Clause' 'LicenseRef-Sendmail-1.1')
depends=('sh' 'glibc' 'jansson' 'openssl' 'libbsd')
optdepends=('smtp-server: for using a local mail server'
	    'bind: required only for signature verification (alternatives available)')
makedepends=('libmilter' 'git')
conflicts=('openarc')
source=("git+https://github.com/flowerysong/OpenARC.git#commit=${_commit}"
        openarc.service
        openarc.sysusers
        openarc.tmpfiles)
sha256sums=('2b2f0739071bfa4982eca651dc7a49584bed93eac14535cf04947eaa4e108780'
            'd438b4a2e0ab5b247938213da7e8062fa5865e750e4f89d41471311edc163022'
            '31c399c0e3a69bb845b033ab5c0ad92d44cacb0fd58e0113cd1901e75900515e'
            'a27619fe3bbea2a0fd7c555851089722b1d67818bc014d1dce20620b5eb4bbc5')
validpgpkeys=(5CDD574C22FF4D2480ACABDF5254B96BC608B511) # The OpenDKIM Project <security@opendkim.org>

prepare() {
  cd "$srcdir/OpenARC"
  autoreconf -i
}

build() {
  cd "$srcdir/OpenARC"
  ./configure \
     --prefix=/usr \
     --sbindir=/usr/bin \
     --sysconfdir="/etc/$pkgname" \
     --localstatedir=/var \
  make
}

check() {
  cd "$srcdir/OpenARC"
  make -j1 check
}

package() {
  cd "$srcdir/OpenARC"
  
  make -j1 DESTDIR="$pkgdir/" install
  
  # systemd integration
  install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

  # License
  mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
  for f in LICENSE LICENSE.Sendmail; do
    ln -s ../../doc/$_pkgname/$f "$pkgdir/usr/share/licenses/$pkgname/$f"
  done
}
