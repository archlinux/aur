# Maintainer: ricardocorreaandrade@proton.me
pkgname=kbrowser-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Keyboard Browser for Linux built with Electron"
arch=('x86_64')
url="https://gitlab.com/ricardoca/kbrowser-electron"
license=('GPL')
depends=('nodejs' 'npm' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
makedepends=('git')
source=("git+https://gitlab.com/ricardoca/kbrowser-electron.git")
sha256sums=('SKIP')

package() {
  # Diretório de destino da aplicação
  install -d "$pkgdir/usr/share/kbrowser-bin"
  
  # Copia os arquivos do repositório
  cp -r "$srcdir/kbrowser-electron/"* "$pkgdir/usr/share/kbrowser-bin/"

  # Executa npm install dentro do diretório do app
  cd "$pkgdir/usr/share/kbrowser-bin"
  npm install --omit=dev

  # Cria o wrapper em /usr/bin
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/kbrowser-bin" << 'EOF'
#!/bin/bash
CONFIG_DIR="$HOME/.config/kbrowser-bin"

# Se não existir, copia a pasta inteira do app
if [ ! -d "$CONFIG_DIR" ]; then
  echo "Copiando KBrowser para $CONFIG_DIR"
  mkdir -p "$CONFIG_DIR"
  cp -r /usr/share/kbrowser-bin/* "$CONFIG_DIR/"
  cd "$CONFIG_DIR"
  npm install --omit=dev
fi

cd "$CONFIG_DIR"
exec npm start
EOF

  # Cria um link simbólico
  ln -s /usr/bin/kbrowser-bin "$pkgdir/usr/bin/kbrowser"

  # Ícone
  install -d "$pkgdir/usr/share/pixmaps"
  cp "$srcdir/kbrowser-electron/assets/icon.png" "$pkgdir/usr/share/pixmaps/kbrowser-bin.png"

  # Arquivo .desktop
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/kbrowser-bin.desktop" << 'EOF'
[Desktop Entry]
Name=KBrowser
Comment=Keyboard Browser built with Electron
Exec=kbrowser-bin
Icon=/usr/share/pixmaps/kbrowser-bin.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;
EOF
}

