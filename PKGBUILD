pkgname=rice-switcher
pkgver=1.0
pkgrel=1
pkgdesc="CLI tool for managing and switching between Linux config sets"
arch=('any')
url="https://github.com/S1rEx1/Rice-Switcher"
license=('MIT')
depends=('jq' 'fzf')
source=("https://github.com/S1rEx1/Rice-Switcher/archive/refs/heads/main.tar.gz")
sha256sums=('c56d68fca23977dbaeeb88ff338779bdec694185e1dbf5bb871c571fbd623671')

package() {
  cd "${srcdir}/Rice-Switcher-main"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/rice-switcher/lib"
  install -d "$pkgdir/usr/share/rice-switcher"

  # Основной скрипт
  install -m755 config-switcher.sh "$pkgdir/usr/share/rice-switcher/core.sh"

  # Библиотеки
  install -m644 lib/*.sh "$pkgdir/usr/share/rice-switcher/lib/"

  # Конфиг (в правильном месте)
  install -m644 config.json "$pkgdir/usr/share/rice-switcher/config.json"

  # Wrapper
  cat >"$pkgdir/usr/bin/rice-switcher" <<'EOF'
#!/bin/bash
export RICE_SWITCHER_LIB_DIR="/usr/share/rice-switcher/lib"
export RICE_SWITCHER_CONFIG="/usr/share/rice-switcher/config.json"
exec /usr/share/rice-switcher/core.sh "$@"
EOF

  chmod +x "$pkgdir/usr/bin/rice-switcher"
}
