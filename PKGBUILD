# Maintainer: Michał Lisowski <lisu at riseup dot net>
pkgname=pwarden-git
pkgver=r5.06951af
pkgrel=1
pkgdesc="Bitwarden CLI helper that searches items and copies the password to clipboard"
arch=('any')
url="https://github.com/edupr91/pwarden"
license=('Apache')
depends=(
  'bitwarden-cli'
  'python'
  'python-inquirerpy'
  'python-pyperclip'
  'python-setuptools'
)
makedepends=('git')
optdepends=(
  'xclip: clipboard on X11'
  'wl-clipboard: clipboard on Wayland'
)
provides=('pwarden')
conflicts=('pwarden')
source=("$pkgname::git+https://github.com/edupr91/pwarden.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  # PyInquirer → InquirerPy (classic compatibility)
  sed -Ei "s/^from PyInquirer import prompt, Separator$/from InquirerPy import prompt\nfrom InquirerPy.separator import Separator/" pwarden.py
}

build() {
  cd "$srcdir/$pkgname"
  # nothing to build (single python script)
  :
}

package() {
  cd "$srcdir/$pkgname"
  # Install script under /usr/lib and a small launcher into /usr/bin
  install -Dm644 pwarden.py "$pkgdir/usr/lib/pwarden/pwarden.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pwarden" <<'EOF'
#!/usr/bin/env bash
exec python /usr/lib/pwarden/pwarden.py "$@"
EOF

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
