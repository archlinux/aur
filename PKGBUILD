# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=lief-bin
pkgver=1.0.0
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
sha256sums_x86_64=('81b86bcc69d311a01ec1914d26c31ebbb605ac761ec02f10bc5b588de74a8e91'
                   'c9e1dd2facd82276074a9605f83ac9e1dec32cba4e3013b447d0a8223d9a21b9')
sha256sums_aarch64=('42b638989ca35d778640f11deba4560f5e5ad9976fca4012aeeba9b7bacf997d'
                    '0965da90228ec5acb388b6446c941d00c92825b41f99b0d00e39646bf6b5d35e')

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
