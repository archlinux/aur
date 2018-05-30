# Maintainer: Emile Boutet-Livoff <emilelivoff@gmail.com>

pkgname=lix-ereader
pkgver=1.0.19
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
md5sums=("b4d3bac9ce3e948b8caed6b6970363a4")

prepare() {
    cd "${srcdir}"

    # Remove libraries, they are dependencies
    rm -r usr/lib

    # Desktop Entry
	patch -uN lix.desktop ../lix.desktop.patch || return 1
    mkdir -p usr/share/applications
    mv lix.desktop usr/share/applications

    # Move the main chunk of it into opt
    mkdir -p opt/lix
    mv usr/bin/* opt/lix

    # Add a symlink for the executable
    ln -s /opt/lix/lix usr/bin/lix

    # Make the usr/share/icons have the world executable bit set
    chmod -R a+xr usr/share/icons
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"
    cp -rp opt "${pkgdir}/opt"
}
