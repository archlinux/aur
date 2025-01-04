# Mantainer: Aldo Eliacim <aur@aldo.pw>
# Controbutor: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: LinRs <LinRs at users.noreply.github.com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=androidscreencast-bin
_pkgname=androidscreencast
pkgver=0.1
pkgrel=2
pkgdesc='Desktop app to control an android device remotely using mouse and keyboard'
arch=('any')
url='https://github.com/xSAVIKx/AndroidScreencast'
license=('Apache')
depends=('java-runtime>=7' 'android-tools')
source=("${pkgname}-${pkgver}.tgz"::"https://github.com/xSAVIKx/AndroidScreencast/releases/download/v$pkgver/androidscreencast-$pkgver-linux.tar.gz"
        'androidscreencast'
        "${_pkgname}.desktop")
sha256sums=('07e5982d430a431e55528ef7d7b385fbf9d634adbc53249e4d97b72ca1128253'
            'd23fed270ea172c39ee849a3a7b074f6667746f350dce7afbd0c8e6ff234f060'
            '9473bbce985bfbe926f5e40393b1ac0054c4dda4e1e25efe1e65fa6decd9341c')

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
