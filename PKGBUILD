# Maintainer: NSky Labs <nskysoft at gmail dot com>

pkgname=nsky-protondrive-client-bin
_pkgname=nsky-protondrive-client
pkgver=0.2.4
pkgrel=1
pkgdesc='Unofficial Proton Drive command-line client with bidirectional folder sync'
arch=('x86_64' 'aarch64')
url='https://github.com/NSky/protondrive-client'
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
sha256sums_x86_64=('08b99ee8b2b9518ffcb582463a2e3fa36e089ef5228262bb835f9e34f9ef5037')
sha256sums_aarch64=('865765b282bf1fed7cce808c853c85da6fb91874a99526e56dc699aa89223049')

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
