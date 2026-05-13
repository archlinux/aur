# Maintainer: Antarien <dev@antarien.com>
pkgname=ase-viewer
pkgver=00.00.31
pkgrel=1
pkgdesc='ASE TECH & DESIGN Documentation Viewer — Native GTK4 Markdown renderer'
arch=('x86_64')
url='https://github.com/antarien/ase-client-viewer'
license=('custom')
depends=(
    'gtkmm-4.0'
    'libadwaita'
    'graphviz'
    'tinyxml2'
    'cairomm-1.16'
    'pangomm-2.48'
    'fontconfig'
    'ttf-fira-code'
    'ttf-nerd-fonts-symbols-mono'
    'otf-stix'
)
makedepends=('cmake' 'ninja' 'gcc' 'pkgconf' 'git')
optdepends=('fcitx5-gtk: input method support')
source=(
    "ase-client-viewer::git+https://github.com/antarien/ase-client-viewer.git"
    "ase-utils::git+https://github.com/antarien/ase-utils.git"
    "ase-fileio::git+https://github.com/antarien/ase-fileio.git"
    "ase-json::git+https://github.com/antarien/ase-json.git"
    "ase-alloc::git+https://github.com/antarien/ase-alloc.git"
    "ase-markdown::git+https://github.com/antarien/ase-markdown.git"
    "ase-adp-gtk::git+https://github.com/antarien/ase-adp-gtk.git"
    "ase-adp-treesitter::git+https://github.com/antarien/ase-adp-treesitter.git"
    "ase-adp-microtex::git+https://github.com/antarien/ase-adp-microtex.git"
    "ase-imgcache::git+https://github.com/antarien/ase-imgcache.git"
    "colors.hpp"
    "design_tokens.hpp"
    "ui_icons.hpp"
    "icon-replacer.ts"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    '7ed7afc5098eeba491ec899dc4c0a2157d2786cd3665981f4b9bbc00a8e56906'
    '586535811845c7b7d1bb035ae52253205c7250b8071d36b40e7685bc0a2b3b39'
    '1f0814d89ae60ca293c3f4d14503f3720192ac6b0719ede455089d8b1f8704dd'
    '5023e0f8bfe19dd24eb58da1101fc8e1d7059e4d34ac2354a044f33308e015c6'
)

prepare() {
    # Reconstruct monorepo layout expected by CMakeLists.txt
    # (../../foundation, ../../core, ../../adapter, ../../shared, ../sha-client-web)
    cd "${srcdir}"
    mkdir -p ase-root/foundation ase-root/adapter ase-root/core ase-root/shared \
             ase-root/clients ase-root/clients/sha-client-web/sha-web-console/generated
    mv ase-utils            ase-root/foundation/
    mv ase-fileio           ase-root/foundation/
    mv ase-json             ase-root/foundation/
    mv ase-alloc            ase-root/foundation/
    mv ase-markdown         ase-root/core/
    mv ase-adp-gtk          ase-root/adapter/
    mv ase-adp-treesitter   ase-root/adapter/
    mv ase-adp-microtex     ase-root/adapter/
    mv ase-imgcache         ase-root/shared/
    mv ase-client-viewer    ase-root/clients/
    install -m644 -t ase-root/clients/sha-client-web/sha-web-console/generated/ \
        "${srcdir}/colors.hpp" \
        "${srcdir}/design_tokens.hpp" \
        "${srcdir}/ui_icons.hpp"
    # Vendored icon-replacer.ts (NerdFont SSOT used by viewer codegen step)
    install -Dm644 "${srcdir}/icon-replacer.ts" \
        ase-root/clients/ase-client-web/src/utils/icon-replacer.ts
}

build() {
    cd "${srcdir}/ase-root/clients/ase-client-viewer"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.10 \
        -DASE_WEB_PUBLIC_ROOT=/usr/share/ase-viewer/public \
        -DASE_MICROTEX_RES_PATH=/usr/share/microtex/res
    cmake --build build --parallel
}

package() {
    cd "${srcdir}/ase-root/clients/ase-client-viewer"
    DESTDIR="${pkgdir}" cmake --install build

    # Strip dev artifacts of transitively-built dependencies — the end-user
    # only needs the ase-viewer binary + assets. Headers, static libs, cmake
    # configs and pkgconfig files would otherwise conflict with ase-explorer
    # (same shared deps) and the system muparser package.
    rm -rf "${pkgdir}/usr/include"
    rm -rf "${pkgdir}/usr/lib/cmake"
    rm -rf "${pkgdir}/usr/lib/cmake-gfm-extensions"
    rm -rf "${pkgdir}/usr/lib/pkgconfig"
    rm -rf "${pkgdir}/usr/share/man"
    rm -f "${pkgdir}/usr/lib"/*.a
    rm -f "${pkgdir}/usr/bin/cmark-gfm"

    install -Dm644 packaging/ase-viewer.desktop \
        "${pkgdir}/usr/share/applications/ase-viewer.desktop"

    # Brand icons (committed in tool repo's packaging/icons/, sourced from
    # sha-web-resources/generated/ase/ via build.sh on dev machines)
    for size in 16 32 48 192 512; do
        install -Dm644 "packaging/icons/icon-${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/ase-viewer.png"
    done
}
