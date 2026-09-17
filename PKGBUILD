# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=fluxzy-bin
_pkgname=fluxzy
pkgver=1.39.48.18975
pkgrel=1
pkgdesc="Fully streamed MITM proxy to intercept, record and alter HTTP/1.1, H2, WebSocket and gRPC traffic (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/haga-rak/fluxzy.core"
license=('GPL-3.0-only')
# Self-contained .NET 10 publish: the runtime is bundled, but it still dlopens
# ICU (the process aborts at startup without it), OpenSSL and libstdc++.
depends=('gcc-libs' 'glibc' 'icu' 'openssl')
optdepends=('libpcap: raw packet capture (-c/--include-dump, pcapng export)'
            'polkit: pkexec prompt used to elevate the fluxzynetcap capture helper'
            'libcap: getpcaps, used to detect already-granted capture capabilities')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug' '!strip')
source=("LICENSE-$pkgver.md::https://raw.githubusercontent.com/haga-rak/fluxzy.core/v$pkgver/src/Fluxzy/LICENSE.md")
# Release tarballs are flat (no top-level directory), so they are kept out of
# $srcdir and unpacked into their own subdirectory in prepare().
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/fluxzy-cli-$pkgver-linux-x64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/fluxzy-cli-$pkgver-linux-arm64.tar.gz")
noextract=("$pkgname-$pkgver-$CARCH.tar.gz")
sha256sums=('7c1472911e95d77d49e02160933d8222fa187cac3599476f1c7d11983585445d')
sha256sums_x86_64=('b045e53c9b5bb7f9de816dc23c6c71f3da07f09b777a08a163a082273caf0fa3')
sha256sums_aarch64=('4c812ca92f3de98a3468a3261e7e03e12c0071bf9c574a0210dfdd5ea35ae150')

prepare() {
  rm -rf "$_pkgname"
  mkdir -p "$_pkgname"
  bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C "$_pkgname"
}

package() {
  local libdir="$pkgdir/usr/lib/$_pkgname"

  # Upstream ships nearly everything as 0744; normalise to 0644 and re-mark
  # the real executables. fluxzy resolves fluxzynetcap (the privileged capture
  # helper) from the location of its own DLL, so the helper must stay here.
  install -dm755 "$libdir"
  install -m644 "$_pkgname"/* "$libdir/"
  chmod 755 "$libdir"/{fluxzy,fluxzynetcap,createdump}

  install -dm755 "$pkgdir/usr/bin"
  ln -s "../lib/$_pkgname/fluxzy" "$pkgdir/usr/bin/fluxzy"

  install -Dm644 "LICENSE-$pkgver.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
