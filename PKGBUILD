# Maintainer: Eduard Wirch <wirch.eduard@gmail.com>
# Contributor: Louis des Landes <aur@psykar.com>

pkgname=deepgit
pkgver=4.3.1
pkgrel=1
pkgdesc="A tool to investigate the history of source code."
arch=('any')
url="http://www.syntevo.com/deepgit/"
license=('custom')
depends=(
    'java-environment>=8'
    'hicolor-icon-theme'
)

source=(
    "https://www.syntevo.com/downloads/$pkgname/$pkgname-linux-${pkgver//./_}.tar.gz"
    "deepgit.desktop"
    "deepgit.sh.patch"
)
sha1sums=(
    59a966ce8ef2e92999007058f8b3f059e750e0e4
    6ccc4f2b8967ec27621bdc8a730a51da5a6125c6
    126df6100e0e5251abaee147da9c1631d844de68
)


package() {
    cd "${srcdir}"
    # Copy ./lib to /usr/share/java/$pkgname/
    install -m 644 -Dt "$pkgdir/usr/share/java/$pkgname/lib/" "${srcdir}/${pkgname}/lib/"*

    # Add executable to /usr/bin
    install -T -Dm 755 "$srcdir/$pkgname/bin/deepgit.sh" "${pkgdir}/usr/bin/deepgit"
    patch --quiet "${pkgdir}/usr/bin/deepgit" <"deepgit.sh.patch"

    # Copy license
    # /usr/share/licenses/$pkgname/LICENSE
    install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "${srcdir}/${pkgname}/licenses/"*
    install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname/license.html" 

    # Desktop file
    install -Dm 644 -t "${pkgdir}/usr/share/applications/" deepgit.desktop 

    # Copy other stuff to /usr/share/$pkgname/
    cd $srcdir/${pkgname}
    install -m 644 -Dt "$pkgdir/usr/share/$pkgname" changelog.txt known-issues.txt readme-linux.txt

    # Install some icons
    cd "${srcdir}/${pkgname}/bin"
    for size in 32 48 64 128 256
    do
        install -Dm 644 -T "deepgit-${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/deepgit.png"
    done
}
