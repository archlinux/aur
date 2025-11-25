pkgname=rice-switcher
pkgver=1.3
pkgrel=1
pkgdesc="CLI tool for managing and switching between Linux config sets"
arch=('any')
url="https://github.com/S1rEx1/Rice-Switcher"
license=('MIT')
depends=('jq' 'fzf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/S1rEx1/Rice-Switcher/archive/refs/tags/rice_manager.tar.gz")
sha256sums=('b4d9c9cf10634b04670f722541f8ff91859aab014ec0c0541142b695e8790a83')

package() {
  cd "${srcdir}/Rice-Switcher-rice_manager"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/rice-switcher/lib"
  install -d "$pkgdir/usr/share/rice-switcher"

  # Основной скрипт (имя файла config-switcher.sh)
  install -m755 config-switcher.sh "$pkgdir/usr/share/rice-switcher/core.sh"

  # Библиотеки
  install -m644 lib/*.sh "$pkgdir/usr/share/rice-switcher/lib/"

  # Catalog + default config
  install -m644 rices.json "$pkgdir/usr/share/rice-switcher/rices.json"
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
