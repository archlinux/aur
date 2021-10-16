# Maintainer: Greg Land <landjgregory at gmail dot com>
# Contributor: Aleksandr Arlanow <aleksandr at arlanow dot ru>
pkgname=evelauncher
pkgver=1747682
pkgrel=1
pkgdesc="Unofficial Eve Online Launcher."
arch=('any')
url="https://forums.eveonline.com/t/eve-launcher-for-linux/7286"
license=('custom')
depends=('qt5-base'
        'qt5-translations'
        'qt5-webengine'
        'qt5-webkit'
        'qt5-webview'
        'qt5-websockets'
        'openssl'
        'lib32-libldap'
        )
source=(
	"https://binaries.eveonline.com/evelauncher-${pkgver}.tar.gz"
	"evelauncher.desktop"
	"icon.png"
  "evelauncher.sh")
md5sums=('1c8cbce131976b7725d55f215b448552'
         '251749f620075212991b997e98c39366'
         'ecd3b7d8dd554f8106045e1d78a885c6'
         'e133d2aaf8d35fb1438d0b97072dd630')

package() {
	# Install the main files.
  	install -d "${pkgdir}/opt/${pkgname}"
  	rm ${srcdir}/evelauncher/libQt5* ${srcdir}/evelauncher/QtWebEngineProcess
  	rm -r "${srcdir}/evelauncher/plugins/"
  	rm -r "${srcdir}/evelauncher/resources/"
    # This set of libaries is causing evelauncher to not start
      rm ${srcdir}/evelauncher/libxcb*
  	cp -a "${srcdir}/evelauncher/." "${pkgdir}/opt/${pkgname}"
  	ln -s "/usr/lib/qt/libexec/QtWebEngineProcess" "${pkgdir}/opt/${pkgname}"
  	ln -s "/usr/lib/qt/plugins/" "${pkgdir}/opt/${pkgname}"
    ln -s "/usr/share/qt/resources/" "${pkgdir}/opt/${pkgname}"
    ln -s "/usr/share/qt/translations/" "${pkgdir}/opt/${pkgname}"
  	
	# Exec bit
  	chmod 755 "${pkgdir}/opt/${pkgname}/evelauncher"

  # Desktop Entry
    install -d "${pkgdir}/usr/share/applications"
    install "${srcdir}/evelauncher.desktop" "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/opt/${pkgname}"
    install "${srcdir}/icon.png" "${pkgdir}/opt/${pkgname}"
	
  # Main binary
    install -d "${pkgdir}/usr/bin"
    # Replace packaged launch script with new one
    rm "${pkgdir}/opt/${pkgname}/evelauncher.sh"
    install "${srcdir}/evelauncher.sh" "${pkgdir}/opt/${pkgname}"
    #cp "../evelauncher.sh" "/opt/${pkgname}/evelauncher.sh"
    ln -s "/opt/${pkgname}/evelauncher.sh" "${pkgdir}/usr/bin/${pkgname}.sh"
    ln -s "/opt/${pkgname}/evelauncher.sh" "${pkgdir}/usr/bin/${pkgname}"

}

