# Maintainer: Michael E. Gruen <contact@michaelgruen.com>
pkgname=tailport-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="TUI to expose local ports across your tailnet via tailscale serve (prebuilt binary)"
arch=('x86_64' 'aarch64')
url='https://github.com/gruen/tailport'
license=('MIT')
depends=('tailscale' 'iproute2')
provides=('tailport')
conflicts=('tailport')
# The release binaries are prebuilt and already stripped. Without this, makepkg
# strips them again -- mutating the exact artifact the sha256sums below attest
# to -- and emits an empty -debug package built from nonexistent symbols.
options=('!strip' '!debug')

# Arch-independent sources: LICENSE (required per-package) and README, pulled
# from the tag so the -bin package can ship them without the source tarball.
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/gruen/tailport/v$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/gruen/tailport/v$pkgver/README.md")
# Per-arch prebuilt binaries from the GitHub release (built by build.yml).
source_x86_64=("tailport-$pkgver-x86_64::https://github.com/gruen/tailport/releases/download/v$pkgver/tailport-linux-amd64")
source_aarch64=("tailport-$pkgver-aarch64::https://github.com/gruen/tailport/releases/download/v$pkgver/tailport-linux-arm64")

# The per-arch binary digests are published alongside the assets as
# tailport-linux-amd64.sha256 / tailport-linux-arm64.sha256 (see build.yml).
sha256sums=('6ab5a1c9312683bea5942efc33876a1fcef67cfa065029f2939c14392ee9ed7a'
            '8091ade83dc1a69da5278f2beb4de6603cdf222cf861f4a92cf3c9511deb41f5')
sha256sums_x86_64=('29f5a5de2556b7d822dd222543d104c2a870f2305bc6eae710750aae83b79ac9')
sha256sums_aarch64=('69a911de1937e4c9daecae318f2ab75e3b482c075519a3cc26eeb8dbc1a9e9b5')

package() {
  install -Dm755 "$srcdir/tailport-$pkgver-$CARCH" "$pkgdir/usr/bin/tailport"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
