# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatstudio-bin
pkgver=2026.2
pkgrel=3
epoch=1
pkgdesc='GNAT Programming Studio for Ada binary'

arch=(x86_64)
url='https://github.com/AdaCore/gnatstudio'
license=(GPL3)

depends=(python
         adwaita-icon-theme-legacy)
conflicts=(gnatstudio
           gnatstudio-appimage)

options=(!strip)

_srcdir="gnatstudio-2026.2-20260409-x86_64-linux-bin"

source=(https://github.com/AdaCore/gnatstudio/releases/download/gnatstudio-2026.2-20260409/$_srcdir.tar.gz
        COPYING3)

sha256sums=(4017aa6698253732dbb611d1f784846a3fd508ae74bd0979b5e50f0207402fb7
            8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903)


package() {
    cd "$srcdir/$_srcdir"

    ./doinstall "$pkgdir/opt/gnatstudio"


    # Install missing AdwaitaLegacy icons.
    #
    local _icon_base="$pkgdir/opt/gnatstudio/share/icons/AdwaitaLegacy"
    local _sizes=(16x16 22x22 24x24 32x32 48x48)
    local _categories=(legacy status)

    for _size in "${_sizes[@]}"; do
        for _cat in "${_categories[@]}"; do
            install -Dm644 \
                "/usr/share/icons/AdwaitaLegacy/$_size/$_cat/image-missing.png" \
                "$_icon_base/$_size/$_cat/image-missing.png"
        done
    done


    # Regenerate the GDK loaders pixbuf cache.
    #
    GDK_PIXBUF_MODULEDIR=/opt/gnatstudio/lib/gnatstudio/gdk-pixbuf-2.0/2.10.0/loaders \
    gdk-pixbuf-query-loaders > $pkgdir/opt/gnatstudio/lib/gnatstudio/gdk-pixbuf-2.0/2.10.0/loaders.cache
    

    # Install the license.
    #
    install -Dm644 "$srcdir/COPYING3" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING3"
}
