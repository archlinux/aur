# Maintainer: lux0id <a89021390@gmail.com>
pkgname=clypra-git
pkgver=r320.c771693
pkgrel=1
pkgdesc="A modern video editor alternative to CapCut, built with Tauri and React"
arch=('x86_64' 'aarch64')
url="https://github.com/AIEraDev/Clypra"
license=('MIT')
depends=('ffmpeg' 'gtk3' 'webkit2gtk-4.1' 'libsoup3')
makedepends=('git' 'nodejs' 'npm' 'rust' 'cargo')
provides=('clypra')
conflicts=('clypra')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Clypra"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/Clypra"
  
  # Установка зависимостей фронтенда
  npm install
  
  # Сборка Tauri-приложения (production, без создания .deb/.rpm)
  npm run tauri build -- --no-bundle
}

package() {
  cd "$srcdir/Clypra"

  # 1. Установка исполняемого файла
  install -Dm755 "src-tauri/target/release/clypra" "$pkgdir/usr/bin/clypra"

  # 2. Установка иконки приложения
  if [ -f "src-tauri/icons/512x512.png" ]; then
    install -Dm644 "src-tauri/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/clypra.png"
  elif [ -f "src-tauri/icons/icon.png" ]; then
    install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/clypra.png"
  fi

  # 3. Создание и установка .desktop файла для системного меню
  install -d "$pkgdir/usr/share/applications"
  cat <<EOF > "$pkgdir/usr/share/applications/clypra.desktop"
[Desktop Entry]
Name=Clypra
Comment=Modern video editor (CapCut alternative)
Exec=clypra
Icon=clypra
Terminal=false
Type=Application
Categories=Video;AudioVideo;VideoEditing;
EOF
  chmod 644 "$pkgdir/usr/share/applications/clypra.desktop"

  # 4. Установка лицензии (если есть)
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
