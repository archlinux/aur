# Maintainer: NSky Labs <nskysoft at gmail dot com>

pkgname=nsky-protondrive-client-bin
_pkgname=nsky-protondrive-client
pkgver=0.2.2
pkgrel=1
pkgdesc='Unofficial Proton Drive command-line client with bidirectional folder sync'
arch=('x86_64' 'aarch64')
url='https://github.com/NSky/nsky-protondrive-client'
license=('MIT')
# Self-contained .NET build: no .NET runtime needed. OpenSSL is not linked but loaded at run time (HTTPS),
# so namcap cannot see that it is needed.
depends=('glibc' 'libgcc' 'libstdc++' 'openssl')
optdepends=('systemd: background sync with "protondrive service enable"')
provides=('protondrive')
conflicts=('protondrive' "$_pkgname")
install="$pkgname.install"
# Stripping would corrupt the single-file .NET executable (its payload is appended to the ELF file).
options=('!strip' '!debug')

source_x86_64=("$url/releases/download/v$pkgver/protondrive-$pkgver-linux-x64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/protondrive-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('9e1e5a987e08940908a855424ed67c061ac4dce03bdfa3ed253b485efcbdf8c1')
sha256sums_aarch64=('22cb8feb3f0952cafe1dc7b193fed755dfe25c74d25f607c944683f08166f6f6')

_rid() {
  case "$CARCH" in
    x86_64) echo linux-x64 ;;
    aarch64) echo linux-arm64 ;;
  esac
}

package() {
  cd "protondrive-$pkgver-$(_rid)"

  # The release's own installer lays out the files: /usr/lib/protondrive, /usr/bin/protondrive,
  # /usr/lib/systemd/user/*, /usr/share/doc/protondrive.
  sh ./install.sh --prefix /usr --destdir "$pkgdir" >/dev/null

  # Arch keeps licenses under the package name.
  mv "$pkgdir/usr/share/licenses/protondrive" "$pkgdir/usr/share/licenses/$pkgname"
}
