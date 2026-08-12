# Maintainer: Brian Thompson <brianrobt at pm.me>

pkgname=gvm2
pkgver=1.5.0
pkgrel=1
pkgdesc='Go Version Manager (community reboot of moovweb/gvm)'
arch=('any')
url='https://github.com/brianrobt/gvm2'
license=('MIT')
depends=('bash' 'curl' 'git')
optdepends=(
  'bison: required to compile Go from source'
  'gcc: required to compile Go from source'
)
provides=("gvm=${pkgver}")
conflicts=('gvm2-git' 'gvm-git')
install=gvm2.install
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'gvm2-setup'
  'gvm2.sh'
)
sha256sums=('4d60c7fd3608f42fb6c42ae2bffde75977a7ecbf43ed2735b421836a3c466fb4'
            '72cd6e88680dd24a6986a0e09d4fc5c454acd3fa17a5052916e44afbd14b12b0'
            '8a14f812c3a9a768320841d1def02a99dcd32e65242ecb0d1aa2ab0e6232ebd5')

package() {
  cd "${pkgname}-${pkgver}"

  install -d "$pkgdir/usr/share/$pkgname"
  cp -a bin binscripts config locales scripts examples \
    VERSION LICENSE README.md ChangeLog \
    "$pkgdir/usr/share/$pkgname/"

  # Placeholder; real user installs go through gvm2-setup into ~/.gvm
  cat >"$pkgdir/usr/share/$pkgname/scripts/gvm" <<'EOF'
export GVM_ROOT="${GVM_ROOT:-$HOME/.gvm}"
. "$GVM_ROOT/scripts/gvm-default"
EOF

  install -Dm755 "$srcdir/gvm2-setup" "$pkgdir/usr/bin/gvm2-setup"
  install -Dm644 "$srcdir/gvm2.sh" "$pkgdir/etc/profile.d/gvm2.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
