# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

_pkgname=solana
pkgbase="$_pkgname-bin"
pkgname=(solana-bin solana-dev-bin)
pkgver=3.1.11
pkgrel=1
pkgdesc='A fast, secure, and censorship resistant blockchain.'
arch=(x86_64)
url='https://solana.com'
license=(Apache-2.0)
options=(!strip)
makedepends=(bash glibc libgcc systemd-libs)
source=(
  "$_pkgname-$pkgver.tar.bz2::https://github.com/anza-xyz/agave/releases/download/v$pkgver/solana-release-$CARCH-unknown-linux-gnu.tar.bz2"
  "$_pkgname.sysusers"
  "$_pkgname.tmpfiles"
  "$pkgbase.install"
)
sha256sums=('5978d621fe2582fc2403fa13f3c06502020bcb42e806ddd4612150049d1a3fbb'
            'bf7e015436e3d15e70fc67f323bbd04163f79a4de7d06a254a5409bd031227b0'
            'a0f9ee2a24ab97da977eed1dd68a92165c2f2e6d5467462fe83c762031f4e02b'
            '2ebe9f425bb1833089de42bae0cafe8da6394eb964e3442370bcff1a9c5045a8')

# CLI tools for interacting with the Solana network.
package_solana-bin() {
  pkgdesc='Solana CLI tools for wallets, staking, and token management'
  depends=(glibc libgcc systemd-libs)
  provides=("$_pkgname=$pkgver" spl-token)
  conflicts=("$_pkgname")
  install="$pkgbase.install"

  cd "$srcdir/solana-release"

  local _cli_bins=(
    solana
    solana-keygen
    solana-stake-accounts
    solana-tokens
    spl-token
  )

  for bin in "${_cli_bins[@]}"; do
    install -Dm755 "bin/$bin" -t "$pkgdir/usr/bin"
  done

  install -Dm644 "$srcdir/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgbase.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgbase.conf"
}

# Developer tools for building and testing Solana programs.
package_solana-dev-bin() {
  pkgdesc='Solana developer tools: SBF compiler toolchain, test validator, and ledger tool'
  depends=(bash glibc libgcc libstdc++)
  optdepends=(
    'cargo: required for cargo-build-sbf and cargo-test-sbf'
    "solana-bin=$pkgver: CLI tools for interacting with clusters"
  )

  cd "$srcdir/solana-release"

  local _dev_bins=(
    cargo-build-sbf
    cargo-test-sbf
    solana-test-validator
    agave-ledger-tool
  )

  for bin in "${_dev_bins[@]}"; do
    install -Dm755 "bin/$bin" -t "$pkgdir/usr/bin"
  done

  install -dm755 "$pkgdir/usr/lib/$_pkgname/platform-tools-sdk"
  cp -a bin/platform-tools-sdk/sbf "$pkgdir/usr/lib/$_pkgname/platform-tools-sdk"
}
