# Maintainer: Aria Vesta <dev@ariavesta.com>
pkgname=botropolis
pkgver=0.1.4
pkgrel=1
pkgdesc="Every Claude Code session on this machine, drawn as a city"
arch=('x86_64' 'aarch64')
url="https://github.com/auroq/botropolis"
license=('MIT')
# Ebitengine dlopens GL and X11 rather than linking them, so the binary's only
# NEEDED entry is libc and namcap reports every one of these as possibly
# unneeded. They are needed: the sonames are in the binary's string table.
# Do not delete them to silence the warnings.
#
# libxxf86vm and alsa-lib are deliberately NOT here. They were in the build
# headers CI installs, which is not the same as a runtime need -- nothing
# references either, and botropolis has no audio.
depends=('glibc' 'libgl' 'libx11' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr'
         'hicolor-icon-theme')
makedepends=('go')
optdepends=('claude-code: the sessions botropolis draws and manages'
            'waybar: a status bar for `botropolis bar --watch`')
# botropolis-bin installs the same three binaries from the release tarball. It
# declares conflicts=('botropolis'), and this is the other half of that pair, so
# the exclusion is stated from whichever package you are looking at.
conflicts=('botropolis-bin')

# The debug package is 14 MB of DWARF with nothing to pair it against: debugedit
# cannot read Go's DWARF 5 line tables ("Unsupported .debug_line directory 0 path
# DW_FORM_0x8"), so makepkg collects no sources and /usr/src/debug comes out
# empty. Stripping itself is fine and is left on.
options=('!debug')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('47135c7a37e27279e770589d7add236b3c96745e9efeba4b3ec9446899121618')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}" CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    for bin in botropolis botropolisd botropolis-hook; do
        go build -ldflags "-X ${url#https://}/pkg/version.Version=${pkgver}" -o "bin/${bin}" "./cmd/${bin}"
    done
}

check() {
    cd "${pkgname}-${pkgver}"
    # Unit tests only. The integration and acceptance suites generate a fixture
    # from the building user's own ~/.claude, which a package build must not read.
    go test ./cmd/... ./pkg/...
}

package() {
    cd "${pkgname}-${pkgver}"
    for bin in botropolis botropolisd botropolis-hook; do
        install -Dm755 "bin/${bin}" "${pkgdir}/usr/bin/${bin}"
    done
    install -Dm644 packaging/botropolisd.service "${pkgdir}/usr/lib/systemd/user/botropolisd.service"
    install -Dm644 packaging/botropolis-notify.service "${pkgdir}/usr/lib/systemd/user/botropolis-notify.service"
    install -Dm644 packaging/botropolis.bash "${pkgdir}/usr/share/botropolis/botropolis.bash"
    install -Dm644 packaging/botropolis.desktop "${pkgdir}/usr/share/applications/botropolis.desktop"
    install -Dm644 packaging/botropolis.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/botropolis.svg"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    # The Kenney atlases and the Inter typeface are compiled into the binaries,
    # so their licences ship with the package rather than only with the source.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 pkg/assets/fonts/inter/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/inter-OFL.txt"
    install -Dm644 pkg/assets/kits/nature-kit/License.txt "${pkgdir}/usr/share/licenses/${pkgname}/kenney-CC0.txt"
    install -Dm644 pkg/assets/kits/README.md "${pkgdir}/usr/share/licenses/${pkgname}/kenney-kits.md"
    install -Dm644 pkg/assets/kenney/README.md "${pkgdir}/usr/share/licenses/${pkgname}/kenney-packs.md"
}
