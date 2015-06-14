# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>
# Contributor: Maximilian Berger <snowdragon92@gmail.com>

pkgname=atlauncher
pkgrel=2
pkgver=3.2.2.1
pkgdesc="ATLauncher is a Launcher for Minecraft which integrates multiple different ModPacks to allow you to download and install ModPacks easily and quickly. Installs latest released jar."
arch=('any')
url="http://www.atlauncher.com/"
license=('CCPL')
depends=('java-runtime' 'xorg-server-utils' 'openal')
provides=('atlauncher')

source=("http://www.atlauncher.com/download/jar"
        "atlauncher"
        "atlauncher.desktop"
        "atlauncher.png"
        )
noextract=('jar')

md5sums=('SKIP'
         'SKIP'
         'bb6c25c948b8d2341a27803c123df453'
         '8ab8a70ca8c7dbff0dc23bec40a5a923')

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
    install -D -m755 "${srcdir}/atlauncher"         "${pkgdir}/usr/bin/atlauncher"

    # install jar
    install -D -m644 "${srcdir}/jar"     "${pkgdir}/usr/share/java/atlauncher/ATLauncher.jar"

    # install desktop launcher with icon
    install -D -m644 "${srcdir}/atlauncher.desktop" "${pkgdir}/usr/share/applications/atlauncher.desktop"
    install -D -m644 "${srcdir}/atlauncher.png"     "${pkgdir}/usr/share/pixmaps/atlauncher.png"
}
