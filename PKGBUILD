# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

_pkgname=solana
pkgname="$_pkgname-bin"
pkgver=2.3.11
pkgrel=1
pkgdesc='A fast, secure, and censorship resistant blockchain.'
arch=(x86_64)
url='https://www.solana.com'
license=(Apache-2.0)
depends=(bash bzip2 cargo gcc-libs glibc systemd-libs)
provides=("$_pkgname" spl-token)
conflicts=("$_pkgname")
options=(!strip)
source=(
  "$_pkgname-$pkgver.tar.bz2::https://github.com/anza-xyz/agave/releases/download/v$pkgver/solana-release-x86_64-unknown-linux-gnu.tar.bz2"
  "$_pkgname.sysusers"
  "$_pkgname.tmpfiles"
)
sha256sums=('3127d066a6b9e3e5e5558a2d34112434a60d0410800d94e6bb12714315dc5f26'
            'bf7e015436e3d15e70fc67f323bbd04163f79a4de7d06a254a5409bd031227b0'
            'a0f9ee2a24ab97da977eed1dd68a92165c2f2e6d5467462fe83c762031f4e02b')

_BINS=(
  agave-install
  agave-install-init
  agave-validator
  agave-watchtower
  cargo-build-sbf
  cargo-test-sbf
  rbpf-cli
  solana
  solana-faucet
  solana-genesis
  solana-gossip
  solana-keygen
  solana-log-analyzer
  solana-net-shaper
  solana-stake-accounts
  solana-test-validator
  solana-tokens
  # SPL Token bin
  spl-token
  # DCOU bins
  agave-ledger-tool
  solana-bench-tps
  solana-dos
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
