# Maintainer: Alan Jenkins <alan.james.jenkins at gmail dot com>
# Maintainer: Ryan Dowling <ryan at ryandowling dot me>
# Contributor: Maximilian Berger <snowdragon92 at gmail dot com>

pkgname=atlauncher-bin
pkgrel=1
pkgver=3.3.1.4
pkgdesc="A Launcher for Minecraft which to allow you to download and install ModPacks quickly and easily."
arch=('any')
url="http://www.atlauncher.com/"
license=('GPL3')
depends=('java-runtime' 'openal')
makedepends=('unzip')
provides=('atlauncher')

source=("atlauncher-${pkgver}-${pkgrel}.jar::http://www.atlauncher.com/download/jar"
        "atlauncher"
        "atlauncher.desktop"
        "atlauncher.png"
        )
noextract=('jar')

sha256sums=('4a5605c20ee477d7616f7262d5e0d0ae866b8098d67c9635c8f0e3a3b2184e0f'
            '8d74eebf99c96ce3719147dd5d00b66c72b5336371d0dc07cd1c96f7d45688fe'
            '5f45436c96ab9830555d0f987a96fc0b1a9766d450b958aba282820ffca6cc84'
            '369c7aa4439762878fd9970c75d1312cf0cd97119c8320b732addef4a621482d')

pkgver() {
    cd "$srcdir"
    mkdir temp
    unzip -d temp jar > /dev/null
    grep -i 'Implementation-Version' temp/META-INF/MANIFEST.MF | cut -d' ' -f2 | grep -oE '[0-9.]*'
    rm -R temp
}

package() {
    cd "$srcdir"

    # create folder for the main jar executable
    mkdir -p "${pkgdir}/usr/share/java/atlauncher/"
    chmod -R 755 "${pkgdir}/usr/share/java/atlauncher/"

    # create folder for other files
    mkdir -p "${pkgdir}/usr/share/atlauncher/Downloads"
    chmod 777 "${pkgdir}/usr/share/atlauncher/Downloads"

    # install shell wrapper script
    install -D -m755 "${srcdir}/atlauncher" "${pkgdir}/usr/bin/atlauncher"

    # install jar
    install -D -m644 "${srcdir}/atlauncher-${pkgver}-${pkgrel}.jar" "${pkgdir}/usr/share/java/atlauncher/ATLauncher.jar"

    # install desktop launcher with icon
    install -D -m644 "${srcdir}/atlauncher.desktop" "${pkgdir}/usr/share/applications/atlauncher.desktop"
    install -D -m644 "${srcdir}/atlauncher.png"     "${pkgdir}/usr/share/pixmaps/atlauncher.png"
}
