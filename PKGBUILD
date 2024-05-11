# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>
# Contributor: Simon Walker <s.r.walker101@googlemail.com>

# https://wiki.archlinux.org/title/VCS_package_guidelines
# https://wiki.archlinux.org/title/Go_package_guidelines
# https://developer.hashicorp.com/terraform/cli/config/config-file#implied-local-mirror-directories

pkgname=({terraform,opentofu}-provider-libvirt-git)
_pkgname="${pkgname%-git}"
pkgver=v0.7.6.r8.gd41792a
pkgrel=9
arch=("x86_64")
url="https://github.com/dmacvicar/${_pkgname}"
license=("Apache")
depends=("libvirt" "cdrtools")
makedepends=("git" "go")
checkdepends=("go")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    unset LDFLAGS
    make
}

check() {
    cd "${_pkgname}"
    make test
}

_package_common() {
    cd "${_pkgname}"

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 {CHANGELOG,README,docs/migration-13}.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r website/docs "$pkgdir/usr/share/doc/${pkgname}"
}

package_terraform-provider-libvirt-git() {
    pkgdesc="Provision libvirt machines with terraform"
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")

    _package_common

    _ver=${pkgver#v}; _ver=${_ver%."${pkgver#*.*.*.}"}
    install -Dm755 "${_pkgname}" \
        -t "${pkgdir}/usr/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/${_ver}/linux_amd64"
}

package_opentofu-provider-libvirt-git() {
    pkgdesc="Provision libvirt machines with OpenTofu"
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")

    _package_common

    _ver=${pkgver#v}; _ver=${_ver%."${pkgver#*.*.*.}"}
    install -Dm755 "${_pkgname}" \
        -t "${pkgdir}/usr/share/terraform/plugins/registry.opentofu.org/dmacvicar/libvirt/${_ver}/linux_amd64"
}
