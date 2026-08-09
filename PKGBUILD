# Maintainer: l1ngus
pkgname=lucid-spell
pkgver=0.1.0
pkgrel=1
pkgdesc="LLM-powered desktop translator."
arch=('x86_64')
url="https://github.com/l1ngus/lucid-spell"
license=('MIT') # Замени на свою лицензию

# webkit2gtk-4.1 — критически важен для Tauri v2
depends=('webkit2gtk-4.1'
  'libayatana-appindicator'
  'gtk3'
  'glib2'
  'libsoup3'
  'openssl') # Зависимости для сборки (Rust, Node.js)
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'pkgconf' 'openssl')

# Ссылка на архив с исходниками конкретного релиза
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('426aa459f4c27c94e542192dde12e4e7a1a3ca335c95b7e47867697101362421')

prepare() {
  cd "$pkgname-$pkgver"

  npm ci
}

build() {
  cd "$pkgname-$pkgver"
  export CFLAGS="${CFLAGS/ -flto=auto/}"
  export CXXFLAGS="${CXXFLAGS/ -flto=auto/}"
  export LDFLAGS="${LDFLAGS/ -flto=auto/}"
  export NO_STRIP=true
  npm run tauri build
}

package() {
  cd "$pkgname-$pkgver"

  # 1. Установка скомпилированного бинарника
  install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # 2. Установка иконки приложения
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # 3. Создание .desktop файла для запуска из меню
  install -dm755 "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Lucid Spell
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Utility;Education;
EOF
}
