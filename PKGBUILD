# Maintainer: aarto <aarto@aur.archlinux.org>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

_pkgname=solana
pkgname="$_pkgname-bin"
pkgver=3.1.11
pkgrel=1
pkgdesc='A fast, secure, and censorship resistant blockchain.'
arch=(x86_64)
url='https://solana.com'
license=(Apache-2.0)
depends=(bash libgcc libstdc++ glibc systemd-libs)
optdepends=('cargo: required for cargo-build-sbf and cargo-test-sbf')
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
sha256sums=('5978d621fe2582fc2403fa13f3c06502020bcb42e806ddd4612150049d1a3fbb'
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
