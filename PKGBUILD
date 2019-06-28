# Maintainer: Oystein Sture <oysstu ät gmail dõt cóm>
# Contributor:

pkgname=gog-vampire-the-masquerade-bloodlines
_gogver=1.2
_gogup=10.2
_gogrel=28160
_gamename=${pkgname#gog-}
_gamename=${_gamename//-/_}
_iconname=333aae3c07b0beee2653175bd76cfc74e719b184d04bb15477196c558c6c07cb.png

pkgver=${_gogver}_up${_gogup}_${_gogrel}
pkgrel=1
epoch=1
pkgdesc='Vampire®: The Masquerade - Bloodlines™. GOG version (Wine).'
arch=('x86_64')
url='https://www.gog.com/game/vampire_the_masquerade_bloodlines'
license=('custom')

depends=('wine')
makedepends=('innoextract' 'unzip')

source=(
    "file://setup_vampire_the_masquerade_-_bloodlines_1.2_(up_${_gogup})_(${_gogrel}).exe"
    "file://setup_vampire_the_masquerade_-_bloodlines_1.2_(up_${_gogup})_(${_gogrel})-1.bin"
    "file://vampire-the-masquerade-bloodlines.bash"
    "file://vampire-the-masquerade-bloodlines.desktop"
)

sha256sums=(
    "ecfaa084616cf90dec39a80c772556006bedeb5a9a9eee2e7a56521f8bedf130"
    "e4c7375aa688ea441a43ee879707aa594bea83587ceda200fa4e9ff1912b993a"
    "71df164eddfdfca2f08e5765597a59d8e550c58e132ca188886a9841a7e9eec1"
    "af3096274bd636907b9a588d5ecadc102c72a36da4040958833183da54100d43"
)

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare() {
    cd "${srcdir}"
    innoextract -c -m -s --progress=1 "setup_vampire_the_masquerade_-_bloodlines_1.2_(up_${_gogup})_(${_gogrel}).exe"
    unzip "app/webcache.zip" "${_iconname}"
    
    # Remove unneeded files
    rm -rf "__redist"
    rm "setup_vampire_the_masquerade_-_bloodlines_1.2_(up_${_gogup})_(${_gogrel}).exe"
    rm "setup_vampire_the_masquerade_-_bloodlines_1.2_(up_${_gogup})_(${_gogrel})-1.bin"
}

package() {
    msg2 'Packaging game icon'
    install -Dm644 -T "${srcdir}/${_iconname}" "${pkgdir}/usr/share/pixmaps/${pkgname#gog-}.png"
    
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
