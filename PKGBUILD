# Maintaner: Giovanni Scafora <scafora.giovanni@gmail.com>

pkgname=sle-suite-pro-git
pkgver=0.0.3.r4.ge55939a
pkgrel=1
pkgdesc="Advanced tool for SLE cards"
arch=('any')
url="https://github.com/wikilift/sle-suite-pro"
license=('NCL')
depends=('pyside6' 'python-pyscard' 'hicolor-icon-theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wikilift/sle-suite-pro.git'
        'sle-suite-pro.desktop')
sha256sums=('SKIP'
            '1202793fa26b061309defe4240b8b65334486959b7e5a7537babac036278d77a')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -d "$pkgdir/usr/share/${pkgname%-git}"
  cp -r app.py assets controllers core drivers gui i18n model "$pkgdir/usr/share/${pkgname%-git}/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/${pkgname%-git}" << 'EOF'
#!/usr/bin/env bash
exec /usr/bin/python3 /usr/share/sle-suite-pro/app.py "$@"
EOF

  chmod +x "$pkgdir/usr/bin/${pkgname%-git}"

  # Icon
  if [ -f assets/logo.png ]; then
    install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    install -Dm644 assets/logo.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/sle-suite-pro.png"
  fi

  # Desktop file
  install -d "$pkgdir/usr/share/applications"
  install -Dm644 ../../sle-suite-pro.desktop "$pkgdir/usr/share/applications/sle-suite-pro.desktop"
}
