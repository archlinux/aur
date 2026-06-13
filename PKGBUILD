# Maintainer: Julien Virey <julien.virey+aur@gmail.com>

pkgname=input-remapper
pkgver=2.2.1
pkgrel=1
pkgdesc="A tool to change and program the mapping of your input device buttons."
arch=('any')
url="https://github.com/sezanzeb/input-remapper"
license=('GPL-3.0-or-later')
depends=('gtk3' 'gtksourceview4' 'python-cairo' 'python-evdev' 'python-gobject' 'python-packaging' 'python-psutil' 'python-pydantic' 'python-dasbus' 'python-pydbus')
optdepends=('xorg-xmodmap: symbol names matching the keyboard layout')
makedepends=(python-build python-installer python-wheel python-setuptools gettext)
conflicts=("$pkgname-bin" "$pkgname-git" 'key-mapper')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6ad3d58829e29f2943cbc874b910a94e699428547240f3e5b2a4acbd34e62d2f')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
  for po_file in po/*.po; do
    lang=$(basename ${po_file%.*})
    target="lang/$lang/LC_MESSAGES"
    mkdir -p "$target"
    msgfmt -o "$target/input-remapper.mo" "$po_file"
  done
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 data/input-remapper-autoload.desktop -t "$pkgdir/etc/xdg/autostart/"
  install -Dm644 data/input-remapper.service -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 data/*.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 data/input-remapper-gtk.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 data/inputremapper.Control.conf -t "$pkgdir/usr/share/dbus-1/system.d/"
  install -Dm644 data/input-remapper.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 data/input-remapper.policy -t "$pkgdir/usr/share/polkit-1/actions/"
  install -Dm644 data/style.css -t "$pkgdir/usr/share/input-remapper/"
  install -Dm644 data/input-remapper.glade -t "$pkgdir/usr/share/input-remapper/"
  cp -r lang "$pkgdir/usr/share/input-remapper/"
  install -Dm755 bin/* -t "$pkgdir/usr/bin/"
}
