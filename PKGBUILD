# Maintainer: czyt <czytcn@gmail.com>
pkgname=docker-sbx-bin
pkgver=0.53.0
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
sha256sums_x86_64=('a8e171ed331e2485ff8d46978d7bf9e74929769acacb6759c15a0a665a3b7bb2')
sha256sums_aarch64=('615a8045fe4d9860d5d1bb30df0189e33b5e3deb22aef820b2947d4b0697438b')

package() {
    local _src="${srcdir}/docker-sbx"
    local _libexec="${pkgdir}/usr/libexec"

    # sbx locates every helper through "<its own dir>/../libexec", and upstream
    # keeps adding to that set (0.51 added docker-docklet and the sailor
    # rootfs, 0.50 added mkfs.ext4). Ship the whole payload instead of a
    # hand-kept list: a helper left out does not fail the build, it fails as a
    # sandbox that refuses to boot.
    install -d "${_libexec}"
    cp -a "${_src}/." "${_libexec}/"
    rm -f "${_libexec}/install.sh"

    local _file _pattern
    for _file in docker-docklet containerd-shim-nerdbox-v1 \
                 mkfs.erofs mkfs.ext4 libsailor.so; do
        [[ -f "${_libexec}/${_file}" ]] || {
            echo "upstream no longer ships ${_file}; update the PKGBUILD" >&2
            return 1
        }
    done
    for _pattern in 'nerdbox-kernel-*' 'nerdbox-rootfs-*.erofs' 'sailor-rootfs-*.erofs'; do
        compgen -G "${_libexec}/${_pattern}" >/dev/null || {
            echo "upstream no longer ships ${_pattern}; update the PKGBUILD" >&2
            return 1
        }
    done

    install -Dm755 "${_libexec}/sbx" "${pkgdir}/usr/bin/sbx"
    rm -f "${_libexec}/sbx"

    install -Dm755 "${_libexec}/libsailor.so" "${_libexec}/lib/libsailor.so"
    rm -f "${_libexec}/libsailor.so"

    install -Dm644 "${_libexec}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${_libexec}/THIRD-PARTY-NOTICES" \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES"
    install -Dm644 "${_libexec}/apparmor-profile" \
        "${pkgdir}/etc/apparmor.d/docker-sbx-nerdbox-shim"
    rm -f "${_libexec}/LICENSE" "${_libexec}/THIRD-PARTY-NOTICES" \
        "${_libexec}/apparmor-profile"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
