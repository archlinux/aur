# Maintainer: czyt <czytcn@gmail.com>
pkgname=astrlink-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="A local privacy gateway for AI agents"
arch=('x86_64')
url="https://astrlink.com"
license=('Apache-2.0' 'AGPL-3.0-only')
depends=('gcc-libs' 'glibc' 'gtk3' 'libayatana-appindicator' 'libsecret'
         'libsoup3' 'libstdc++' 'webkit2gtk-4.1')
optdepends=('gtk-layer-shell: for the window hints that some desktops use')
provides=('astrlink')
conflicts=('astrlink')
options=('!strip' '!debug')

# The Debian package name has changed its capitalisation between versions
# (AstrLink_ up to v0.2.30, astrlink_ from v0.3.0); the prefix below follows
# the release, so the file is always the one that exists.
_deb_prefix="astrlink_"
_deb="${_deb_prefix}${pkgver}_amd64.deb"

source_x86_64=("${_deb}::https://github.com/Calcium-Ion/AstrLink/releases/download/v${pkgver}/${_deb}")
sha256sums_x86_64=('27689c899c4fb7c85fde87b85ddfb183489da17dbb045f2cc584f735e184326e')
noextract=("${_deb}")

package() {
    local data_archive

    # The compression has not been stable either, so the member is looked up
    # instead of assumed.
    data_archive="$(bsdtar -tf "${srcdir}/${_deb}" | sed -n '/^data\.tar\./{p;q;}')"
    [[ -n "$data_archive" ]] || {
        echo "Could not find data.tar.* in ${_deb}" >&2
        return 1
    }

    bsdtar -xOf "${srcdir}/${_deb}" "${data_archive}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # The Debian package keeps the program in /opt; Arch keeps such files in
    # /usr/lib, and the launcher keeps the name of the program.
    install -d "${pkgdir}/usr/lib"
    mv "${pkgdir}/opt/astrlink" "${pkgdir}/usr/lib/astrlink"
    rmdir "${pkgdir}/opt" 2>/dev/null || true
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/astrlink/astrlink "${pkgdir}/usr/bin/astrlink"

    # The desktop entry of the Debian package points into /opt.
    desktop="${pkgdir}/usr/share/applications/astrlink.desktop"
    if [ ! -f "${desktop}" ]; then
        echo "The package does not contain a desktop entry" >&2
        return 1
    fi
    sed -i 's|^Exec=.*|Exec=astrlink %U|' "${desktop}"

    # The program keeps its own licence files next to itself, because it shows
    # them in its about window. They are also installed in the usual place.
    install -Dm644 "${pkgdir}/usr/lib/astrlink/licenses/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/usr/lib/astrlink/licenses/LICENSING.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSING.md"
    install -Dm644 "${pkgdir}/usr/lib/astrlink/licenses/LICENSES/AGPL-3.0.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/AGPL-3.0.txt"

    # Some upstream builds ship the 256x256 icon under "256x256@2", which the
    # hicolor theme does not pick up. Newer builds already use "256x256".
    if [ -d "${pkgdir}/usr/share/icons/hicolor/256x256@2" ] &&
       [ ! -e "${pkgdir}/usr/share/icons/hicolor/256x256" ]; then
        mv "${pkgdir}/usr/share/icons/hicolor/256x256@2" \
            "${pkgdir}/usr/share/icons/hicolor/256x256"
    fi
}
