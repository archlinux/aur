# Maintainer: Michael E. Gruen <contact@michaelgruen.com>
pkgname=tailport-bin
pkgver=0.1.6
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
sha256sums=('ae37e72c69c0327283c4aad671b304f6fc3e17b3aaa963cb558dba617ce414e6'
            '0b38f52c9a3400b5f9ecd2a67a2dac383c40531e598ec16f93c11b4298815204')
sha256sums_x86_64=('00e22b42a90aa47c1988165f636b29cd9437eb8855533757d366d7c811c0b756')
sha256sums_aarch64=('c857b391fd5ce9b4c7e4787b7b7cb4128238080b91d12f8299a921b206a2d291')

package() {
  install -Dm755 "$srcdir/tailport-$pkgver-$CARCH" "$pkgdir/usr/bin/tailport"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
