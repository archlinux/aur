# Maintainer: Michael E. Gruen <contact@michaelgruen.com>
pkgname=tailport-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="TUI to share local ports on your tailnet or publicly (Funnel, Caddy, Cloudflare) (prebuilt binary)"
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
            'e21477ece686c7478055f24666582649c76ca1e3ea1687221371c74fd3dea252')
sha256sums_x86_64=('56ade477ba15f8bd436c20e87802452b22b5481a7496dfa9f6f92d6db918bf61')
sha256sums_aarch64=('08e8e973810b3e4b131b32af5fd5cd9f96671a645cdea1e7dde7159e2089ba20')

package() {
  install -Dm755 "$srcdir/tailport-$pkgver-$CARCH" "$pkgdir/usr/bin/tailport"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
