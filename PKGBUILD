# Maintainer: Oliver (thechauffeur) Weidner <Oliver.Weidner@gmail.com>

pkgname=tinc-ponyhof-git
pkgver=release.1.1pre11.r308.g1f2e14d
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
source=('git+https://github.com/thorkill/tinc.git#branch=thkr-1.1-ponyhof'
        'tincd@.service'
        'tinc-gui.patch')
md5sums=('SKIP'
         '2b2cbedd14f921a2a7fdbf4315d9dbd7'
         '2f32295af4f4d471f411a6e41ec70afa')

pkgver() {
  cd "$srcdir"/tinc

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/tinc

  patch -p0 < "$srcdir"/tinc-gui.patch

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

  install -Dm644 "$srcdir/tincd@.service" "$pkgdir/usr/lib/systemd/system/tincd@.service"
}
