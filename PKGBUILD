# Maintainer: Slinet6056 <aur@slinet.me>

pkgname=manictime-bin
pkgver=2024.2.0.1
_pkgver=2024_2_0_1
pkgrel=1
pkgdesc='ManicTime automatically records your computer usage.'
arch=('x86_64')
url="https://www.manictime.com/download/linux"
license=('custom')
depends=('libappindicator-gtk3' 'libx11' 'glibc' 'libxss' 'gss-ntlmssp' 'krb5' 'icu')
options=('staticlibs')

source=("${pkgname}-${pkgver}.tar.gz::https://cdn.manictime.com/setup/linux/v${_pkgver}/manictime-arch-${pkgver}-linux-x64.tar.gz")
sha256sums=('29f237ee16cba3771ae35f63ac22a263111b4895d6933e9d153f3dbd5b11d875')

package() {
    install -Dm644 "${srcdir}/manictime/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/manictime/Resources/ManicTime.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"

    install -Dm644 "${srcdir}/manictime/changelog.gz" "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
    install -Dm644 "${srcdir}/manictime/copyright" "${pkgdir}/usr/share/doc/${pkgname}/copyright"

    install -Dm644 "${srcdir}/manictime/manictime.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"

    install -Dm644 <(
        cat <<'EOF'
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=ManicTime
Terminal=false

Icon=/usr/share/pixmaps/manictime-bin.svg
Exec=manictime-bin
Comment=Computer usage tracker
GenericName=manictime
Categories=Office;ProjectManagement;
EOF
    ) "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm755 <(
        cat <<'EOF'
#!/bin/bash
if [ $EUID -eq 0 ]; 
    then
        echo "manictime command does not support running ManicTime Tracker as root."
        exit 1
fi

exec /opt/manictime-bin/ManicTime
EOF
    ) "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -R "${srcdir}/manictime/"{Libs,Plugins,Resources,libhostfxr.so,libhostpolicy.so,ManicTime,ManicTime.deps.json,ManicTime.dll,ManicTime.runtimeconfig.json,Mtc,Mtc.deps.json,Mtc.dll,Mtc.runtimeconfig.json} "${pkgdir}/opt/${pkgname}"
}
