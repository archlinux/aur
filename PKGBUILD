# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
epoch=1
pkgver=5.4.2
pkgrel=1
pkgdesc='A 100% private-by-design chat platform for the command-line (pre-compiled)'
arch=('x86_64')
_platform='ubuntu-22_04-x86-64'
url='https://simplex.chat/'
_rawurl='https://raw.githubusercontent.com/simplex-chat/simplex-chat/stable'
source=(
  "$_pkgname-$pkgver::https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver/$_pkgname-$_platform"
  "$_rawurl/PRIVACY.md"
  "$_rawurl/README.md"
  "$_rawurl/docs/CLI.md"
  "$_rawurl/docs/SIMPLEX.md"
  'logo-symbol-dark.svg'
  'logo-symbol-light.svg'
  'simplex-chat.desktop'
)
license=('AGPL3')
depends=(
  'glibc'
  'gmp'
  'hicolor-icon-theme'
  'openssl'
  'zlib'
)
provides=('simplex-chat')
conflicts=('simplex-chat')

build() {
  case "${SIMPLEX_ICON:-light}" in
    light ) _shade='light'; _other='dark'  ;;
     dark ) _shade='dark' ; _other='light' ;;
        * ) _shade='light'; _other='dark'  ;;
  esac

  cat <<EOF
Will package an icon suitable for a $_shade theme. If this is
not what you want, set the environment variable \$SIMPLEX_ICON
to “$_other”. E.g.:

  env SIMPLEX_ICON=$_other makepkg [options …]
EOF

  cp "logo-symbol-$_shade.svg" "$_pkgname.svg"
}

package() {
  cd "$srcdir"

  # Let's be more verbose if standard output is a TTY:
  test -t 1 && _verbose='v' || _verbose=''

  install "-${_verbose}Dm0755" "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  for _doc in {PRIVACY,README,CLI,SIMPLEX}.md; do
    install  "-${_verbose}Dm0644" "$_doc" "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done
  install "-${_verbose}Dm0644" "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install "-${_verbose}Dm0644" "$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}

sha256sums=(
  'cc40866526ab384c61fcd3891761c3ee4c05c493444f5e428d2a824f2a94ae25'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
