# Maintainer: lumexren <lumexren@gmail.com>

pkgname=plasma-nm-networkd
pkgver=6.8.2
pkgrel=1
pkgdesc="Plasma applet and System Settings module powered by systemd-networkd & NetworkManager, drop-in replacement for plasma-nm"
arch=('x86_64' 'aarch64')
url="https://github.com/lumexren/plasma-nm-networkd"
license=('GPL-3.0-or-later')
depends=(
    'libplasma'
    'kcmutils'
    'kirigami'
    'kirigami-addons'
    'python'
)
makedepends=(
    'git'
    'qt6-base'
    'kcmutils'
    'kcoreaddons'
    'ki18n'
    'gettext'
)
optdepends=(
    'networkmanager: For NetworkManager backend support'
    'systemd: For systemd-networkd backend support'
    'iwd: Intel wireless daemon for Wi-Fi'
    'wpa_supplicant: Alternative Wi-Fi management'
)
provides=("plasma-nm=${pkgver}")
conflicts=('plasma-nm')
install="${pkgname}.install"
source=("git+https://github.com/lumexren/plasma-nm-networkd.git#branch=6.x")
sha256sums=('SKIP')

build() {
    cd "${pkgname}"

    # Compile translations
    mkdir -p package/contents/locale/tr/LC_MESSAGES
    msgfmt po/tr.po -o package/contents/locale/tr/LC_MESSAGES/plasma_applet_org.kde.plasma.networkmanagement.mo
    cp package/contents/locale/tr/LC_MESSAGES/plasma_applet_org.kde.plasma.networkmanagement.mo \
       package/contents/locale/tr/LC_MESSAGES/plasma_applet_org.kde.plasma.networkd.mo

    # Build KCM
    cd kcm
    ./build-kcm.sh
}

package() {
    cd "${pkgname}"

    # 1. Install Plasmoid
    local plasmoid_dir="${pkgdir}/usr/share/plasma/plasmoids/org.kde.plasma.networkmanagement"
    install -dm755 "${plasmoid_dir}"
    cp -r package/* "${plasmoid_dir}/"
    chmod +x "${plasmoid_dir}/contents/scripts/backend.py"

    # 2. Install KCM plugin and desktop entry for System Settings
    install -Dm755 kcm/kcm_networkmanagement.so "${pkgdir}/usr/lib/qt6/plugins/plasma/kcms/systemsettings/kcm_networkmanagement.so"
    install -Dm644 kcm/kcm_networkmanagement.desktop "${pkgdir}/usr/share/applications/kcm_networkmanagement.desktop"

    # 3. Install translations to system locale
    local locale_dir="${pkgdir}/usr/share/locale/tr/LC_MESSAGES"
    install -dm755 "${locale_dir}"
    if [ -f "package/contents/locale/tr/LC_MESSAGES/plasma_applet_org.kde.plasma.networkmanagement.mo" ]; then
        install -Dm644 "package/contents/locale/tr/LC_MESSAGES/plasma_applet_org.kde.plasma.networkmanagement.mo" \
            "${locale_dir}/plasma_applet_org.kde.plasma.networkmanagement.mo"
    fi

    # 4. Install polkit rule
    install -Dm644 10-plasma-networkd.rules "${pkgdir}/usr/share/polkit-1/rules.d/10-plasma-networkd.rules"

    # 5. Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
