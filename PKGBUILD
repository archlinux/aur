# Maintainer: Brian Thompson <brianrobt at pm.me>

pkgname=gvm2-git
_pkgname=gvm2
pkgver=1.1.0.r0.g0000000
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
provides=('gvm')
conflicts=('gvm-git')
install=gvm2-git.install
source=(
  "git+${url}.git"
  'gvm2-setup'
  'gvm2.sh'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgname"
  local desc
  if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    printf '%s' "$(echo "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
  else
    printf '1.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

package() {
  cd "$_pkgname"

  install -d "$pkgdir/usr/share/$_pkgname"
  cp -a bin binscripts config locales scripts examples \
    VERSION LICENSE README.md AGENTS.md ChangeLog \
    "$pkgdir/usr/share/$_pkgname/"

  # Placeholder; real user installs go through gvm2-setup into ~/.gvm
  cat >"$pkgdir/usr/share/$_pkgname/scripts/gvm" <<'EOF'
export GVM_ROOT="${GVM_ROOT:-$HOME/.gvm}"
. "$GVM_ROOT/scripts/gvm-default"
EOF

  install -Dm755 "$srcdir/gvm2-setup" "$pkgdir/usr/bin/gvm2-setup"
  install -Dm644 "$srcdir/gvm2.sh" "$pkgdir/etc/profile.d/gvm2.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('SKIP'
            '72cd6e88680dd24a6986a0e09d4fc5c454acd3fa17a5052916e44afbd14b12b0'
            '8a14f812c3a9a768320841d1def02a99dcd32e65242ecb0d1aa2ab0e6232ebd5')
