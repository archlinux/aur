# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>
pkgname=portablesigner-bin
pkgver=2.0.38c0573
pkgrel=2
pkgdesc="Signing (with X.509 certificates) program for PDF files. Binary installation."
arch=('any')
url="http://portablesigner.sourceforge.net/"
license=('EUPL')
depends=('java-runtime>=8')
provides=('portablesigner')
source=("PortableSigner-Generic-2.0.38c0573.zip::https://sourceforge.net/projects/portablesigner/files/portablesigner/2.0-Release/PortableSigner-Generic-${pkgver}.zip/download"
"eupl1.1.-licence-en.pdf::http://ec.europa.eu/idabc/servlets/Docbb6d.pdf?id=31979")
noextract=("PortableSigner-Generic-${pkgver}.zip")

package() {
    # Uncompressing PortableSigner to its place
    mkdir -p ${pkgdir}/usr/share/java/portablesigner/
    cd ${pkgdir}/usr/share/java/portablesigner/
    bsdtar -xf ${srcdir}/PortableSigner-Generic-${pkgver}.zip || return 1
    find ${pkgdir}/usr/share/java/portablesigner/* -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr/share/java/portablesigner/* -type d -exec chmod 755 {} \;
    chown -R root.root ${pkgdir}/usr/share/java/portablesigner/* || return 1

    # The executable script
    mkdir -p ${pkgdir}/usr/bin/
    install -Dm755 ${pkgdir}/usr/share/java/portablesigner/linux/PortableSigner.sh \
    ${pkgdir}/usr/bin/portablesigner || return 1
    sed -i 's@/usr/local/PortableSigner/@/usr/share/java/portablesigner/@' \
    ${pkgdir}/usr/bin/portablesigner || return 1

    # Force Java 8
    sed -i 's@exec java@exec /usr/lib/jvm/java-8-openjdk/jre/bin/java@' \
	${pkgdir}/usr/bin/portablesigner

    # .icon and .desktop files
    install -Dm644 ${pkgdir}/usr/share/java/portablesigner/linux/PortableSignerLogo.png \
    ${pkgdir}/usr/share/pixmaps/PortableSignerLogo.png || return 1
    install -Dm644 ${pkgdir}/usr/share/java/portablesigner/linux/portablesigner.desktop \
    ${pkgdir}/usr/share/applications/portablesigner.desktop || return 1
    sed -i 's@/usr/local/PortableSigner/PortableSignerLogo.png@/usr/share/pixmaps/PortableSignerLogo.png@' \
    ${pkgdir}/usr/share/applications/portablesigner.desktop || return 1
    sed -i 's@Exec=PortableSigner@Exec=portablesigner@' \
    ${pkgdir}/usr/share/applications/portablesigner.desktop || return 1

    # Removing unneeded files
    rm -rf ${pkgdir}/usr/share/java/portablesigner/linux || return 1
    rm ${pkgdir}/usr/share/java/portablesigner/linux-install.sh || return 1

    # EUPL License
    install -Dm644 ${srcdir}/eupl1.1.-licence-en.pdf ${pkgdir}/usr/share/licenses/portablesigner/EUPL_v.1.1_-_Licence.pdf || return 1
}

md5sums=('5b52ea8d539a3bce6e0a790ad7038987'
         '31de38780168403d46a720de99196f81')
