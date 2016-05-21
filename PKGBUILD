# Maintainer: Oliver (thechauffeur) Weidner <Oliver.Weidner@gmail.com>

pkgname=tinc-ponyhof-git
pkgver=release.1.1pre11.r551.gaf0c289
pkgrel=1
pkgdesc="VPN (Virtual Private Network) daemon (tinc ponyhof development version)"
arch=('i686' 'x86_64')
url="https://github.com/thorkill/tinc"
license=('GPL')
depends=('lzo2' 'zlib' 'openssl')
makedepends=('git')
optdepends=('wxpython: gui support')
provides=('tinc')
conflicts=('tinc' 'tinc-pre')
source=('git+https://github.com/thorkill/tinc.git#branch=thkr-1.1-ponyhof')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/tinc

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/tinc

  autoreconf -fsi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir"/tinc

  make DESTDIR="$pkgdir/" install

  install -dm755 "$pkgdir"/usr/share/tinc/examples
  cp -rv doc/sample-config "$pkgdir"/usr/share/tinc/examples
  find "$pkgdir"/usr/share/tinc/examples -type f -exec chmod 644 {} +
  find "$pkgdir"/usr/share/tinc/examples -type d -exec chmod 755 {} +

  install -Dm644 "$srcdir/tinc/bash_completion.d/tinc" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm644 "$srcdir/tinc/systemd/tinc.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/tinc/systemd/tinc@.service" -t "$pkgdir/usr/lib/systemd/system/"
}
