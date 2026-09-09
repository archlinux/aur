# Maintainer: Máté Zoltán Farkas <mail@example.com>

pkgname=widic
pkgver=0.1.2
pkgrel=1
pkgdesc="A Wiktionary viewer in your terminal."
arch=('any')
url="https://github.com/matezoltanfarkas/widic"
license=('GPL-3.0-only')

depends=(
  'python'
  'python-beautifulsoup4'
  'python-requests'
  'python-textual'
)

source=("git+https://github.com/matezoltanfarkas/widic.git#branch=main")
b2sums=('SKIP')

# pkgver() {
#   cd "$srcdir/widic"
#   git describe --long --tags --always |
#     sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

package() {
  cd "$srcdir/widic"

  install -Dm644 main.py \
    "$pkgdir/usr/share/widic/main.py"

  install -Dm644 renderer.py \
    "$pkgdir/usr/share/widic/renderer.py"

  for file in renderers/*.py; do
    install -Dm644 "$file" \
      "$pkgdir/usr/share/widic/$file"
  done

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/bin"

  cat >"$pkgdir/usr/bin/widic" <<'EOF'
#!/bin/sh
exec /usr/bin/python /usr/share/widic/main.py "$@"
EOF

  chmod 755 "$pkgdir/usr/bin/widic"
}
