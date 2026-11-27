# Maintainer: MikolajQ

pkgname=homemesh
pkgver=0.8.0
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
sha256sums=('1e0987ffaa1e2a9426186ae9d74f660c8f7b5c89b2e975c329e1c8c0b50b6554')

check() {
  cd "$pkgname-$pkgver"
  # Without real pairing between sshd instances: that is tested before each release.
  HOMEMESH_QUICK_TESTS=1 python -m unittest discover -s tests -q
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
