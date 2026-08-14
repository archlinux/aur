# Maintainer: czyt <czytcn@gmail.com>
pkgname=docker-sbx-bin
pkgver=0.38.0
pkgrel=1
pkgdesc="Run AI coding agents in isolated Docker microVM sandboxes"
arch=('x86_64' 'aarch64')
url="https://www.docker.com/products/docker-sandboxes/"
license=(
    'LicenseRef-Docker-Proprietary'
    'GPL-2.0-only'
    'GPL-2.0-or-later'
    'Apache-2.0'
    'MIT'
)
options=('!debug')
depends=(
    'dbus'
    'e2fsprogs'
    'glibc'
    'libgcc'
    'lz4'
    'xxhash'
    'zlib'
    'zstd'
)
optdepends=(
    'apparmor: nerdbox shim confinement and unprivileged user namespaces'
    'gnome-keyring: Secret Service credential storage'
    'keepassxc: Secret Service credential storage'
    'kwallet: Secret Service credential storage'
)
provides=('docker-sbx' 'sbx')
conflicts=('docker-sbx' 'sbx')
_releases_url="https://github.com/docker/sbx-releases"
source_x86_64=("${pkgname}-${pkgver}-amd64.tar.gz::${_releases_url}/releases/download/v${pkgver}/DockerSandboxes-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::${_releases_url}/releases/download/v${pkgver}/DockerSandboxes-linux-arm64.tar.gz")
sha256sums_x86_64=('9ebcea831d4d270e25ae1777bf15e24756abfbf8791ad27294754682838ed00b')
sha256sums_aarch64=('051fdf8349f8a66db47a990e11a30cd1d2e013ac6c8e42e48c072bfcec06a1d5')

package() {
    local _src="${srcdir}/docker-sbx"
    local _libexec="${pkgdir}/usr/libexec"

    install -Dm755 "${_src}/sbx" "${pkgdir}/usr/bin/sbx"
    install -Dm755 "${_src}/containerd-shim-nerdbox-v1" \
        "${_libexec}/containerd-shim-nerdbox-v1"
    install -Dm755 "${_src}/mkfs.erofs" "${_libexec}/mkfs.erofs"
    install -Dm755 "${_src}/libsailor.so" "${_libexec}/lib/libsailor.so"

    if [[ -f "${_src}/containerd-shim-nerdbox-gpu-v1" ]]; then
        install -Dm755 "${_src}/containerd-shim-nerdbox-gpu-v1" \
            "${_libexec}/containerd-shim-nerdbox-gpu-v1"
    fi

    local _file
    for _file in "${_src}"/nerdbox-kernel-* "${_src}"/nerdbox-rootfs-*.erofs; do
        [[ -f "${_file}" ]] && install -Dm644 "${_file}" "${_libexec}/$(basename "${_file}")"
    done

    install -Dm644 "${_src}/apparmor-profile" \
        "${pkgdir}/etc/apparmor.d/docker-sbx-nerdbox-shim"
    install -Dm644 "${_src}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${_src}/THIRD-PARTY-NOTICES" \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES"
}
