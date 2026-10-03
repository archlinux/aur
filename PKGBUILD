# Maintainer: l1ngus
pkgname=lucid-spell
pkgver=1.2.0
pkgrel=1
pkgdesc="LLM-powered desktop translator."
arch=('x86_64')
url="https://github.com/l1ngus/lucid-spell"
license=('MIT')

depends=('webkit2gtk-4.1'
  'libayatana-appindicator'
  'gtk3'
  'glib2'
  'libsoup3'
  'openssl')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'pkgconf' 'openssl')

# !strip и !debug запрещают makepkg трогать бинарник и создавать debug-пакет.
# !lto автоматически убирает -flto=auto из CFLAGS, что спасает Rust от ошибок.
options=('!strip' '!debug' '!lto')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30b9131e988bc4ac9a5fc4a1c3d3e29c6ef43f23f7b37e06887d541599dfb6c7')

prepare() {
  cd "$pkgname-$pkgver"
  npm ci
}

build() {
  cd "$pkgname-$pkgver"

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
