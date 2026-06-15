# Maintainer: Marley <warburtonmarley@proton.me>
pkgname=fetch-gtk
pkgver=1.0.2
pkgrel=1
pkgdesc="A modern, polished GTK4/Libadwaita graphical interface similar to fastfetch."
arch=('any')
url="https://github.com/marleylinux/fetch-gtk"
license=('GPL-3.0-only')
depends=('python>=3.11' 'python-gobject' 'gtk4' 'libadwaita')
conflicts=('gtkfetch')
replaces=('gtkfetch')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marleylinux/fetch-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('797628e9ec1ed2771f221b6dee2440759a606be6aa04630a484f536bb29a8ba9')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # copy our python code files to the system share folder
  install -d "$pkgdir/usr/share/fetch-gtk"
  install -m644 src/*.py "$pkgdir/usr/share/fetch-gtk/"
  chmod 755 "$pkgdir/usr/share/fetch-gtk/app.py"

  # put our graphics and logos in the asset folder
  install -d "$pkgdir/usr/share/fetch-gtk/assets"
  cp -r src/assets/. "$pkgdir/usr/share/fetch-gtk/assets/"
  find "$pkgdir/usr/share/fetch-gtk/assets" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/fetch-gtk/assets" -type f -exec chmod 644 {} +

  # set up the system launcher icons
  for size in 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    install -m644 "src/assets/com.marley.fetch-gtk.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/com.marley.fetch-gtk.png"
  done

  # install the menu desktop launcher
  install -Dm644 "com.marley.fetch-gtk.desktop" "$pkgdir/usr/share/applications/com.marley.fetch-gtk.desktop"

  # build a simple executable script in /usr/bin to run the app
  install -d "$pkgdir/usr/bin"
  cat <<WRAPPER > "$pkgdir/usr/bin/fetch-gtk"
#!/bin/sh
export PYTHONPATH="/usr/share/fetch-gtk:\$PYTHONPATH"
exec python3 /usr/share/fetch-gtk/app.py "\$@"
WRAPPER
  chmod +x "$pkgdir/usr/bin/fetch-gtk"
}
