# Maintainer: Oystein Sture <oysstu ät gmail dõt cóm>
# Contributor:

pkgname=gog-vampire-the-masquerade-bloodlines
_gogver=1.2_up10
_gogrel=22135
_gamename=${pkgname#gog-}
_gamename=${_gamename//-/_}

pkgver=${_gogver}_${_gogrel}
pkgrel=1
pkgdesc='Vampire®: The Masquerade - Bloodlines™. GOG version (Wine).'
arch=('x86_64')
url='https://www.gog.com/game/jazz_jackrabbit_2_collection'
license=('custom')

depends=('wine')
makedepends=('innoextract' 'unzip')

source=(
    "file://setup_vampire_the_masquerade_-_bloodlines_1.2_(up_10.0)_(${_gogrel}).exe"
    "file://setup_vampire_the_masquerade_-_bloodlines_1.2_(up_10.0)_(${_gogrel})-1.bin"
    "file://vampire-the-masquerade-bloodlines.bash"
    "file://vampire-the-masquerade-bloodlines.desktop"
)

sha256sums=(
    "660687df598d03866011e103680030e8c29aa165d9088fa05aae7c90f28bdf5b"
    "b69f90787295c8780973ea3bf599b1089ac09b4bcd97a622fc89bbffeb65685d"
    "83dc8c11b71e060824061fca50523542af9735a115318689f3fb9cae22bf05cc"
    "af3096274bd636907b9a588d5ecadc102c72a36da4040958833183da54100d43"
)

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare() {
    cd "${srcdir}"
    innoextract -c -m -s --progress=1 "setup_vampire_the_masquerade_-_bloodlines_1.2_(up_10.0)_(${_gogrel}).exe"
    unzip "app/webcache.zip" "333aae3c07b0beee2653175bd76cfc74e719b184d04bb15477196c558c6c07cb.png"
    
    # Remove unneeded files
    rm -rf "__redist"
    rm "setup_vampire_the_masquerade_-_bloodlines_1.2_(up_10.0)_(22135).exe"
    rm "setup_vampire_the_masquerade_-_bloodlines_1.2_(up_10.0)_(22135)-1.bin"
}

package() {
    msg2 'Packaging game icon'
    install -Dm644 -T "${srcdir}/333aae3c07b0beee2653175bd76cfc74e719b184d04bb15477196c558c6c07cb.png" "${pkgdir}/usr/share/pixmaps/${pkgname#gog-}.png"
    
    msg2 'Packaging license'
    install -Dm644 "${srcdir}/Docs/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    msg2 'Packaging launcher'
    install -Dm755 -T "${srcdir}/${pkgname#gog-}.bash" "${pkgdir}/usr/bin/${pkgname#gog-}"
    
    msg2 'Packaging desktop shortcut'
    install -Dm644 "${srcdir}/${pkgname#gog-}.desktop" "${pkgdir}/usr/share/applications/${pkgname#gog-}.desktop"

    msg2 'Packaging game data'
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mv -T "${srcdir}/" "${pkgdir}/opt/${pkgname}"
}
