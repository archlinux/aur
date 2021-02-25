# Maintainer: Stefan Reisinger <dev at stefan-reisinger dot at>

pkgname=manictime-bin
pkgver=1.3.1
_pkgver=1_3_1_0
pkgrel=1
pkgdesc='ManicTime automatically records your computer usage.'
arch=('x86_64')
url="https://www.manictime.com/linux/download"
license=('custom')
depends=('libappindicator-gtk3' 'libx11' 'glibc' 'libxss' 'gss-ntlmssp' 'krb5')
options=('staticlibs')

source=("${pkgname}-${pkgver}.tar.gz::https://cdn.manictime.com/setup/linux/v${_pkgver}/ManicTime.tar.gz")
sha256sums=('1da4fddd1ed44dc0eb2e1e3d11e4f1f54caca7c61f8be7330147e21be1cee62a')

package() {
    install -Dm644 "${srcdir}/manictime/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/manictime/Resources/ManicTime.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    
    
    install -Dm644 "${srcdir}/manictime/changelog.gz" "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
    install -Dm644 "${srcdir}/manictime/copyright" "${pkgdir}/usr/share/doc/${pkgname}/copyright"
    
    install -Dm644 "${srcdir}/manictime/manictime.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    
    install -Dm644 <(cat << 'EOF'
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=ManicTime
Terminal=false

Icon=/usr/share/pixmaps/manictime-bin.png
Exec=manictime-bin
Comment=Computer usage tracker
GenericName=manictime
Categories=Office;ProjectManagement;
EOF
        ) "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    install -Dm755 <(cat << 'EOF'
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
