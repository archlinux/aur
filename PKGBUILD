# Maintainer: taotieren <admin@taotieren.com>

pkgbase=fsp-bin
pkgname=(fsp-bin fsp-e2s-bin fsp-renesas-bin)
_tagname=6_2_0_rasc_v2025-10
_pkgver=${_tagname%%_rasc*}
pkgver="${_pkgver//_/.}"
pkgrel=2
epoch=
pkgdesc="Flexible Software Package (FSP) for Renesas RA MCU Family"
arch=('x86_64')
url="https://github.com/renesas/fsp"
license=('LicenseRef-scancode-commercial-license')
depends=(
    bash
)
makedepends=(
    libarchive
)
optdepends=()
backup=()
options=('!strip' '!debug' '!lto' 'emptydirs')
install=
_year_month=${_tagname##*v}
_year_month=${_year_month//_/-}
_e2s=setup_fsp_v${pkgver//./_}_e2s_v${_year_month}.xz.run
_rasc=setup_fsp_v${pkgver//./_}_rasc_v${_year_month}.xz.run
source=(
    "LICENSE.md::https://raw.githubusercontent.com/renesas/fsp/master/LICENSE.md"
    "${url}/releases/download/v${pkgver}/${_e2s}"
    "${url}/releases/download/v${pkgver}/${_rasc}"
)
sha256sums=('e1f6671c02e028678ed35996becd061f3498e08557986b7d15678d9985c96d97'
    '935b144f2de4c09ec9a5c12aec4ff25053801cc0c9a127bd4af88a24a99f6cab'
    '694565dfaf7366793952da11f8a4c155a484067ed10d9520ac9ef0de23cc8d43')
noextract=()

prepare() {
    cd "$srcdir"
    chmod +x "${_e2s}"
    "./${_e2s}" --nochown --noexec --noprogress --nox11 --target "$srcdir/e2s"
    chmod +x "${_rasc}"
    "./${_rasc}" --nochown --noexec --noprogress --nox11 --target "$srcdir/rasc"
}

package_fsp-bin() {
    pkgdesc="Flexible Software Package (FSP) for Renesas RA MCU Family"
    provides=(${pkgname%-bin})
    conflicts=(${pkgname%-bin})
    depends=(
        fsp-e2s
        fsp-renesas
    )
}

package_fsp-e2s-bin() {
    pkgdesc="Flexible Software Package (FSP) for Renesas RA MCU Family - Renesas e² studio"
    provides=(${pkgname%-bin})
    conflicts=(${pkgname%-bin})
    depends=(
        sh
        dbus
        expat
        gcc-libs
        glib2
        java-runtime
        python
        zlib
    )

    "$srcdir/e2s/installer" \
        --launcher.suppressErrors \
        -noSplash \
        -install.silent \
        -install.Declipse.p2.default.renesas.skipDriverInstall=true \
        -install.Declipse.p2.default.createLauncherShortcuts=false \
        -install.Declipse.p2.default.defaultInstallLoc="$pkgdir/opt/renesas/e2s" \
        -install.Declipse.p2.location.data=/tmp/e2s

    cd "$pkgdir/opt/renesas/e2s/uninstall/configuration"
    rm -f *.log

    sed -i "s#${pkgdir//#/\\#}##g" \
        "$pkgdir/opt/renesas/e2s/eclipse/e2studio.ini" \
        "$pkgdir/opt/renesas/e2s/eclipse/p2/org.eclipse.equinox.p2.engine/.settings/org.eclipse.equinox.p2.artifact.repository.prefs"

    install -Dm0644 /dev/stdin "$pkgdir/usr/share/applications/renesas-e2-studio.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Renesas e² studio
Exec=/opt/renesas/e2s/eclipse/e2studio
Icon=/opt/renesas/e2s/eclipse/icon.xpm
EOF
    install -Dm644 "${srcdir}"/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_fsp-renesas-bin() {
    pkgdesc="Flexible Software Package (FSP) for Renesas RA MCU Family - Renesas Smart Configurator"
    provides=(${pkgname%-bin})
    conflicts=(${pkgname%-bin})
    depends=(
        dbus
        expat
        glibc
        gcc-libs
        glib2
        java-runtime
        python
    )

    "$srcdir/rasc/installer" \
        --launcher.suppressErrors \
        -noSplash \
        -install.silent \
        -install.Declipse.p2.default.renesas.skipDriverInstall=true \
        -install.Declipse.p2.default.createLauncherShortcuts=false \
        -install.Declipse.p2.default.defaultInstallLoc="$pkgdir/opt/renesas/rasc/" \
        -install.Declipse.p2.location.data=/tmp/rasc

    cd "$pkgdir/opt/renesas/rasc/uninstall/configuration"
    rm -f *.log

    sed -i "s#${pkgdir//#/\\#}##g" \
        "$pkgdir/opt/renesas/rasc/eclipse/rasc.ini" \
        "$pkgdir/opt/renesas/rasc/eclipse/p2/org.eclipse.equinox.p2.engine/.settings/org.eclipse.equinox.p2.artifact.repository.prefs"

    install -Dm0644 /dev/stdin "$pkgdir/usr/share/applications/renesas-rasc-smart.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Renesas Smart Configurator
Exec=/opt/renesas/rasc/eclipse/rasc
Icon=/opt/renesas/rasc/eclipse/icon.xpm
EOF

    install -Dm644 "${srcdir}"/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
