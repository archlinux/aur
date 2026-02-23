pkgname=lib32-romcheckfail-bin
provides=('romcheckfail')
arch=('x86_64')
pkgdesc='Carefully place a dozen arcade classics in a large mixing bowl. Add a dash of awesomesauce, cover the bowl, and allow the ingredients to ferment over three weeks. Uncover in a well ventilated area, then mash until loud and glitchy. Serve over the internet.'
pkgver=1.0
pkgrel=2
license=('custom:romcheckfail_eula')
depends=('lib32-sdl_mixer' 'lib32-sdl=1.2.15' 'lib32-libogg' 'lib32-libvorbis')
makedepends=('libarchive')
source=(
    "RomCheckFail.sh::https://web.archive.org/web/20210128143934if_/https://games.lastchancemedia.com/farbs/RomCheckFail.sh"
    "RomCheckFail.desktop"
)
sha256sums=('ae2b94bde8941728cc670890ccfc6dc2fd6ee6b41a9e05fffb0dd6eec5b09e85' 'SKIP')
options=(!debug !strip)

build() {
    cd "$srcdir"
    echo "-- Extracting nixstaller data:"
    sh RomCheckFail.sh --noexec --target RomCheckFail_installer
    mkdir -p binaries
    echo "-- Extracting instarchive..."
    bsdtar xf RomCheckFail_installer/instarchive_all -C binaries
    cd "$srcdir/binaries/RomCheckFail"
    echo "-- Removing unneeded libraries so that system versions are used"
    rm lib/lib{vorbisfile,vorbis,SDL-1.2,ogg}.so*
}

package() {
    mkdir -p "$pkgdir/opt/romcheckfail"
    cp -r "$srcdir/binaries/RomCheckFail/." "$pkgdir/opt/romcheckfail/"
    install -Dm644 "$srcdir/binaries/RomCheckFail/license" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "$srcdir/binaries/RomCheckFail/bin/Farbs.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/RomCheckFail.png"
    install -Dm644 "$srcdir/RomCheckFail.desktop" "$pkgdir/usr/share/applications/RomCheckFail.desktop"
}
