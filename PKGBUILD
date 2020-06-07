# Maintainer: Victor <victor@xirion.net>

pkgname=terraform-provider-proxmox-git
_pkgname=terraform-provider-proxmox
provides=("${_pkgname}")
pkgver=r218.bcb3160
pkgrel=1
pkgdesc="Terraform provider plugin for Proxmox"
url="https://github.com/Telmate/${_pkgname}"
arch=("any")
license=("MIT")
makedepends=("go" "git")
source=("git+${url}.git")
sha256sums=('SKIP')

_provider_bin="terraform-provider-proxmox"
_provisioner_bin="terraform-provisioner-proxmox"

prepare() {
    cd "$_pkgname"
    mkdir -p bin/
}

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o bin/${_provider_bin} cmd/${_provider_bin}/*
    go build -o bin/${_provisioner_bin} cmd/${_provisioner_bin}/*
}

check() {
    cd "$_pkgname"
    go test ./...
}

package() {
    cd "$_pkgname/bin"
    install -Dm755 $_provider_bin "$pkgdir"/usr/bin/${_provider_bin}
    install -Dm755 $_provisioner_bin "$pkgdir"/usr/bin/${_provisioner_bin}
}

