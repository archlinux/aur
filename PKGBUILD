# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=lief-bin
pkgver=0.17.6
pkgrel=1
pkgdesc='Library to instrument executable formats (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/lief-project/LIEF'
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++.so')
optdepends=(
    'python: Python bindings available via pip install lief'
    'zsh: completion for lief-patchelf'
)
makedepends=('patchelf')
provides=('lief' 'libLIEF.so')
conflicts=('lief')
options=('!debug')

_gh="https://github.com/lief-project/LIEF/releases/download/${pkgver}"
source_x86_64=(
    "LIEF-${pkgver}-Linux-x86_64.tar.gz::${_gh}/LIEF-${pkgver}-Linux-x86_64.tar.gz"
    "lief-tools-${pkgver}-x86_64.zip::${_gh}/lief-tools-x86_64-unknown-linux-gnu.zip"
)
source_aarch64=(
    "LIEF-${pkgver}-Linux-aarch64.tar.gz::${_gh}/LIEF-${pkgver}-Linux-aarch64.tar.gz"
    "lief-tools-${pkgver}-aarch64.zip::${_gh}/lief-tools-aarch64-unknown-linux-gnu.zip"
)
sha256sums_x86_64=('a29d91ab9b79506896ddd8ef23425b33d0f454a5e352bf86f328b79c9b3db4d8'
                   '45d14310662b2a06c73410403c2350ec9fef39ad87f0e5f652015b3a3d76d4eb')
sha256sums_aarch64=('369b251e1bbd2c68777f0c3c1c1d6ec52faf6cee747c2aaec9e96d1cef7ad73c'
                    'acafcf82110847a6f9ce2e0c2f8019f2f9ddec96718506127c516e9771fb8044')

latestver() {
    gh api repos/lief-project/LIEF/releases/latest --jq '.tag_name'
}

package() {
    local _sdk="LIEF-${pkgver}-Linux-${CARCH}"

    # Headers
    install -d "${pkgdir}/usr/include"
    cp -a "${_sdk}/include/LIEF" "${pkgdir}/usr/include/"

    # Shared library
    install -Dm755 "${_sdk}/lib/libLIEF.so" "${pkgdir}/usr/lib/libLIEF.so"

    # CMake config (uses relative _IMPORT_PREFIX, works as-is)
    install -d "${pkgdir}/usr/lib/cmake/LIEF"
    cp -a "${_sdk}/lib/cmake/LIEF/"* "${pkgdir}/usr/lib/cmake/LIEF/"

    # pkgconfig (fix upstream build prefix)
    install -d "${pkgdir}/usr/lib/pkgconfig"
    sed 's|^prefix=.*|prefix="/usr"|' "${_sdk}/lib/pkgconfig/LIEF.pc" \
        > "${pkgdir}/usr/lib/pkgconfig/LIEF.pc"

    # lief-patchelf CLI tool (fix aarch64 interpreter bug)
    install -Dm755 bin/lief-patchelf "${pkgdir}/usr/bin/lief-patchelf"
    if [[ "${CARCH}" == "aarch64" ]]; then
        patchelf --set-interpreter /usr/lib/ld-linux-aarch64.so.1 \
            "${pkgdir}/usr/bin/lief-patchelf"
    fi

    # Man page and zsh completion
    install -Dm644 share/man/man1/lief-patchelf.1 "${pkgdir}/usr/share/man/man1/lief-patchelf.1"
    install -Dm644 share/zsh/site-functions/_lief-patchelf "${pkgdir}/usr/share/zsh/site-functions/_lief-patchelf"
}
