# Maintainer: ZorinArch < zorinarch at protonmail dot com >

pkgname=windsurf-bin
_pkgname=windsurf
pkgver=1.0.2
pkgrel=1
pkgdesc="Tomorrow's Editor, Today. Built to keep you in flow state with instant, invaluable AI developer assistance."
arch=('x86_64')
url="https://codeium.com/windsurf"
license=('custom')
depends=(fontconfig libxtst gtk3 python cairo alsa-lib nss gcc-libs libnotify libxss glibc libxkbfile gnupg libsecret lsof shared-mime-info xdg-utils)
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu'
            'org.freedesktop.secrets: Needed for settings sync'
             # See https://github.com/MicrosoftDocs/live-share/issues/4650
            'icu69: Needed for live share'
            'vulkan-icd-loader: Vulkan support')
provides=('windsurf')
conflicts=('windsurf')
options=(!strip)

source=("https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt/pool/main/w/windsurf/Windsurf-linux-x64-${pkgver}.deb"
        ${_pkgname}-bin.sh)
sha256sums=("75a0862508baf5c4f253a4584654c21a16c751ed7efc5c72bfe2d832b3ee2ef8"
            "bed47ba135c4b45ef1cba3aeac28260d508162d6e85922b120dfd82794cf1b1b")

prepare() {
	bsdtar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/"
}

build() {
	sed -e 's|Exec=/usr/share/windsurf/windsurf %F|Exec=//usr/bin/windsurf %F|' \
        -e 's|Exec=/usr/share/windsurf/windsurf --new-window %F|Exec=/usr/bin/windsurf --new-window %F|' \
		-i "${srcdir}/usr/share/applications/windsurf.desktop"
    sed -e 's|Exec=/usr/share/windsurf/windsurf --open-url %U|Exec=/usr/bin/windsurf --open-url %U|' \
		-i "${srcdir}/usr/share/applications/windsurf-url-handler.desktop"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/"


    cp -r "${srcdir}/usr/share/windsurf/" "${pkgdir}/opt/"
    rm -rf "${srcdir}/usr/share/windsurf"
    cp -r "${srcdir}/usr/share/" "${pkgdir}/usr/"
    install -m755 "${srcdir}/${_pkgname}-bin.sh" "${pkgdir}/usr/bin/windsurf"
}
