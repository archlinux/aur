# Maintainer: Aria Vesta <dev@ariavesta.com>
pkgname=botropolis-bin
_pkgname=botropolis
pkgver=0.1.4
pkgrel=1
pkgdesc="Every Claude Code session on this machine, drawn as a city (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/auroq/botropolis"
license=('MIT')
# Ebitengine reaches GL and X11 through dlopen rather than linking them, so the
# binaries' only NEEDED entry is libc and namcap reports every one of these as
# possibly unneeded. They are needed: the sonames are in the binaries' string
# tables. Do not delete them to silence the warnings.
depends=('glibc' 'libgl' 'libx11' 'libxcursor' 'libxi' 'libxinerama' 'libxrandr'
         'hicolor-icon-theme')
optdepends=('claude-code: the sessions botropolis draws and manages'
            'waybar: a status bar for `botropolis bar --watch`')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
# makepkg's strip pass is fine on these: Go keeps what a traceback needs in
# .gopclntab, which is a loaded section strip does not touch, and dlopen resolves
# through .dynsym, which survives too. Verified by running the stripped binaries.
#
# !debug, though. The debug package is 14 MB of DWARF and makepkg collects no
# sources to pair it with -- debugedit cannot read Go's DWARF 5 line tables
# ("Unsupported .debug_line directory 0 path DW_FORM_0x8"), so /usr/src/debug
# comes out empty. The source package has the same empty result.
options=('!debug')
# The point of a -bin package is that it ships what upstream's CI built and
# tested. makepkg's default strip and debugedit passes rewrite the ELFs, so the
# installed binaries would no longer match the sha256sums above, and a -debug
# package would be built from binaries whose source tree is not here.
source_x86_64=("${_pkgname}-${pkgver}-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('e9d6e73c3591b231d4b335bec8bb395de35af92bf0734c10d2db2e758bc9a601')
sha256sums_aarch64=('8af3a3c88fee71b7c32c65d8917e3e9b13484c876986836ab05ac2ff3b039f45')

package() {
    cd "${_pkgname}-${pkgver}"
    for bin in botropolis botropolisd botropolis-hook; do
        install -Dm755 "${bin}" "${pkgdir}/usr/bin/${bin}"
    done
    install -Dm644 packaging/botropolisd.service "${pkgdir}/usr/lib/systemd/user/botropolisd.service"
    install -Dm644 packaging/botropolis-notify.service "${pkgdir}/usr/lib/systemd/user/botropolis-notify.service"
    install -Dm644 packaging/botropolis.bash "${pkgdir}/usr/share/botropolis/botropolis.bash"
    install -Dm644 packaging/botropolis.desktop "${pkgdir}/usr/share/applications/botropolis.desktop"
    install -Dm644 packaging/botropolis.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/botropolis.svg"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
    # The Kenney atlases and the Inter typeface are compiled into the binaries,
    # so their licences ship with the package rather than only with the source.
    #
    # Under ${pkgname}, not ${_pkgname}: a licence audit looks for license=MIT
    # beneath /usr/share/licenses/<the installed package>. The docs above stay
    # under botropolis, where the program's name puts them either way.
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 inter-OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/inter-OFL.txt"
    install -Dm644 kenney-CC0.txt "${pkgdir}/usr/share/licenses/${pkgname}/kenney-CC0.txt"
    install -Dm644 kenney-kits.md "${pkgdir}/usr/share/licenses/${pkgname}/kenney-kits.md"
    install -Dm644 kenney-packs.md "${pkgdir}/usr/share/licenses/${pkgname}/kenney-packs.md"
}
