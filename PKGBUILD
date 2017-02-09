# Maintainer:  Ainola
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Xyne
# Contributor: Rick Chen (stuffcorpse)
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Camille Moncelier <pix@devlife.org>

pkgname=nexuiz
pkgver=2.5.2
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="Fast-paced multiplayer first-person shooter."
url="http://www.alientrap.org/nexuiz/"
license=("GPL2")
depends=('alsa-lib' 'libjpeg>=8' 'libxpm' 'libxxf86dga' 'libxxf86vm' 'hicolor-icon-theme' 'sdl')
makedepends=('mesa')
conflicts=('nexuiz-data')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver//./}.zip" \
        "nexuiz-glx.desktop" "nexuiz-sdl.desktop" \
        "libpng14.patch" "nex-icons.tar.gz")
sha256sums=('a5e27ebcc9775c4a490d0d3536c32e4a8f8f96b038c0b6a78d1823c37a962000'
            '277ace303189dc25403a1a7c03b66d033e6aed52c98adb4ecfb5f627b101fff3'
            '50ad2bf51a291635d7d3195745f9536b7182c0ed548259c0a8627ea951e3da7f'
            '327c45a56faa1963fa08a590694fd0c23bed448282f9473c2d483447df9a6e1f'
            '25e478b783bb7f8cff04b7c3e538a82e8ab852d72930277e83d00777d2a7186e')
# Prevent compressing final package
PKGEXT='.pkg.tar'

build(){
    cd "${srcdir}/Nexuiz"
    bsdtar -x -f "sources/enginesource20091001.zip"
    cd darkplaces
    patch -Np1 -i "${srcdir}/libpng14.patch"

    #build the binaries separately instead to avoid truncated files
    make CPUOPTIMIZATIONS="$CFLAGS" DP_FS_BASEDIR=/usr/share/nexuiz/ DP_LINK_TO_LIBJPEG=1 cl-nexuiz
    make CPUOPTIMIZATIONS="$CFLAGS" DP_FS_BASEDIR=/usr/share/nexuiz/ DP_LINK_TO_LIBJPEG=1 sdl-nexuiz
    make CPUOPTIMIZATIONS="$CFLAGS" DP_FS_BASEDIR=/usr/share/nexuiz/ DP_LINK_TO_LIBJPEG=1 sv-nexuiz
}

package(){
    install -Dm755 "Nexuiz/darkplaces/nexuiz-dedicated" "${pkgdir}/usr/bin/nexuiz-dedicated"
    install -Dm755 "Nexuiz/darkplaces/nexuiz-glx" "${pkgdir}/usr/bin/nexuiz-glx"
    install -Dm755 "Nexuiz/darkplaces/nexuiz-sdl" "${pkgdir}/usr/bin/nexuiz-sdl"
    install -Dm644 "${srcdir}/"*.desktop -t "${pkgdir}/usr/share/applications"

    #docs
    install -dm755 "${pkgdir}/usr/share/doc/nexuiz/"
    mv "${srcdir}/Nexuiz/Docs/"* "${pkgdir}/usr/share/doc/nexuiz/"
    find "${pkgdir}/usr/share/doc/nexuiz" -type d -exec chmod 755 {} \;
    find "${pkgdir}/usr/share/doc/nexuiz" -type f -exec chmod 644 {} \;

    #install game data, then set proper permissions
    install -dm755 "${pkgdir}/usr/share/nexuiz"
    for dir in data havoc server; do
        mv "${srcdir}/Nexuiz/${dir}" "${pkgdir}/usr/share/nexuiz/"
        find "${pkgdir}/usr/share/nexuiz/${dir}" -type d -exec chmod 755 {} \;
        find "${pkgdir}/usr/share/nexuiz/${dir}" -type f -exec chmod 644 {} \;
    done

    #remove unneeded cruft
    find "${pkgdir}/usr/share/nexuiz/server" -name "*_windows.bat" -exec rm {} \;
    find "${pkgdir}/usr/share/nexuiz/server" -name "*_mac.sh" -exec rm {} \;

    #icons
    for size in 16 22 24 32 48 64 128 256 512; do
        install -Dm644 "${srcdir}/nex${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/nexuiz.png"
    done
}
