# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

# AI Disclosure: Gemini was heavily involved 🤷🏻‍♂️

pkgname=gvisor
pkgver=20261116.0
pkgrel=1
pkgdesc='Application kernel and OCI runtime (runsc) for sandboxed containers'
arch=('x86_64' 'aarch64')
url='https://gvisor.dev'
_gh_url='https://github.com/google/gvisor'
license=('Apache-2.0')
optdepends=(
    'docker: Docker runtime integration'
    'containerd: containerd shim integration'
)
makedepends=('bazel')
provides=('runsc')
conflicts=('gvisor-bin' 'gvisor-git')
options=('!lto' '!strip' '!debug')
source=(
    "${pkgname}-${pkgver}.tar.gz::${_gh_url}/archive/refs/tags/release-${pkgver}.tar.gz"
    'crosstool-archlinux.patch'
)
sha256sums=(
    '5f38ec5f75d7034d33988424297a275e6ee6ce32fde440a4ec4bf0ac98e9dd7b'
    'c790418d6e2126f63a41da6e78341649f03c1cde252325ec9ee7d2b46663857e'
)

prepare() {
    cd "${pkgname}-release-${pkgver}"
    patch -Np1 -i "${srcdir}/crosstool-archlinux.patch"
    printf '#!/bin/sh\necho STABLE_VERSION release-%s\n' "${pkgver}" >tools/workspace_status.sh

    bazel-real --output_user_root="${srcdir}/bazel-root" fetch \
        --repository_cache="${srcdir}/bazel-cache" \
        --compilation_mode=opt \
        --copt=-fcanonical-system-headers \
        --host_copt=-fcanonical-system-headers \
        //runsc:runsc \
        //shim:containerd-shim-runsc-v1
    bazel-real --output_user_root="${srcdir}/bazel-root" shutdown
}

build() {
    cd "${pkgname}-release-${pkgver}"
    bazel-real --output_user_root="${srcdir}/bazel-root" build \
        --repository_cache="${srcdir}/bazel-cache" \
        --compilation_mode=opt \
        --copt=-fcanonical-system-headers \
        --host_copt=-fcanonical-system-headers \
        --nofetch \
        --verbose_failures \
        //runsc:runsc \
        //shim:containerd-shim-runsc-v1
    bazel-real --output_user_root="${srcdir}/bazel-root" shutdown
}

package() {
    cd "${pkgname}-release-${pkgver}/bazel-bin"
    install -Dm755 runsc/runsc_/runsc "${pkgdir}/usr/bin/runsc"
    install -Dm755 shim/containerd-shim-runsc-v1_/containerd-shim-runsc-v1 \
        "${pkgdir}/usr/bin/containerd-shim-runsc-v1"
}
