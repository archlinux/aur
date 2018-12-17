# Maintainer: Emile Boutet-Livoff <emilelivoff@gmail.com>

pkgname=lix-ereader
pkgver=1.0.33
pkgrel=1
pkgdesc="A proprietary e-reader"
arch=('x86_64')
url='https://www.lix.com/'
license=('unknown')

#Speed up the crompressing by not compressing it
PKGEXT='.pkg.tar'

#Might depend on libappindicator-gtk2, gconf, libindicator-gtk2, libnotify
#It has it's own libnode.so and libffmpeg.so
depends=('alsa-lib' 'libxss' 'gconf' 'gtk2' 'nss' 'libxtst')
source=("https://download.lix.com/linux/Lix.AppImage")
sha256sums=("3284104160aa56a62bf09b0f609ea306cd86c0e6d9f1c31a5052d2959297c120")

prepare() {
    cd "${srcdir}"

    # Start by extracting the AppImage using the built-in extracting feature
    chmod +x ./Lix.AppImage
    ./Lix.AppImage --appimage-extract
    mv squashfs-root/* .
    rmdir squashfs-root
    # Remove AppImage, it's no longer useful
    rm Lix.AppImage

    # Remove libraries, they are dependencies
    rm -r usr/lib
    
    # Remove AppRun, it's unneeded
    rm AppRun
    # Remove lix.png it's just a symlink
    rm lix.png

    # Fix desktop Entry
    patch -uN lix.desktop ../lix.desktop.patch || return 1
    mkdir -p usr/share/applications
    mv lix.desktop usr/share/applications/lix-ereader.desktop

    # Move the main chunk of it into opt
    mkdir -p opt/lix-ereader
    # Everything except opt and usr
    mv $(ls -A | grep -v opt | grep -v usr) opt/lix-ereader

    # Add a symlink for the executable
    mkdir -p usr/bin
    ln -s /opt/lix-ereader/lix usr/bin/lix-ereader

    # Make the usr/share/icons have the world executable bit set
    chmod -R a+xr usr/share/icons
    chmod a+xr usr/ usr/share opt/lix-ereader/locales opt/lix-ereader/resources
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"
    cp -rp opt "${pkgdir}/opt"
}
