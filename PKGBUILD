# -*- sh -*-

# Maintainer: Klaus Alexander Seistrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
epoch=1
pkgver=6.2.4
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
sha512sums=(
  '3033744136b7c0b17c7d735f14cbaff7c031ee21096bf40068beaddce64f864c85c096693a6895f67eee34f896a102869de2b2436ad82c6d878d3fc8da6232e8'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
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

  # shellcheck disable=SC1111
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

  install -vDm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    {CLI,PRIVACY,README,SIMPLEX}.md
  install -vDm0644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -vDm0644 "$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}

# eof
