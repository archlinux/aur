# Maintainer: Marley <warburtonmarley@proton.me>
pkgname=fastflowlm-gtk
pkgver=2.5.5
pkgrel=1
pkgdesc="A minimalist, modern desktop interface for FastFlowLM, built with GTK 4 and Libadwaita."
arch=('any')
url="https://github.com/marleylinux/FastFlowLM-gtk"
license=('MIT')
install="fastflowlm-gtk.install"
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'libsoup3' 'gtksourceview5' 'python-psutil' 'fastflowlm' 'xrt-plugin-amdxdna')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/marleylinux/FastFlowLM-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b3f6b3f6a222d6b91fa6143eeb35a802bfccd12462810d8b08f7a159d69b228')

package() {
  cd "$srcdir/FastFlowLM-"*

  # Install Python files
  install -d "$pkgdir/usr/share/fastflowlm-gtk"
  install -m644 src/*.py "$pkgdir/usr/share/fastflowlm-gtk/"
  chmod 755 "$pkgdir/usr/share/fastflowlm-gtk/app.py"

  # Install custom model avatars
  install -d "$pkgdir/usr/share/fastflowlm-gtk/assets"
  install -m644 src/assets/*.png "$pkgdir/usr/share/fastflowlm-gtk/assets/"

  # Install Icon
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -m644 "src/assets/com.marley.FastFlowLM-gtk.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.marley.FastFlowLM-gtk.png"

  # Install Desktop file
  install -Dm644 "com.marley.FastFlowLM-gtk.desktop" "$pkgdir/usr/share/applications/com.marley.FastFlowLM-gtk.desktop"

  # Install License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/fastflowlm-gtk/LICENSE"

  # Install memlock limits config
  install -d "$pkgdir/etc/security/limits.d"
  cat <<WRAPPER > "$pkgdir/etc/security/limits.d/99-fastflowlm-gtk.conf"
* - memlock unlimited
WRAPPER
  chmod 644 "$pkgdir/etc/security/limits.d/99-fastflowlm-gtk.conf"

  # Create executable wrapper
  install -d "$pkgdir/usr/bin"
  cat <<WRAPPER > "$pkgdir/usr/bin/fastflowlm-gtk"
#!/bin/sh
export PYTHONPATH="/usr/share/fastflowlm-gtk:\$PYTHONPATH"
exec python3 /usr/share/fastflowlm-gtk/app.py "\$@"
WRAPPER
  chmod +x "$pkgdir/usr/bin/fastflowlm-gtk"
}
