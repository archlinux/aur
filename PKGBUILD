# Maintainer : alisoftware <admin@situsali.com>
pkgname=jsignpdf
pkgver=1.6.1
pkgrel=0
pkgdesc="Digital sign PDF files with X.509 certificates."
arch=('any')
url="http://jsignpdf.sourceforge.net/"
license=('LGPL' 'MPL')
depends=('java-runtime>=8')
provides=('jsignpdf')
source=("http://ncu.dl.sourceforge.net/project/jsignpdf/stable/JSignPdf%201.6.1/JSignPdf-${pkgver}.zip"
	"jsignpdf.sh"
	"jsignpdf.png"
	"jsignpdf.desktop")
md5sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP')


package() {
    mkdir -p ${pkgdir}/usr/share/java/jsignpdf/

    cd ${srcdir}/${pkgname}-${pkgver}
    cp -R * ${pkgdir}/usr/share/java/jsignpdf/

    find ${pkgdir}/usr/share/java/jsignpdf/* -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr/share/java/jsignpdf/* -type d -exec chmod 755 {} \;
    chown -R root.root ${pkgdir}/usr/share/java/jsignpdf/* || return 1

    # The executable script
    mkdir -p ${pkgdir}/usr/bin/
    install -Dm755 ${srcdir}/jsignpdf.sh \
    ${pkgdir}/usr/bin/jsignpdf || return 1
    
    # Force Java 8
    sed -i 's@exec java@exec /usr/lib/jvm/java-8-openjdk/jre/bin/java@' \
	${pkgdir}/usr/bin/jsignpdf

    # .icon and .desktop files
    install -Dm644 ${srcdir}/jsignpdf.png \
    ${pkgdir}/usr/share/icons/hicolor/scalable/apps/jsignpdf.png || return 1
    install -Dm644 ${srcdir}/jsignpdf.desktop \
    ${pkgdir}/usr/share/applications/jsignpdf.desktop || return 1

    # Docs and License
    mkdir -p ${pkgdir}/usr/share/docs/${pkgname}
    mkdir -p ${pkgdir}/usr/share/license/${pkgname}
    cp ${pkgdir}/usr/share/java/jsignpdf/docs/ChangeLog.txt ${pkgdir}/usr/share/docs/${pkgname}/
    cp ${pkgdir}/usr/share/java/jsignpdf/docs/JSignPdf.pdf ${pkgdir}/usr/share/docs/${pkgname}/
    cp ${pkgdir}/usr/share/java/jsignpdf/docs/JSignPdf_signed.pdf ${pkgdir}/usr/share/docs/${pkgname}/
    cp ${pkgdir}/usr/share/java/jsignpdf/docs/ReleaseNotes.txt ${pkgdir}/usr/share/docs/${pkgname}/
    cp ${pkgdir}/usr/share/java/jsignpdf/docs/lgpl-2.1.txt ${pkgdir}/usr/share/license/${pkgname}/
    cp ${pkgdir}/usr/share/java/jsignpdf/docs/MPL-1.1.txt ${pkgdir}/usr/share/license/${pkgname}/
    cp -R ${pkgdir}/usr/share/java/jsignpdf/docs/ThirdPartyLicenses/ ${pkgdir}/usr/share/license/${pkgname}/

    # Removing unneeded files
    rm -rf ${pkgdir}/usr/share/java/jsignpdf/docs/ || return 1
}
