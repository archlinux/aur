# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: jospehgbr <rafael.f.f1@gmail.com>
# Contributor: Adam <adam900710@gmail.com>

pkgname=lib32-libass
pkgver=0.17.1
pkgrel=1
pkgdesc='A portable library for SSA/ASS subtitles rendering (32 bit)'
arch=(x86_64)
url=https://github.com/libass/libass/
license=(BSD)
depends=(lib32-fontconfig lib32-freetype2 lib32-fribidi lib32-glib2 lib32-glibc lib32-harfbuzz libass)
makedepends=(git nasm)
_tag=915599d88e951e34079383cf926d2731bb45cea1
source=(git+https://github.com/libass/libass.git?signed#tag=${_tag})
validpgpkeys=(5458C3100671F252B0F4C7708079D18C21AAAAFF  # Oleg Oshmyan (Chortos-2) <chortos@inbox.lv>
              5EE63F2A71BF132CFE3567E1DFFE615F2824C720) # Oneric <oneric@oneric.de>
b2sums=(SKIP)

prepare() {
    cd libass

    ./autogen.sh
}

pkgver() {
    cd libass

    git describe --tags
}

build() {
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    export CC='gcc -m32'

    cd libass

    ./configure \
        --prefix='/usr' \
        --libdir='/usr/lib32' \
        --host=i686-linux-gnu \
        --enable-harfbuzz \
        --enable-fontconfig
    make
}

package() {
    cd libass

    make DESTDIR="${pkgdir}" install

    install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    rm -rf "${pkgdir}"/usr/include
}
