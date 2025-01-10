# Mantainer: Aldo Eliacim <aur@aldo.pw>
# Contributor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: LinRs <LinRs at users.noreply.github.com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=androidscreencast-bin
_pkgname=androidscreencast
pkgver=0.1
pkgrel=3
pkgdesc='Desktop app to control an android device remotely using mouse and keyboard'
arch=('any')
url='https://github.com/xSAVIKx/AndroidScreencast'
license=('Apache')
depends=('java-runtime>=7' 'android-tools')
source=("${pkgname}-${pkgver}.tgz"::"https://github.com/xSAVIKx/AndroidScreencast/releases/download/v$pkgver/androidscreencast-$pkgver-linux.tar.gz"
        'androidscreencast'
        "${_pkgname}.desktop")
sha256sums=('07e5982d430a431e55528ef7d7b385fbf9d634adbc53249e4d97b72ca1128253'
            '0746179cd97a7f2b17bff51f6e810c6fd5f22f9b0f671b8df1ac89705034436b'
            'd0cb97ddb4482710b8c0c54bc8c78cc2ca24c52f721cca9a13f0f99e4bd7252e')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

	# Install Java file
    install -Dm644 "${_pkgname}-${pkgver}-executable.jar" "${pkgdir}"/usr/share/java/"${_pkgname}/${_pkgname}.jar"

    # Fix `adb` executable path and install app.properties
    adb_path=$(which adb)
    echo "ADB executable was located at: $adb_path"
    echo "Fixing 'app.properties' file ..."
	sed -i "s#./adb#$adb_path#" app.properties
	install -Dm644 "app.properties" "${pkgdir}/usr/share/java/${_pkgname}/app.properties"
	echo "'app.properties' file will be installed to /usr/share/java/${_pkgname}/app.properties"

	# Install launcher
    cd "${srcdir}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Add .desktop file
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
