# Maintainer: MikolajQ

pkgname=homemesh
pkgver=0.5.0
pkgrel=1
pkgdesc='Open the home folders of your other computers in any file manager; pair them with a code'
arch=('any')
url='https://github.com/MikolajQ/homemesh'
license=('MIT')
depends=('gtk4' 'openssh' 'polkit' 'python' 'python-gobject')
makedepends=('gettext' 'make')
optdepends=('gvfs: open the computers in Nautilus, Nemo, Thunar and Caja'
            'kio-extras: open the computers in Dolphin'
            'avahi: name.local addresses on systems without systemd-resolved'
            'nss-mdns: name.local addresses together with avahi'
            'bubblewrap: share only chosen folders'
            'tailscale: reach the computers away from home (or another VPN)')
# Python only: nothing to strip, no debug package.
options=('!strip' '!debug')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('add8fe84578fd6c7a08a6052aa520aa1bd3b55b298881d0e7645161c0144b56f')

check() {
  cd "$pkgname-$pkgver"
  python -m unittest discover -s tests -q
}

package() {
  cd "$pkgname-$pkgver"
  make -s DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md README.pl.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  # Private module directory that users cannot write to: compile now so
  # Python does not try at every start.
  python -m compileall -q -o 0 -o 1 -s "$pkgdir" -p / "$pkgdir/usr/lib/$pkgname"
}
