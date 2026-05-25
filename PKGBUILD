# Maintainer: Marley <warburtonmarley@proton.me>
pkgname=fastflowlm-gtk
pkgver=2.0.0
pkgrel=1
pkgdesc="A minimalist, modern desktop interface for FastFlowLM, built with GTK 4 and Libadwaita."
arch=('any')
url="https://github.com/marleylinux/FastFlowLM-gtk"
license=('MIT')
install="fastflowlm-gtk.install"
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'libsoup3' 'gtksourceview5' 'python-psutil' 'fastflowlm' 'xrt-plugin-amdxdna')
makedepends=('imagemagick')
source=("$pkgname-$pkgver.tar.gz::https://github.com/marleylinux/FastFlowLM-gtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c32dac0bf707cc3cddfa210ca0fdc431a0c5c0793572a475db7107c0366b23bd')

package() {
  cd "$srcdir/FastFlowLM-"*

  # Install Python files
  install -d "$pkgdir/usr/share/fastflowlm-gtk"
  install -m644 *.py "$pkgdir/usr/share/fastflowlm-gtk/"
  chmod 755 "$pkgdir/usr/share/fastflowlm-gtk/app.py"

  # Install custom model avatars
  install -d "$pkgdir/usr/share/fastflowlm-gtk/assets"
  for avatar in llama qwen gemini mistral phi deepseek liquid whisper nanbeige gpt_oss; do
    if [ -f "$avatar.png" ]; then
      install -m644 "$avatar.png" "$pkgdir/usr/share/fastflowlm-gtk/assets/$avatar.png"
    fi
  done

  # Install Icon (Convert to PNG with transparency preservation)
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  magick "flm-gtk.webp" "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.marley.FastFlowLM-gtk.png"

  # Install Desktop file
  install -Dm644 "com.marley.FastFlowLM-gtk.desktop" "$pkgdir/usr/share/applications/com.marley.FastFlowLM-gtk.desktop"

  # Create executable wrapper
  install -d "$pkgdir/usr/bin"
  cat <<WRAPPER > "$pkgdir/usr/bin/fastflowlm-gtk"
#!/bin/sh
export PYTHONPATH="/usr/share/fastflowlm-gtk:\$PYTHONPATH"
exec python /usr/share/fastflowlm-gtk/app.py "\$@"
WRAPPER
  chmod +x "$pkgdir/usr/bin/fastflowlm-gtk"
}
