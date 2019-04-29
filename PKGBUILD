pkgname=oor
pkgver=1.3.0
pkgrel=1
pkgdesc="Open Overlay Router (formerly LISPmob) - Locator/ID Separation Protocol (LISP) and LISP Mobile Node implementation"
url="https://openoverlayrouter.org/"
arch=('x86_64' 'i686' 'armv6h')
license=('GPL2')
depends=('openssl' 'confuse' 'libcap' 'libxml2' 'zeromq')
makedepends=('git' 'gengetopt')
provides=('lispmob')
replaces=('lispmob')
backup=("etc/oor.conf")
_commit=d86a56e3440c1c190ec2c9370ed5f12285b79b46
source=("git+https://github.com/OpenOverlayRouter/oor#commit=$_commit"
        "oor.service")
sha256sums=('SKIP'
            'b952f567e6c506d09aab10b4fae49c9cee31affb89b7a18040c2fa7f1a8df153')

pkgver() {
  cd oor
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd oor
  make
}

package() {
  cd oor
  install -dm755 "$pkgdir"/usr/lib/systemd/system
  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr/bin/" \
    SERVICEPREF="$pkgdir/usr/lib/systemd/system/" \
    install
  install -Dm600 oor/oor.conf.example "$pkgdir"/usr/share/doc/"$pkgname"/oor.conf
  install -Dm644 "$srcdir"/oor.service "$pkgdir"/usr/lib/systemd/system/oor.service
}

# vim:set ts=2 sw=2 et:
