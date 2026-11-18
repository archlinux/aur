# Maintainer: Antarien <dev@antarien.com>
pkgname=ase-viewer
# 00.00.42 ist der Stand der VERSION-SSOT (ASE_CLIENT_VIEWER) am 2026-11-18 und traegt die
# nachgeholte SHA-Auslieferung (siehe die Kopien am Ende von source=).
pkgver=00.00.42
# pkgrel 1: der Quellstand selbst ist neu. Die Quellen werden am HEAD geholt, ein Bau bindet
# also die heutigen Nummern der Systembibliotheken.
pkgrel=1
pkgdesc='ASE TECH & DESIGN Documentation Viewer — Native GTK4 Markdown renderer'
arch=('x86_64')
url='https://github.com/antarien/ase-client-viewer'
license=('custom')
depends=(
    'gtkmm-4.0'
    'libadwaita'
    # EIN PAKETNAME SCHUETZT NICHT GEGEN EINEN SONAME-SPRUNG — UND DIE .so-FORM TUT ES HIER
    # EBENSO WENIG, WEIL DER LIEFERANT SEINE SONAMES NICHT ERKLAERT.
    #
    # 'graphviz' deckt die Kopfdateien zur Bauzeit, und es blieb installiert, als graphviz auf
    # 16.0.0 ging — gewandert ist allein die Bibliotheksnummer. Gemessen 2026-10-05: das
    # installierte Binaer verlangt libcgraph.so.8, das neu gebaute libcgraph.so.10, auf der
    # Platte liegt .so.10 (graphviz 16.0.0-1, 14. Aug). ldd meldete die eine unaufgeloeste
    # Abhaengigkeit, pacman meldete nichts — und der Betrachter startete monatelang nicht, ohne
    # dass es auffiel: der Explorer loest .md korrekt auf diese .desktop auf und sieht nur einen
    # angelegten Prozess.
    #
    # HIER STANDEN DESHALB 'libgvc.so' UND 'libcgraph.so', UND GENAU DAS MACHTE DAS PAKET
    # UNINSTALLIERBAR. makepkg loest die Form zur Bauzeit richtig auf die gebundene Nummer auf
    # (libgvc.so=7-64, libcgraph.so=10-64) — nur erfuellt sie niemand: libalpm bedient eine
    # Soname-Abhaengigkeit allein aus dem provides-Feld eines Paketes, und graphviz fuehrt dort
    # nichts ('Provides: None', in der installierten UND in der Repo-Datenbank). Gemessen ohne
    # yay, am Resolver selbst: `pacman -T libcgraph.so=10-64 libgvc.so=7-64` nennt beide und
    # endet mit rc=127, derselbe Aufruf auf 'graphviz' endet mit rc=0.
    #
    # EIN NICHT ERFUELLBARER SCHUTZ IST SCHLIMMER ALS DER STILLE BRUCH, DEN ER FANGEN SOLLTE:
    # der Sprung liess den Betrachter nicht starten, diese Zeile liess ihn nicht einmal
    # installieren, und die Meldung traf nicht den Sprung, sondern das eigene Paket. Was den
    # Sprung real faengt, steht nicht im PKGBUILD: ein AUR-Paket wird bei jeder Installation neu
    # uebersetzt und bindet dabei die heutige Nummer. Dass vier Monate niemand uebersetzte, ist
    # der Befund — nicht die fehlende Deklaration bei graphviz.
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
    # DIE LISTE IST DER TRANSITIVE ABSCHLUSS, NICHT DIE BINDELISTE DES ZIELS.
    #
    # ase-containers zieht die CMakeLists des Betrachters selbst (:197, hinter
    # `if(NOT TARGET ase::containers)`) und fehlte hier. Dieselbe Luecke stand am
    # ase-explorer und brach dort den Bau in der Konfigurationsphase; hier stand sie nur
    # noch nicht auf einer Wand. Wer die Liste aus `target_link_libraries` ableitet,
    # bekommt sie beide: gebunden wird gegen ZIELE, geholt werden VERZEICHNISSE.
    #
    # ase-containers war bis 2026-09-16 privat und liess den Fremdbau am Holen scheitern.
    # Es ist jetzt oeffentlich — anonym ueber https geprueft. Der Abschluss bestimmt die
    # Sichtbarkeit, nicht umgekehrt: eine Quellenliste, die auf das vorhandene Oeffentliche
    # zurechtgeschnitten wird, ergibt ein Paket, das nur auf der Maschine des Autors laeuft.
    "ase-containers::git+https://github.com/antarien/ase-containers.git"
    # SHA-AUSLIEFERUNG: die drei Header sind Kopien aus sha-web-console/generated, icon-replacer.ts
    # die aus ase-client-web/src/utils (beide Stand origin/main). SHA ist die SSOT, jedes Projekt
    # traegt seine Kopie selbst — sie werden mit jeder SHA-Aenderung hier neu eingesetzt, Name
    # UND Inhalt, danach updpkgsums. Bis 2026-11-18 lagen hier die Kopien vom April.
    "colors.hpp"
    "design_tokens.hpp"
    "ui_icons.hpp"
    "icon-replacer.ts"
)
sha256sums=('SKIP'
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
            '42c7784710b279a40d676c9004191225864d8aa8a90f8181cb7bb26bb04cd723'
            '7abb163dbcbe301c7a5ab4040ef67432166ed893e7a04815c85e0a9c02adbff1'
            'bcbbfe2526a753445e42f40a72bffd3075a538999a8efe17295f7dc2ffd3584e'
            'edcd0930037987e9e69f87530d79bc963aef7085e9b088ca4f457802c3fc7a5d')

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
    mv ase-containers       ase-root/foundation/
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
