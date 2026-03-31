# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

_pkgname=solana
pkgname="$_pkgname-bin"
pkgver=3.0.14
pkgrel=1
pkgdesc='A fast, secure, and censorship resistant blockchain.'
arch=(x86_64)
url='https://www.solana.com'
license=(Apache-2.0)
depends=(bash bzip2 cargo gcc-libs glibc systemd-libs)
provides=("$_pkgname" spl-token)
conflicts=("$_pkgname")
options=(!strip)
install="$pkgname.install"
source=(
  "$_pkgname-$pkgver.tar.bz2::https://github.com/anza-xyz/agave/releases/download/v$pkgver/solana-release-x86_64-unknown-linux-gnu.tar.bz2"
  "$_pkgname.sysusers"
  "$_pkgname.tmpfiles"
  "$pkgname.install"
)
sha256sums=('65614325423316a48f57f1ceeaa91ca78f4516e165e305b38c01873cf8c6b8b4'
            'bf7e015436e3d15e70fc67f323bbd04163f79a4de7d06a254a5409bd031227b0'
            'a0f9ee2a24ab97da977eed1dd68a92165c2f2e6d5467462fe83c762031f4e02b'
            '2ebe9f425bb1833089de42bae0cafe8da6394eb964e3442370bcff1a9c5045a8')

# The validator binaries are unavailable since 3.0.0, see solana-bin.install.
_BINS=(
  agave-install
  agave-install-init
  cargo-build-sbf
  cargo-test-sbf
  solana
  solana-keygen
  solana-stake-accounts
  solana-test-validator
  solana-tokens
  # SPL Token bin
  spl-token
  # DCOU bins
  agave-ledger-tool
)

package() {
  cd "$srcdir/solana-release"
  for bin in "${_BINS[@]}"; do
    install -Dm755 "bin/$bin" -t "$pkgdir/usr/bin"
  done

  install -dm755 "$pkgdir/usr/lib/$_pkgname/platform-tools-sdk"
  cp -a bin/platform-tools-sdk/sbf "$pkgdir/usr/lib/$_pkgname/platform-tools-sdk"

  install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
