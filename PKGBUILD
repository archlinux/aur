# Maintainer:  nemesys nemstar AT zoho DOT com
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: K. Piche <kpiche@rogers.com>
# Contributor: Artiom Molchanov ar.molchanov gmail.com
pkgname=einstein
pkgver=2.0
pkgrel=5
pkgdesc="Remake of old DOS game Sherlock which was inspired by Albert Einstein's puzzle"
url="http://web.archive.org/web/20120521062745/http://games.flowix.com/en/index.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_ttf' 'sdl_mixer' 'xorg-server')
makedepends=('sharutils' 'ttf-dejavu')
changelog=ChangeLog
source=("http://old-releases.ubuntu.com/ubuntu/pool/universe/e/${pkgname}/${pkgname}_${pkgver}.dfsg.2.orig.tar.gz" 
        "http://old-releases.ubuntu.com/ubuntu/pool/universe/e/${pkgname}/${pkgname}_${pkgver}.dfsg.2-5.diff.gz"
        "${pkgname}.png"
        "arch.patch")
md5sums=('d47d4ae80478d4d8d5796e65d134124f'
         '11291eeee59b2a999196e1dba2efaa65'
         '81b58f2e3c61c0b50716992a30f2d4cc'
         '68c261ccda52b9978ed030a240ef91ea')

prepare() {
    patch -p0 < arch.patch

    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 <  ../einstein_2.0.dfsg.2-5.diff
    patch -p0 <  debian/patches/01_sdl.diff
    patch -p0 <  debian/patches/02_prefix.diff
    patch -p0 <  debian/patches/03_fonts.diff
    patch -p0 <  debian/patches/04_fame.diff
    patch -p0 <  debian/patches/05_icon.diff
    patch -p0 <  debian/patches/06_srand.diff
    patch -p0 <  debian/patches/07_long.diff
    patch -p0 <  debian/patches/08_gcc43.diff
    patch -p0 <  debian/patches/09_colors.diff
    patch -p0 <  debian/patches/10_gcc43.diff

    uudecode debian/einstein.png.uue
    uudecode debian/icon.bmp.uue
    [ -f res/DejaVuSans.ttf ] || cp -p /usr/share/fonts/TTF/DejaVuSans.ttf res/
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX="${pkgdir}/usr" install

    install -Dm 644 "debian/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

