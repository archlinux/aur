# Maintainer: Antarien <dev@antarien.com>
pkgname=ase-explorer
# epoch, weil die veroeffentlichte 00.00.35 nie aus der SSOT stammte: die Wurzel-VERSION zaehlt
# Commits OHNE die reinen VERSION-Schriebe (update_version_from_git.sh:173,
# `rev-list --count HEAD -- . ':(exclude)VERSION'`) und steht deshalb heute bei 00.00.29. Ohne
# epoch waere jede Angleichung an die SSOT ein Downgrade und pacman bote sie nie an
# (`vercmp 00.00.29-1 00.00.35-1` = -1). Mit epoch gilt wieder die SSOT allein
# (`vercmp 1:00.00.29-1 00.00.35-1` = 1) — ab hier laufen Paket und Katalog gleich.
epoch=1
pkgver=00.00.29
pkgrel=2
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
    # DIE LISTE IST DER TRANSITIVE ABSCHLUSS, NICHT DIE BINDELISTE DES ZIELS.
    #
    # ase-containers und ase-math zieht die CMakeLists des Explorers selbst (:62, :67),
    # ase-types der Adapter ase-adp-libgit2 (:130) hinter `if(NOT TARGET ase::types)`. Alle drei
    # fehlten hier, und der Bau brach in der Konfigurationsphase ab: `add_subdirectory given
    # source … which is not an existing directory`.
    #
    # Wer die Liste aus `target_link_libraries` ableitet, bekommt genau diese Luecke: gebunden
    # wird gegen ZIELE, geholt werden VERZEICHNISSE. Auf einer Entwicklermaschine faellt das nie
    # auf, weil das Monorepo vollstaendig daliegt — der Fremdbau ist die erste Messung.
    #
    # NICHT gebraucht wird core/ase-log, obwohl beide Adapter es nennen: der Zug steht hinter
    # `if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)` und gilt ihrem eigenen
    # Beispiel-Executable. Im Bau des Explorers ist der Explorer die Wurzel, also schweigt er.
    #
    # DER ABSCHLUSS BESTIMMT DIE SICHTBARKEIT, NICHT UMGEKEHRT.
    #
    # Die drei waren bis 2026-09-16 privat und der Fremdbau scheiterte am Holen
    # (`could not read Username`). Sie sind jetzt oeffentlich — anonym ueber https geprueft,
    # zusammen mit ase-utils als Positivkontrolle. Wer hier stattdessen den Abschluss
    # zurechtschneidet, bis er in die vorhandene Sichtbarkeit passt, baut ein Paket, das nur
    # auf der Maschine des Autors funktioniert.
    #
    # WANN ES BRACH: der Explorer zieht ase-containers und ase-math seit 2026-06-08,
    # ase-adp-libgit2 sein ase-types seit 2026-09-08. Das zuletzt veroeffentlichte 00.00.35
    # stammt vom 2026-05-13 — seither hat niemand neu uebersetzt, und deshalb hat niemand
    # gemerkt, dass der Abschluss ueber den oeffentlichen Rand gewachsen war.
    "ase-containers::git+https://github.com/antarien/ase-containers.git"
    "ase-math::git+https://github.com/antarien/ase-math.git"
    "ase-types::git+https://github.com/antarien/ase-types.git"
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
    mv ase-containers       ase-root/foundation/
    mv ase-math             ase-root/foundation/
    mv ase-types            ase-root/foundation/
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
