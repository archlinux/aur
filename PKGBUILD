# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Mason <mason dot elmore at gmail dot com>

_pkgname='icann-rdap'
pkgname="$_pkgname-bin"
pkgdesc='ICANN implementation of RDAP: the Registry Data Access Protocol (pre-compiled)'
pkgver=1.0.1
pkgrel=1
changelog="$_pkgname.changelog"
url="https://github.com/icann/$_pkgname"
arch=('aarch64' 'x86_64')
_rawurl="https://raw.githubusercontent.com/icann/$_pkgname/refs/heads/main"
license=('Apache-2.0 OR MIT')
depends=('glibc' 'libgcc')
provides=('rdap' "$_pkgname")
conflicts=('openrdap-client' "${provides[@]}")

_readmes=(
  "README-$pkgver.md::$_rawurl/README.md"
  "README-cli-$pkgver.md::$_rawurl/$_pkgname-cli/README.md"
  "README-srv-$pkgver.md::$_rawurl/$_pkgname-srv/README.md"
)

_licenses=(
  "$_rawurl/LICENSE-APACHE"
  "$_rawurl/LICENSE-MIT"
)

source_aarch64=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$CARCH-unknown-linux-gnu.tar.gz"
  "${_readmes[@]}" "${_licenses[@]}"
)
source_x86_64=(
  "$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$CARCH-unknown-linux-gnu.tar.gz"
  "${_readmes[@]}" "${_licenses[@]}"
)

_skip=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

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
    LICENSE-{APACHE,MIT}

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && {
      test -d "$pkgname" || continue
      ln -sf "$pkgname" "$_pkgname"
    }
  done
}

sha256sums_aarch64=(
  '7815dfca55d253f7a12a15d8b4fba3eaf40835b62de5550075be37f66a623b09'
  "${_skip[@]}"
)
sha256sums_x86_64=(
  '3be04caab9d70b7047df1d5d76478cbea9d3192b284d73abe04ca850bfe9e34f'
  "${_skip[@]}"
)

# eof
