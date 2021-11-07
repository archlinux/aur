# Maintainer: MGislv <nocentinigabriele91@gmail.com>

_name=dropbear
pkgname=dropbear-client
pkgver=2020.81
pkgrel=1
pkgdesc='Lightweight SSH client'
arch=(x86_64)
url='https://github.com/mkj/dropbear'
license=(MIT)
options=(emptydirs)
conflicts=(dropbear)
depends=(libxcrypt zlib)
makedepends=(git)
validpgpkeys=('F7347EF2EE2E07A267628CA944931494F29C6773')
source=("git+$url#commit=d852d69b50187dd81d424846e7dc677ec57e2d4f" # tag: DROPBEAR_2020.81
        localoptions.h)
b2sums=(SKIP
        49628bbce0d26eb33598de276ede705bd592a38b7892c9db0ceebfb0598a1ee6e7e84ed03dbf255ee1adcad0c5214d38dc03e6c04176a405f59a19765cb28388)

prepare() {
  cp -fv localoptions.h $_name/localoptions.h
}

build() {
  cd $_name
  autoconf
  autoheader
  ./configure --disable-syslog --bindir=/usr/bin --prefix=/usr --sbindir=/usr/bin
  make PROGRAMS='dbclient dropbearconvert dropbearkey'
}

package() {
  install -d "$pkgdir/etc/$_name"
  make -C $_name install PROGRAMS='dbclient dropbearconvert dropbearkey' DESTDIR="$pkgdir"
  install -Dm644 $_name/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
