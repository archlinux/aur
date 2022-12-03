# Maintainer: LAVALLADE Vladimir <erus.iluvatar+archlinux@gmail.com>
# Contributor: Axper Jan <483ken 4t gmail d0t com>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
pkgname=2h4u
pkgver=1.3
pkgrel=7
pkgdesc="A mix between a Tetris-like game and a wall breaker"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/toohardforyou/"
license=('GPL')
depends=('sdl_ttf' 'sdl_mixer' 'sdl_image')
makedepends=('ffmpeg')
source=("http://downloads.sourceforge.net/project/toohardforyou/2H4U/2H4U%20v1.3/2H4U-1.3_SOURCES.tar.gz"
        "2h4u.desktop")
sha256sums=('2da1e593b43887617c78d2709397be2e57e9f67b1840350430d802d31b18e9f2'
            'c87774ef50aaa6c561ab6e6d2a587d4fd7da20afa5a0a21b3d818dbeac43a778')

prepare() {
	# patch the sound handling to refer to an OGG file instead of an MP3
        sed -i "s/mp3/ogg/g" ${srcdir}/2H4U/sources/son.cpp
	# use ffmpeg to convert the provided MP3 audio to an OGG file, since the SDL does not seem to handle the provided file anymore
        cd ${srcdir}/2H4U/data/sons/
        ffmpeg -i Musique.mp3 -c:a libvorbis -q:a 4 Musique.ogg
        rm Musique.mp3
}

build() {
        cd ${srcdir}/2H4U/scripts
        make
}

package() {
        mkdir -p ${pkgdir}/usr/share/2h4u
        mkdir -p ${pkgdir}/usr/share/applications
        cd $srcdir/2H4U
        cp -r  2H4U aide data help  ${pkgdir}/usr/share/2h4u
        mkdir -p ${pkgdir}/usr/bin
        echo -e "#!/bin/sh\ncd /usr/share/2h4u\n./2H4U" > ${pkgdir}/usr/bin/2h4u
        chmod a+x ${pkgdir}/usr/bin/2h4u
        cp ${srcdir}/2h4u.desktop ${pkgdir}/usr/share/applications
}
