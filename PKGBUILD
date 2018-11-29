# Maintainer: SantoZ <santoz28 at mailbox dot org>
# Contributors: Det, Achilleas Pipinellis, speed145a, Schnouki

_launcher_ver=6
_url_id="6oST9BpB92Lcdtj"

pkgname=ungoogled-chromium-bin
pkgver=70.0.3538.110
pkgrel=1
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
            "pepper-flash: support for Flash content")
source=("ungoogled-chromium_${pkgver}-${pkgrel}_linux.tar.xz::https://cloud.woelkli.com/s/${_url_id}/download"
        "chromium-launcher-${_launcher_ver}.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v${_launcher_ver}.tar.gz"
        "chromium.desktop")
sha256sums=("cda9460452a093ec506459944f2c77b50aa5b9e4fc0d1b64d1db1396344a5dc8"
            "04917e3cd4307d8e31bfb0027a5dce6d086edb10ff8a716024fbb8bb0c7dccf1"
            "15898507b5bda1e56e303c7e7f54b80d6363e8f77321d29067eef15f4c5deeb5")

prepare() {
    cd $srcdir
    mv ungoogled-chromium_${pkgver}-${pkgrel}_linux chromium
}

build() {
    make -C chromium-launcher-$_launcher_ver
}

package() {
    ## Launcher
    cd chromium-launcher-${_launcher_ver}
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/chromium/LICENSE.launcher"
    cd ${srcdir}
    
    ## Browser
    install -D chromium/chrome "${pkgdir}/usr/lib/chromium/chromium"
    install -Dm4755 chromium/chrome_sandbox "${pkgdir}/usr/lib/chromium/chrome-sandbox"
    ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"
    
    install -Dm644 chromium.desktop "${pkgdir}/usr/share/applications/chromium.desktop"
    
    cp \
        chromium/{chrome_{100,200}_percent,resources}.pak \
        chromium/{*.bin,chromedriver} \
        chromium/*.so \
        chromium/icudtl.dat \
        "${pkgdir}/usr/lib/chromium/"
    cp -r chromium/resources "${pkgdir}/usr/lib/chromium"

    install -Dm644 -t "${pkgdir}/usr/lib/chromium/locales" chromium/locales/*.pak

    install -Dm644 chromium/product_logo_48.png \
        "${pkgdir}/usr/share/icons/hicolor/48x48/apps/chromium.png"
}

