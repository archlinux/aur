# Maintainer: bemxio <bemxiov@protonmail.com>

pkgname=chomikbox
pkgdesc="A desktop application for Chomikuj.pl integration"

pkgver=2.0.5
pkgrel=2

arch=(x86_64)

url="http://chomikuj.pl/ChomikBox.aspx"
license=("freeware")

depends=(qt4 gstreamer0.10-base)
#makedepends=()

provides=(chomikbox)
#conflicts=()

source=("http://bts.box.chomikuj.pl/repo/all/${pkgver}/linux64/ChomikBox-pl-installer.64.sh" "chomikbox.png" "chomikbox-music-light.png")
md5sums=("758911e6ffc6e3c2e83ad7b64a97c603" "644b11c413a5542b187e7a040b7a0d5e" "0ccd8b3e3ce7fb30a5706f80f4959b5c")

prepare() {
    # get the archive from the shell script
    tail -c 24350255 ChomikBox-pl-installer.64.sh > chomikbox.tar.bz2

    # extract the archive
    mkdir -p chomikbox && tar -xjf chomikbox.tar.bz2 -C chomikbox

    # replace the template literals in the files
    for file in chomikbox/desktop/*; do
        sed -i "s/\${name}/ChomikBox/g" $file
        sed -i "s/\${version}/${pkgver}/g" $file

        sed -i "s/\${title}/ChomikBox/g" $file
        sed -i "s/\${domain}/chomikuj.pl/g" $file

        sed -i "s/\${exec}/chomikbox/g" $file
        sed -i "s/\${icon}/chomikbox.png/g" $file
    done

    sed -i "s|\${path}/ChomikBox_music_light.png|chomikbox-music-light.png|g" chomikbox/desktop/chomikbox.musicfile.desktop
}

package() {
    # move into the source directory
    cd chomikbox

    # make the required directories
    mkdir -p "${pkgdir}/usr/share/chomikbox/"
    mkdir -p "${pkgdir}/usr/bin"

    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/mime/packages"
    mkdir -p "${pkgdir}/usr/share/pixmaps"

    # copy base files to the package directory
    find files -type f -exec install -Dm644 {} "${pkgdir}/usr/share/chomikbox/{}" \;
    find locale -type f -exec install -Dm644 {} "${pkgdir}/usr/share/chomikbox/{}" \;
    find skins -type f -exec install -Dm644 {} "${pkgdir}/usr/share/chomikbox/{}" \;

    install -Dm644 base.ini "${pkgdir}/usr/share/chomikbox/base.ini"

    install -Dm755 chomikbox "${pkgdir}/usr/share/chomikbox/chomikbox"
    install -Dm755 configurator "${pkgdir}/usr/share/chomikbox/configurator"
    install -Dm755 crashsender "${pkgdir}/usr/share/chomikbox/crashsender"

    # copy the .desktop, .protocol and MIME files to the package directory
    install -Dm644 desktop/chomikbox.desktop "${pkgdir}/usr/share/applications/chomikbox.desktop"

    #install -Dm644 desktop/chomikbox.musicfile.desktop "${pkgdir}/usr/share/applications/chomikbox-musicfile.desktop"
    #install -Dm644 desktop/chomikbox.uploader.desktop "${pkgdir}/usr/share/applications/chomikbox-uploader.desktop"

    install -Dm644 desktop/chomikbox.action.desktop "${pkgdir}/usr/share/applications/chomikbox-action.desktop"
    install -Dm644 desktop/chomikbox.action.musicfile.desktop "${pkgdir}/usr/share/applications/chomikbox-action-musicfile.desktop"

    install -Dm644 desktop/proto.chomik.mime "${pkgdir}/usr/share/mime/packages/chomikbox.xml"

    # copy the icons to the package directory
    install -Dm644 ../chomikbox.png "${pkgdir}/usr/share/pixmaps/chomikbox.png"
    install -Dm644 ../chomikbox-music-light.png "${pkgdir}/usr/share/pixmaps/chomikbox-music-light.png"

    # make a symlink to the executable
    ln -s /usr/share/chomikbox/chomikbox "${pkgdir}/usr/bin/chomikbox"
}
