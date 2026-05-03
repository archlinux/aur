# Maintainer: Rootly <arbuzek1488337@gmail.com>
pkgname=dotmaster-git
pkgver=1.0.0
pkgrel=9
pkgdesc="Interactive dotfiles installer written in Rust"
arch=('x86_64')
url="https://github.com/Minish777/dotmaster"
license=('MIT')
depends=('gcc-libs' 'git')
makedepends=('cargo')
provides=('dotmaster')
conflicts=('dotmaster')
source=('git+https://github.com/Minish777/dotmaster.git')
sha256sums=('SKIP')

build() {
  # Заходим в корень репозитория
  cd "$srcdir/dotmaster"
  # Ищем, где лежит Cargo.toml, и собираем там
  local cargo_dir=$(find . -name "Cargo.toml" -printf '%h\n' | head -n 1)
  cd "$cargo_dir"
  cargo build --release
}

package() {
  cd "$srcdir/dotmaster"
  # Находим скомпилированный бинарник в папках target
  local bin_path=$(find . -type f -name "dotmaster" -path "*/release/*" | head -n 1)
  
  if [ -z "$bin_path" ]; then
    echo "ОШИБКА: Бинарник не найден!"
    exit 1
  fi
  
  echo "Нашел бинарник по пути: $bin_path"
  install -Dm755 "$bin_path" "$pkgdir/usr/bin/dotmaster"
}