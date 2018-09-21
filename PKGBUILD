# Maintainer: Emile Boutet-Livoff <emilelivoff@gmail.com>

pkgname=lix-ereader
pkgver=1.0.21
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
source=("https://download.lix.com/linux/latest")
md5sums=("7b090d0d71edaa4cf7f09025d7caec96")

prepare() {
    cd "${srcdir}"

    # Remove libraries, they are dependencies
    rm -r usr/lib

    # Desktop Entry
    patch -uN lix.desktop ../lix.desktop.patch || return 1
    mkdir -p usr/share/applications
    mv lix.desktop usr/share/applications/lix-ereader.desktop

    # Move the main chunk of it into opt
    mkdir -p opt/lix-ereader
    mv usr/bin/* opt/lix-ereader

    # Add a symlink for the executable
    ln -s /opt/lix-ereader/lix usr/bin/lix-ereader

    # Make the usr/share/icons have the world executable bit set
    chmod -R a+xr usr/share/icons
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"
    cp -rp opt "${pkgdir}/opt"
}
