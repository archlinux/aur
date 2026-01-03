# Maintainer: kylon
pkgbase="powertuner"
pkgname="powertuner"
pkgver=1.2
pkgrel=1
pkgdesc="The first multi-platform client-daemon tuning app for desktop and handheld devices"
url="https://github.com/PowerTuner"
install="powertuner.install"
arch=("x86_64")
depends=(
    "qt6-base"
    "qt6-speech"
    "kmod"
    "systemd-libs"
    "pciutils"
)
license=("GPL-3.0-or-later")
provides=("powertuner")
conflicts=("powertuner")
source=(
    "https://github.com/PowerTuner/PowerTuner-releases/releases/download/${pkgver}/PowerTunerArchLinux-${pkgver}.tar.gz"
)
sha256sums=(
    '12498113e65d0c836d164d78bc5019daab4316e874e64298f78e8d225f33ffbb'
)

prepare() {
    tar -xzf "PowerTunerArchLinux-${pkgver}.tar.gz"
}

package() {
    local baseDir="${srcdir}/PowerTunerArchLinux"
    local i
    local app

    install -Dm755 "${baseDir}"/usr/bin/PowerTunerCLI -t "${pkgdir}"/usr/bin/
    install -Dm755 "${baseDir}"/usr/bin/PowerTunerConsole -t "${pkgdir}"/usr/bin/
    install -Dm755 "${baseDir}"/usr/bin/PowerTunerClient -t "${pkgdir}"/usr/bin/
    install -Dm755 "${baseDir}"/usr/bin/PowerTunerDaemon -t "${pkgdir}"/usr/bin/

    install -Dm755 "${baseDir}"/usr/lib/libPWTClientCommon.so -t "${pkgdir}"/usr/lib/
    install -Dm755 "${baseDir}"/usr/lib/libPWTClientCommon.so.1.0 -t "${pkgdir}"/usr/lib/
    install -Dm755 "${baseDir}"/usr/lib/libPWTClientService.so -t "${pkgdir}"/usr/lib/
    install -Dm755 "${baseDir}"/usr/lib/libPWTClientService.so.1.1 -t "${pkgdir}"/usr/lib/
    install -Dm755 "${baseDir}"/usr/lib/libPWTShared.so -t "${pkgdir}"/usr/lib/
    install -Dm755 "${baseDir}"/usr/lib/libPWTShared.so.1.1 -t "${pkgdir}"/usr/lib/

    for app in "powerTunerClient" "powerTunerConsole"; do
        for i in 16 22 24 32 48 64 128 256; do
            install -Dvm644 "$baseDir/usr/share/icons/hicolor/${i}x${i}/apps/$app.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$app.png"
        done
    done

    for app in "powertunerclient" "powertunerconsole"; do
        install -Dm644 "$baseDir/usr/share/applications/org.powertuner.$app.desktop" -t "$pkgdir/usr/share/applications/"
        install -Dm644 "$baseDir/usr/share/metainfo/org.powertuner.$app.appdata.xml" -t "$pkgdir/usr/share/metainfo/"
    done

    install -Dm644 "${baseDir}"/usr/lib/systemd/system/powertunerd.service -t "${pkgdir}"/usr/lib/systemd/system/
}
