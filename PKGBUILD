# Maintaner: Giovanni Scafora <scafora.giovanni@gmail.com>

pkgname=sle-suite-pro-git
pkgver=0.0.3.r4.ge55939a
pkgrel=1
pkgdesc="Advanced tool for SLE cards"
arch=('any')
url="https://github.com/wikilift/sle-suite-pro"
license=('NCL')
depends=('pyside6' 'python-pyscard')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wikilift/sle-suite-pro.git')
sha256sums=('SKIP')

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
}
