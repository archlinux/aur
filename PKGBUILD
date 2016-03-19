# Maintainer: Ainola
# Contributor:  Felix Berkenkamp

pkgname=creeper-world3
pkgver=212
pkgrel=1
pkgdesc="Creeper World 3: Arc Eternal is the third installment in the Creeper World Series."
arch=('i686' 'x86_64')
url="http://knucklecracker.com/creeperworld3/cw3.php"
license=('custom')
depends=('glu' 'gtk2')
source=("http://knucklecracker.com/creeperworld3/patches/CreeperWorld3PATCH-${pkgver}-linux.tgz"
	    "${pkgname}.desktop"
        "${pkgname}.sh"
        "${pkgname}.install")
sha256sums=('78f1b45b4771114309abd23fbcbfd0ff6bf4ecdcbfbaf0da3213af48ce71672d'
            'b94de60d7001a17fd852937e33cf43a1e8c46cda21ac36ae9ac39808e8293aa7'
            'c4171f171229ebe6e09421ce2a778b9ebfb8d55e1aaaf9b3ca5775e47c6672a1'
            'e6c9213ef87cd3b1e8b65e2cd24d2338e2b808e5bfe58154fa4364e597196ca8')
install="${pkgname}.install"
[ "$CARCH" == "x86_64" ] && _arch="x86_64" || _arch="x86"
# Prevent compressing final package
PKGEXT='.pkg.tar'

package() {
    # Launcher and Data
    install -Dm755 "${srcdir}/CW3.${_arch}" "${pkgdir}/opt/${pkgname}/CW3.${_arch}"
    mv "${srcdir}/CW3_Data" "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}/opt/${pkgname}/CW3_Data" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}/CW3_Data" -type f -exec chmod 644 {} \;

    # Install Binaries/Launchers
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "$srcdir/$pkgname.sh"  "${pkgdir}/usr/bin/${pkgname}"
    sed -i "s/MYARCH/$_arch/g" "$pkgdir/usr/bin/$pkgname"

    # Desktop Integration
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    ln -s "/opt/${pkgname}/CW3_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
