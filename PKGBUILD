# Maintainer: ricardocorreaandrade@proton.me
pkgname=kbrowser-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Keyboard Browser for Linux built with Python, WebKit2Gtk3 and GTK 3"
arch=('x86_64')
url="https://gitlab.com/ricardoca/kbrowser"
license=('GPL')
depends=('python' 'gtk3' 'python-gobject' 'python-requests' 'webkit2gtk' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'python-cairosvg')
makedepends=('git')
source=("git+https://gitlab.com/ricardoca/kbrowser.git")
sha256sums=('SKIP')

package() {
  # Copia os arquivos do repositório para o sistema
  install -d "$pkgdir/usr/share/kbrowser-bin"
  cp -r "$srcdir/kbrowser/"* "$pkgdir/usr/share/kbrowser-bin/"
  
  # Script de inicialização em /usr/bin
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/kbrowser-bin" << 'EOF'
#!/bin/bash
CONFIG_DIR="$HOME/.config/kbrowser-bin"

# Cria o diretório .config/kbrowser-bin se não existir
if [ ! -d "$CONFIG_DIR" ]; then
  echo "Copiando KBrowser para $CONFIG_DIR"
  mkdir -p "$CONFIG_DIR"
  cp -r /usr/share/kbrowser-bin/* "$CONFIG_DIR/"
fi

# Executa o script Python
exec python "$CONFIG_DIR/kbrowser.py"
EOF

  # Cria um link simbólico para compatibilidade
  ln -s /usr/bin/kbrowser-bin "$pkgdir/usr/bin/kbrowser"

  # Copia o ícone para o diretório de ícones do sistema
  install -d "$pkgdir/usr/share/pixmaps"
  cp "$srcdir/kbrowser/icon.png" "$pkgdir/usr/share/pixmaps/kbrowser-bin.png"

  # Arquivo .desktop para menu
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/kbrowser-bin.desktop" << 'EOF'
[Desktop Entry]
Name=KBrowser
Comment=Keyboard Browser with GTK3 and WebKit2
Exec=kbrowser-bin
Icon=/usr/share/pixmaps/kbrowser-bin.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;
EOF
}