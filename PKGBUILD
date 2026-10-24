# Maintainer: Nikolai Zamega <nick.zamega@yandex.ru>
pkgname=niri-pip
pkgver=r7.dfa79f4
pkgrel=1
pkgdesc="Smart Picture-in-Picture, sticky windows and compact overlays for the Niri Wayland compositor."
arch=('x86_64')
url="https://github.com/t1ktakdev/niri-pip"
license=('MIT')
depends=('niri>=26.04' 'rust' 'cargo' 'python' 'systemd' 'bash' 'fuzzel' 'playerctl')
optdepends=(
  'playerctl: media controls'
  )
makedepends=('git')
source=("niri-pip::git+https://github.com/t1ktakdev/niri-pip.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/niri-pip"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/niri-pip"
  cargo build --release --workspace --locked
}

package() {
  cd "$srcdir/niri-pip"

  # Создаем необходимые директории
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/systemd/user"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/niri-pip"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"

  # Копируем бинарные файлы
  install -Dm755 target/release/niripip "$pkgdir/usr/bin/niripip"
  install -Dm755 target/release/niripipd "$pkgdir/usr/bin/niripipd"
  install -Dm755 target/release/niripip-ui "$pkgdir/usr/bin/niripip-ui"
  install -Dm755 integrations/inir/niripip-menu "$pkgdir/usr/bin/niripip-menu"
  install -Dm755 scripts/setup-niri-integration.sh "$pkgdir/usr/bin/niripip-integrate"
  install -Dm755 scripts/remove-niri-integration.sh "$pkgdir/usr/bin/niripip-unintegrate"

  # Копируем конфигурационные файлы
  install -Dm644 config/config.example.toml "$pkgdir/etc/niri-pip/config.toml"
  
  # Копируем systemd сервис
  install -Dm644 systemd/niripip.service "$pkgdir/etc/systemd/user/niripip.service"

  # Копируем desktop файл
  python - "$srcdir/niri-pip/packaging/desktop/niri-pip.desktop.in" "$pkgdir/usr/share/applications/niri-pip.desktop" "/usr/bin/niripip" <<'PY'
from pathlib import Path
import sys

template = Path(sys.argv[1]).read_text()
out = Path(sys.argv[2])
exe = sys.argv[3].replace('\\', '\\\\').replace('"', '\\"')
out.write_text(template.replace('@NIRIPIP@', exe))
PY

  # Документация
  install -Dm644 README.ru.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Создаем .install файл для post-install действий
cat > niri-pip.install <<'INSTALL'
post_install() {
  systemctl --user daemon-reload
  systemctl --user enable niripip.service
  if systemctl --user cat niri.service >/dev/null 2>&1; then
    systemctl --user add-wants niri.service niripip.service
  fi
}

pre_remove() {
  systemctl --user stop niripip.service
  systemctl --user disable niripip.service
}
INSTALL

install=niri-pip.install
