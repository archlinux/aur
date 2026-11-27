# Maintainer: MikolajQ

pkgname=homemesh
pkgver=0.8.3
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
sha256sums=('95bdcd8b50d66fb9d64689a21952a87f69047b186b1e9c51d50b23aa0f2f676d')

check() {
  cd "$pkgname-$pkgver"
  # The full suite (make test: 160 tests, real sshd instances) runs before
  # every release. Here only whether this system's Python loads every
  # module and the helpers parse: a fraction of a second. The window needs
  # a display, so it is checked by compileall in package() alone.
  python - <<'EOF'
import ast, importlib, pkgutil
import homemesh
for module in pkgutil.iter_modules(homemesh.__path__):
    if module.name not in ("__main__", "gui"):
        importlib.import_module(f"homemesh.{module.name}")
for script in ("helper/homemesh-helper", "helper/homemesh-route"):
    with open(script, encoding="utf-8") as source:
        ast.parse(source.read(), script)
EOF
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
