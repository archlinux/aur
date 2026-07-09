# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='icann-rdap'
pkgname="$_pkgname-bin"
pkgdesc='ICANN implementation of RDAP: the Registry Data Access Protocol (pre-compiled)'
pkgver=0.0.30
pkgrel=1
url="https://github.com/icann/$_pkgname"
arch=('aarch64' 'x86_64')
_rawurl="https://raw.githubusercontent.com/icann/$_pkgname/refs/heads/main"
license=('Apache-2.0 OR MIT')
depends=('glibc' 'libgcc')
provides=('rdap' "$_pkgname")
conflicts=('openrdap-client' "${provides[@]}")
source_aarch64=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$CARCH-unknown-linux-gnu.tar.gz"
  "README-$pkgver.md::$_rawurl/README.md"
  "README-cli-$pkgver.md::$_rawurl/$_pkgname-cli/README.md"
  "README-srv-$pkgver.md::$_rawurl/$_pkgname-srv/README.md"
)
source_x86_64=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$CARCH-unknown-linux-gnu.tar.gz"
  "README-$pkgver.md::$_rawurl/README.md"
  "README-cli-$pkgver.md::$_rawurl/$_pkgname-cli/README.md"
  "README-srv-$pkgver.md::$_rawurl/$_pkgname-srv/README.md"
)
_skip=('SKIP' 'SKIP' 'SKIP')

package() {
  # Binaries
  install -Dm0755 -t "$pkgdir/usr/bin" \
    rdap{,-srv{,-{data,store,test-data}},-test}

  # Docs (READMEs)
  install -Dm0644 "README-$pkgver.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  for _xxx in cli srv; do
    install -Dm0644 "README-$_xxx-$pkgver.md" \
      "$pkgdir/usr/share/doc/$pkgname/README-$_xxx.md"
  done

  # Licenses (only the MIT license is actually required here)
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    ../LICENSES/{Apache-2.0,MIT}.txt

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && {
      test -d "$pkgname" || continue
      ln -sf "$pkgname" "$_pkgname"
    }
  done
}

sha256sums_aarch64=(
  'e5921340f884670dd6bfca155e4d0a8acfd2d1afae5a6172789964fb1dfda142'
  "${_skip[@]}"
)
sha256sums_x86_64=(
  '80eca91266ab3548756a6d1b88d915e0cfd936a186f7690171103429f1436929'
  "${_skip[@]}"
)

# eof
