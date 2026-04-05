# Maintainer: Adınız <email@adresiniz.com>
pkgname=lexis-git
pkgver=r1.gf406063
pkgrel=1
pkgdesc="Yabancı dil öğrenenler için yapay zeka destekli, modern masaüstü sözlük uygulaması"
arch=('x86_64' 'aarch64')
url="https://github.com/talhacaglar/Lexis"
license=('MIT')
depends=('glibc' 'zlib' 'libx11' 'libxcb' 'libxkbcommon' 'fontconfig' 'freetype2' 'dbus')
makedepends=('git' 'python' 'python-pip' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("lexis::git+https://github.com/talhacaglar/lexis.git"
        "lexis.desktop")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/lexis"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/lexis"
  
  # PyInstaller kullanarak temiz ortamda derle
  python -m venv .venv
  source .venv/bin/activate
  
  pip install --upgrade pip
  pip install -e .
  pip install pyinstaller
  
  pyinstaller --name="lexis" \
            --windowed \
            --onedir \
            --noconfirm \
            --hidden-import="lexis.ui.views" \
            --hidden-import="lexis.ui.widgets" \
            --hidden-import="lexis.workers" \
            --clean \
            lexis/main.py
}

package() {
  cd "$srcdir/lexis"
  
  # Derlenen pyinstaller çıktılarını /opt/lexis içine atıyoruz
  install -dm755 "$pkgdir/opt/lexis"
  cp -r dist/lexis/* "$pkgdir/opt/lexis/"
  
  # Sembolik link (terminalden direkt çalışması için)
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/lexis/lexis "$pkgdir/usr/bin/lexis"

  # Desktop file
  install -Dm644 "$srcdir/lexis.desktop" "$pkgdir/usr/share/applications/lexis.desktop"

  # SVG icon
  if [ -f "packaging/icons/lexis.svg" ]; then
      install -Dm644 "packaging/icons/lexis.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/lexis.svg"
  fi
}
