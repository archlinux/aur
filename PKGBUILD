# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
epoch=1
pkgver=5.6.1
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
  test -t 1 && _v='v' || _v=''

  install "-${_v}Dm0755" "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  for _doc in {PRIVACY,README,CLI,SIMPLEX}.md; do
    install  "-${_v}Dm0644" "$_doc" "$pkgdir/usr/share/doc/$pkgname/$_doc"
  done
  install "-${_v}Dm0644" "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install "-${_v}Dm0644" "$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}

sha256sums=(
  'f3e058049049029dd2476f269703f71a5d5f639dccf832f6a83d7dbcb55c46ba'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)
b2sums=(
  'b2c1f7007f53aefd280d09d24044c8a369bc42720eac2805a17cb9af5d4dd509378018e2e40f58c185e01ad85ad2b49501e3b7f883f5427f44411880d613a0a5'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# eof
