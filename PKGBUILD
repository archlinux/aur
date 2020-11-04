# Maintainer: David Anderson <dave@natulte.net>

pkgname="tailscale"
_version="1.2.1"
pkgver="1.2.1"
pkgrel="1"
pkgdesc="A mesh VPN that makes it easy to connect your devices, wherever they are."
arch=("x86_64")
url="https://tailscale.com"
license=("MIT")
makedepends=("go")
depends=("glibc")
backup=("etc/default/tailscaled")
source=("$pkgname::git+http://github.com/tailscale/tailscale.git#tag=v$pkgver")
sha256sums=('SKIP')
install="tailscale.install"

package() {
    cd tailscale
    eval $(./version/version.sh)
    go build -tags xversion -ldflags "-X tailscale.com/version.Long=${VERSION_LONG} -X tailscale.com/version.Short=${VERSION_SHORT} -X tailscale.com/version.GitCommit=${VERSION_GIT_HASH}" ./cmd/tailscale
    go build -tags xversion -ldflags "-X tailscale.com/version.Long=${VERSION_LONG} -X tailscale.com/version.Short=${VERSION_SHORT} -X tailscale.com/version.GitCommit=${VERSION_GIT_HASH}" ./cmd/tailscaled
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/etc/default" "$pkgdir/usr/lib/systemd/system"
    install -m755 tailscale tailscaled "$pkgdir/usr/bin"
    install -m644 cmd/tailscaled/tailscaled.defaults "$pkgdir/etc/default/tailscaled"
    install -m644 cmd/tailscaled/tailscaled.service "$pkgdir/usr/lib/systemd/system"
}
