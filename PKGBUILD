# Maintainer: Moviuro <moviuro+aur at gmail dot com>

_pkgname=Rocketbirds
pkgname="${_pkgname,,}-hib"
pkgver=20130917
pkgrel=1
pkgdesc="Annihilate an evil penguin regime in this cinematic platform adventure game offering full solo and co-op campaigns with anaglyph 3D support."
arch=("i686" "x86_64")
url="http://www.rocketbirds.com"
license=("custom:commercial")
# Note that the HIB file contains all libs but lib32-alsa-plugins, but we choose
# to not use them here
depends=("lib32-alsa-plugins" "lib32-sdl2" "lib32-nvidia-cg-toolkit"
         "lib32-libbass")
#depends=("lib32-alsa-plugins")
source=("hib://${_pkgname}${pkgver}.sh")
noextract=("${_pkgname}${pkgver}.sh")
sha256sums=("52f2a8f6e028b21aa91471dca12fa691775107d53ffd16d5269f70deb02e457e")

# Disable compression of the package
PKGEXT='.pkg.tar'

prepare() {
    # bsdtar can't make out the file, so we help a bit
    echo "Extracting game binary"
    tail -n +521 "${_pkgname}${pkgver}.sh" |
      bsdtar xOf - instarchive_linux_all |
      bsdtar xf  - -C "${srcdir}" rocketbirds.bin.x86
    echo "Extracting game files"
    tail -n +521 "${_pkgname}${pkgver}.sh" |
      bsdtar xOf - instarchive_all |
      bsdtar xf  - -C "${srcdir}"
    echo "Extracting LICENSE"
    tail -n +521 "${_pkgname}${pkgver}.sh" |
      bsdtar xOf - subarch |
      bsdtar xf  - -C "${srcdir}" config/license

    # Should we choose to use the bundled libs...
    #tail -n +521 "${_pkgname}${pkgver}.sh" |
    #  bsdtar xOf - instarchive_linux_all |
    #  bsdtar xf  - lib -C "${srcdir}"
}

package() {
    # Data
    mkdir -p "$pkgdir/opt/$pkgname"
    # Hardlink files to save the disk space and time spent copying them (they are large)
    cp -Ral -t "$pkgdir/opt/$pkgname" "$srcdir/Data" "$srcdir/Rocketbirds.png" "$srcdir/rocketbirds.bin.x86"
    #cp -Ral -t "$pkgdir/opt/$pkgname" "$srcdir/lib"
    find "$pkgdir/opt/$pkgname" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname" -type f -print0 | xargs -0 chmod 644

    # Binaries
    chmod +x "$pkgdir/opt/$pkgname/rocketbirds.bin.x86"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/rocketbirds.bin.x86" "$pkgdir/usr/bin/$pkgname"

    # License
    install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
    cp "${srcdir}/config/license" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Icon
    install -m755 -d "$pkgdir/usr/share/pixmaps/"
    ln -s "/opt/$pkgname/Rocketbirds.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
