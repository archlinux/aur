# Maintainer: czyt <czytcn@gmail.com>
pkgname=creabim-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Free, open-source BIM modeller: one model for 3D, plans, sections, elevations, sheets, schedules, quantities and IFC"
arch=('x86_64')
url="https://github.com/chopinregis/CreaBIM"
license=('GPL-3.0-or-later')
# The program is a Rust build: the window is GTK 3 with a WebKitGTK 4.1 web
# view, while creabim-cli needs only glibc. Upstream's own deb asks for
# libxkbcommon-x11 on top of the GTK and WebKit libraries.
depends=('gcc-libs' 'glib2' 'glibc' 'gtk3' 'libsoup3' 'libxkbcommon-x11' 'webkit2gtk-4.1')
provides=('creabim')
conflicts=('creabim' 'creabim-git')
options=('!strip' '!debug')

# Upstream puts the build date in the file name, so the version alone does not
# name the asset; the workflow rewrites this line together with pkgver.
_date=2026-11-28
_deb="CreaBIM-${pkgver}-${_date}-linux-x64.deb"

source=("${_deb}::https://github.com/chopinregis/CreaBIM/releases/download/v${pkgver}/${_deb}")
noextract=("${_deb}")
sha256sums=('499d5a229ec9f30fd09d6c5571f398e7dfcbb7342797da571554617b1f971ca2')

package() {
    # The deb is an ar archive holding data.tar.*; the compression suffix varies,
    # so the member is looked up instead of assumed.
    local data_archive
    data_archive="$(bsdtar -tf "${srcdir}/${_deb}" | sed -n '/^data\.tar/{p;q;}')"
    [[ -n "$data_archive" ]] || { echo "No data.tar.* member in ${_deb}" >&2; return 1; }

    bsdtar -xOf "${srcdir}/${_deb}" "$data_archive" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # Debian keeps the documentation under the upstream package name; Arch
    # files it under the package that ships it. The copyright file is the
    # GPL text, so it becomes the licence.
    install -d "${pkgdir}/usr/share/doc/${pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/creabim/"* "${pkgdir}/usr/share/doc/${pkgname}/"
    rmdir "${pkgdir}/usr/share/doc/creabim"
    mv "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
