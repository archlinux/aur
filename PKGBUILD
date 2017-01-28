# Maintainer: Patrice Peterson <runiq@archlinux.us>
# Thanks to: Ainola for the base PKGBUILD (gog-undertale)

pkgname="crawl-hib"
_pkgname="crawl"
__pkgname="Crawl"
pkgver=0.12.04
pkgrel=1
pkgdesc="The dungeon crawler where your friends control the monsters"
url="http://www.powerhoof.com/crawl"
license=('custom')
arch=('i686' 'x86_64')
groups=('games')
case $CARCH in
	"i686")
		_arch=x86
		;;
	"x86_64")
		_arch=$CARCH
		;;
esac
# If Firejail is installed, this application will be sandboxed automatically.
optdepends=('firejail: Automatically sandbox this application from your OS')
source=(
    "hib://${_pkgname}-${pkgver//./-}-linux.tar.gz"
    "${pkgname}.desktop"
    "$pkgname")
sha256sums=('935ad1c5a24ae0e9a633c9c2eb935d18ba774f47ede43b152399332f2190c86b'
            '73285ec023bd5b8978130252c3b94b3d5075b6e439ac9553430bbb64e6f329f6'
            '8a0526fd065a16081e76aed1fe89ae1e5c3f8fe2c078f9f598b30a62a0cf0c27')

DLAGENTS+=("hib::/usr/bin/echo %u Download the HIB file to \"$PWD\" or set up a hib:// DLAGENT.")

# Prevent compressing final package
PKGEXT=".pkg.tar"

package(){
    cd "${srcdir}"

    # Install game
    install -d "${pkgdir}/opt/${pkgname}/"
    install -d "${pkgdir}/usr/bin/"
    cp -r Crawl_Data "${pkgdir}/opt/${pkgname}/"
    cp ${__pkgname}.${_arch} "${pkgdir}/opt/${pkgname}/"
    # Arch-independent link
    ln -rs "${pkgdir}/opt/${pkgname}/${__pkgname}.${_arch}" "${pkgdir}/opt/${pkgname}/${__pkgname}"
    

    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;

    # Desktop integration
    install -Dm 644 "Crawl_Data/Resources/UnityPlayer.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
