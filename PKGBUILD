# Maintainer: Christoph Flick <christophflick@gmx.de>
pkgname=jmstoolbox
pkgver=5.13.0
pkgrel=1
pkgdesc="A \"Universal\" JMS Client able to interact with a lot of \
     Queue Managers/Providers on the market in a consistent manner."
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('GPL3')
depends=('java-runtime>=11' 'gtk3')
makedepends=('maven' 'java-environment>=11')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha256sums=('39a49bc8d1de0b4285f3c1ddd6d80f7d15013c3bfd97ef7451559f71aa1097e9'
            'adf3cdcc56f9c58c960bc753dcf887969d701edcfd2087bf7584255046ca5f47'
            '59b5fe00935cfc109b9832475de40a631088c7d92217ac9bc0cafb6b090984e9')

prepare() {
	cd "${pkgname}-${pkgver}"
    # Remove JRE inclusion as it is only needed for the windows build
    sed -i '17d' org.titou10.jtb.build/pom.xml
    sed -i '104d' org.titou10.jtb.product/pom.xml
}

build() {
	cd "${pkgname}-${pkgver}/org.titou10.jtb.build"
	mvn clean verify
}

package() {
    # Install the icon into /usr/share/icons/hicolor
    cd "${pkgname}-${pkgver}"
    install -m 644 -D "org.titou10.jtb.core/icons/branding/jms-icon-32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/jmstoolbox.png"

    # Extract the dist archive
	cd "org.titou10.jtb.build/dist"
    tar -xf "${pkgname}-${pkgver}-linux.gtk.x86_64.tar.gz"

    # Install app into /usr/share/${pkgname}
    install -m 755 -d "${pkgdir}/usr/share"
    cp -r "JMSToolBox" "${pkgdir}/usr/share/${pkgname}"

    # Install executable into /usr/bin
    cd "${pkgdir}/usr/share/${pkgname}"
    install -m 755 -d "${pkgdir}/usr/bin"
    install -m 755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # Install application launcher into /usr/share/applications
    install -m 755 -d "${pkgdir}/usr/share/applications"
    install -m 755 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
}
