# -*- sh -*-

# Maintainer: Klaus Alexander Seistrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='simplex-chat-bin'
_pkgname="${pkgname%%-bin}"
epoch=1
pkgver=6.3.2
pkgrel=5
pkgdesc='A 100% private-by-design chat platform for the command-line (pre-compiled)'
arch=('x86_64')
_platform='ubuntu-22_04-x86-64'
url='https://simplex.chat/'
_relurl="https://github.com/$_pkgname/$_pkgname/releases/download/v$pkgver"
_rawurl="https://raw.githubusercontent.com/$_pkgname/$_pkgname/stable"
source=(
  "$_pkgname-$pkgver::$_relurl/$_pkgname-$_platform"
  "_sha256sums-$pkgver::$_relurl/_sha256sums"
  "_sha256sums-$pkgver.asc::$_relurl/_sha256sums.asc"
  "PRIVACY-$pkgver.md::$_rawurl/PRIVACY.md"
  "README-$pkgver.md::$_rawurl/README.md"
  "CLI-$pkgver.md::$_rawurl/docs/CLI.md"
  "SIMPLEX-$pkgver.md::$_rawurl/docs/SIMPLEX.md"
  'logo-symbol-dark.svg'
  'logo-symbol-light.svg'
  'simplex-chat.desktop'
)
_skip=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
# SimpleX Chat team <chat@simplex.chat>
# https://keys.openpgp.org/search?q=chat%40simplex.chat
validpgpkeys=('FB44AF81A45BDE327319797C85107E357D4A17FC')
sha256sums=(
  '0677adaac345e3a0f7f0eee978856de23f963e5778c935b16b5069a658971728'
  "${_skip[@]}"
)
sha512sums=(
  '9a2d355d4095d9f36d6ac2337dde109a9980200d6a6b44efc14ab59402ff70b55a37db55efe896c87b4adee02fe13be7417a024e69a38c28ed65e69b327825c8'
  "${_skip[@]}"
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
conflicts=("${provides[@]}")

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

  for _doc in CLI PRIVACY README SIMPLEX; do
    install -vDm0644 "$_doc-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/$_doc.md"
  done

  install -vDm0644 -t "$pkgdir/usr/share/applications" "$_pkgname.desktop"
  install -vDm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/app" "$_pkgname.svg"
}

# eof
