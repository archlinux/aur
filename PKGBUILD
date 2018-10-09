# Maintainer: SantoZ <santoz28 at mailbox dot org>
# Contributors: Det, Achilleas Pipinellis, speed145a, Schnouki

_chromium_rel=2
_launcher_ver=6
_od_id=1538485969

pkgname=ungoogled-chromium-bin
pkgver=69.0.3497.100
pkgrel=4
pkgdesc="Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparency (binary version)"
arch=("x86_64")
url="https://github.com/Eloston/ungoogled-chromium"
license=("BSD")
provides=("chromium")
conflicts=("chromium" "iridium" "ungoogled-chromium")
depends=("gtk3" "nss" "alsa-lib" "xdg-utils" "libxss" "libcups" "libgcrypt"
         "ttf-font" "systemd" "dbus" "libpulse" "pciutils" "json-glib"
         "desktop-file-utils" "hicolor-icon-theme")
optdepends=("gnome-keyring: for storing passwords in GNOME keyring"
            "kdialog: needed for file dialogs in KDE"
            "kwallet: for storing passwords in KWallet"
            "pepper-flash: support for Flash content"
            "chromium-widevine: for widevine content decryption module")
source=("https://dl.opendesktop.org/api/files/download/id/${_od_id}/s/0757d1747db5d3f4f6d6ca61fd4864f8/t/1539061342/u//ungoogled-chromium_${pkgver}-${_chromium_rel}_linux.tar.xz"
        "chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz"
        "chromium.desktop")
sha256sums=("da7ed55c0ef7ba74b2d365fc63b92d3eb3e0310b8b9c52855010c6620f9d1cb5"
            "04917e3cd4307d8e31bfb0027a5dce6d086edb10ff8a716024fbb8bb0c7dccf1"
            "15898507b5bda1e56e303c7e7f54b80d6363e8f77321d29067eef15f4c5deeb5")

prepare() {
    cd $srcdir
    mv ungoogled-chromium_${pkgver}-${_chromium_rel}_linux chromium
}

build() {
    make -C chromium-launcher-$_launcher_ver
}

package() {
    ## Install chromium launcher
    cd chromium-launcher-${_launcher_ver}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/chromium/LICENSE.launcher"
    cd ${srcdir}
    
    ## Install chromium itself
    # Executables
    install -D chromium/chrome "${pkgdir}/usr/lib/chromium/chromium"
    install -Dm4755 chromium/chrome_sandbox "${pkgdir}/usr/lib/chromium/chrome-sandbox"
    
    # Desktop files
    install -Dm644 chromium.desktop "${pkgdir}/usr/share/applications/chromium.desktop"
    
    # Libraries
    cp \
        chromium/{chrome_{100,200}_percent,resources}.pak \
        chromium/*.bin \
        chromium/*.so \
        chromium/icudtl.dat \
        "${pkgdir}/usr/lib/chromium/"
    cp -r chromium/resources "${pkgdir}/usr/lib/chromium"

    # Locales
    install -Dm644 -t "${pkgdir}/usr/lib/chromium/locales" chromium/locales/*.pak

    # Icon
    install -Dm644 chromium/product_logo_48.png \
        "${pkgdir}/usr/share/icons/hicolor/48x48/apps/chromium.png"
}

