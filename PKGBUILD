# Maintainer: Timothy Gu <timothygu99@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: David Anderson <dave@natulte.net>

pkgname=tailscale-git
_pkgname=tailscale
pkgver=1.35.108+t692eac23a
pkgrel=1
pkgdesc="A mesh VPN that makes it easy to connect your devices, wherever they are."
arch=("x86_64")
url="https://tailscale.com"
license=("MIT")
makedepends=("git" "go>=1.16")
depends=("glibc")
optdepends=('networkmanager: DNS resolver integration'
            'openresolv: DNS resolver integration'
            'systemd: DNS resolver integration with systemd-resolved')
provides=($_pkgname)
conflicts=($_pkgname)
backup=("etc/default/tailscaled")
source=("git+https://github.com/tailscale/$_pkgname.git")
sha256sums=('SKIP')
install="tailscale.install"

pkgver() {
  cd "${_pkgname}"
  eval "$(./build_dist.sh shellvars)"
  echo "$VERSION_LONG" | sed 's/-/+/g'
}

prepare() {
    cd "${_pkgname}"
    go mod vendor
    # go mod vendor can contribute some changes to go.mod or go.sum.
    # Revert them so that the version stamp in "tailscale version" doesn't have
    # "-dirty" suffix.
    git restore go.mod go.sum
}

build() {
    cd "${_pkgname}"

    # https://wiki.archlinux.org/title/Go_package_guidelines#Flags_and_build_options
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    # The version stamp flags mirror build_dist.sh. However, we have to
    # duplicate that logic since we also want to set -linkmode=external, and Go
    # has no way of merging ldflags specified through GOFLAGS with those in the
    # command line: https://github.com/golang/go/issues/26849
    eval "$(./build_dist.sh shellvars)"
    GO_LDFLAGS="\
        -linkmode=external \
        -X tailscale.com/version.Long=${VERSION_LONG} \
        -X tailscale.com/version.Short=${VERSION_SHORT} \
        -X tailscale.com/version.GitCommit=${VERSION_GIT_HASH}"

    for cmd in ./cmd/tailscale ./cmd/tailscaled; do
        ./build_dist.sh -ldflags "$GO_LDFLAGS" $cmd
    done
}

#TODO: Figure out why tests are failing
# check() {
#     cd "${_pkgname}"
#     go test $(go list ./... | grep -v tsdns_test)
# }

package() {
    cd "${_pkgname}"
    install -Dm755 tailscale tailscaled -t "$pkgdir/usr/bin"
    install -Dm644 cmd/tailscaled/tailscaled.defaults "$pkgdir/etc/default/tailscaled"
    install -Dm644 cmd/tailscaled/tailscaled.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
