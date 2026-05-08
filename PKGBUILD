# Maintainer: Antarien <dev@antarien.com>
pkgname=ase-explorer
pkgver=0.0.1
pkgrel=5
pkgdesc='ASE Hierarchical Project Explorer with NerdFont Icons'
arch=('x86_64')
url='https://github.com/antarien/ase-client-explorer'
license=('custom')
depends=('gtkmm-4.0' 'libadwaita' 'ttf-fira-code' 'ttf-nerd-fonts-symbols-mono' 'nlohmann-json' 'libgit2')
makedepends=('cmake' 'ninja' 'gcc' 'pkgconf' 'git')
source=(
    "ase-client-explorer::git+https://github.com/antarien/ase-client-explorer.git"
    "ase-utils::git+https://github.com/antarien/ase-utils.git"
    "ase-fileio::git+https://github.com/antarien/ase-fileio.git"
    "ase-json::git+https://github.com/antarien/ase-json.git"
    "ase-adp-gtk::git+https://github.com/antarien/ase-adp-gtk.git"
    "ase-adp-libgit2::git+https://github.com/antarien/ase-adp-libgit2.git"
    "ase-adp-libcuckoo::git+https://github.com/antarien/ase-adp-libcuckoo.git"
    "file-icons.hpp"
    "colors.hpp"
    "design_tokens.hpp"
    "ui_icons.hpp"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    '4f9e4b4b6092619b9f157c80733aee73fc274f337edc0bc07aaaf28bd745d9c9'
    '7ed7afc5098eeba491ec899dc4c0a2157d2786cd3665981f4b9bbc00a8e56906'
    '586535811845c7b7d1bb035ae52253205c7250b8071d36b40e7685bc0a2b3b39'
    '1f0814d89ae60ca293c3f4d14503f3720192ac6b0719ede455089d8b1f8704dd'
)

prepare() {
    # Reconstruct monorepo layout expected by CMakeLists.txt
    # (../../foundation, ../../adapter, ../sha-client-web)
    cd "${srcdir}"
    mkdir -p ase-root/foundation ase-root/adapter ase-root/clients \
             ase-root/clients/sha-client-web/sha-web-console/generated
    mv ase-utils            ase-root/foundation/
    mv ase-fileio           ase-root/foundation/
    mv ase-json             ase-root/foundation/
    mv ase-adp-gtk          ase-root/adapter/
    mv ase-adp-libgit2      ase-root/adapter/
    mv ase-adp-libcuckoo    ase-root/adapter/
    mv ase-client-explorer  ase-root/clients/
    install -m644 -t ase-root/clients/sha-client-web/sha-web-console/generated/ \
        "${srcdir}/file-icons.hpp" \
        "${srcdir}/colors.hpp" \
        "${srcdir}/design_tokens.hpp" \
        "${srcdir}/ui_icons.hpp"
}

build() {
    cd "${srcdir}/ase-root/clients/ase-client-explorer"
    cmake -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    ninja -C build
}

package() {
    cd "${srcdir}/ase-root/clients/ase-client-explorer"
    DESTDIR="${pkgdir}" ninja -C build install
    install -Dm644 packaging/ase-explorer.desktop \
        "${pkgdir}/usr/share/applications/ase-explorer.desktop"

    # Brand icons (committed in tool repo's packaging/icons/, sourced from
    # sha-web-resources/generated/ase/ via build.sh on dev machines)
    for size in 16 32 48 192 512; do
        install -Dm644 "packaging/icons/icon-${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/ase-explorer.png"
    done
}
