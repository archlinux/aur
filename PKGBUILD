# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>
# Contributor: eworm

pkgname=opera
pkgver=72.0.3815.400
pkgrel=3
pkgdesc="A fast and secure web browser"
url="https://www.opera.com/"
options=(!strip !zipman)
license=('custom:opera')
backup=("etc/$pkgname/default")
arch=('x86_64')
depends=('gtk3' 'alsa-lib' 'libnotify' 'curl' 'nss' 'libcups' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
optdepends=(
    'opera-ffmpeg-codecs: playback of proprietary video/audio'
    'pepper-flash: flash support'
    'upower: opera battery save'
    'chromium-widevine: support playback of drm content (AUR!)'
)
source=(
    "https://get.geo.opera.com/pub/${pkgname}/desktop/${pkgver}/linux/${pkgname}-stable_${pkgver}_amd64.deb"
    "opera"
    "default"
    'eula.html'
    'terms.html'
    'privacy.html'
)
sha512sums=('d24e8eaf0035ad27631194d52cc98fb60a9871730fda7dbc2da9ff95ee2d7eba7c18743a203d3f7dc10fa5621d676d4957d1d48ec90893210035aa61d80acdeb'
            '7e854e4c972785b8941f60117fbe4b88baeb8d7ca845ef2e10e8064043411da73821ba1ab0068df61e902f242a3ce355b51ffa9eab5397ff3ae3b5defd1be496'
            'ddb1773877fcfd7d9674e63263a80f9dd5a3ba414cda4cc6c411c88d49c1d5175eede66d9362558ddd53c928c723101e4e110479ae88b8aec4d2366ec179297f'
            'c359079544360c9c12acd222e3e31dbf4d42b7da4388393a16d7acafa4b99f66f52a3f632afaf5ac3cb5f60f78e1184e6f89a86e6f831ef9e19a65f5cab342a5'
            '59ddb12dd7bf771f1065d5678b62a70d4f8562066fe863add00f96e5339308e6cb658a19de3475aa96cf9f9b52b73f2a7b3e2053de0aa03457b58ab1efc8cf69'
            '329f2244fb290103b8548b76b4b6fd228b93252c3cedf6377089eecb6da998f679bbb5cbcae23a3f4cbdc8f68b18c060d90617ea7baa48af414edf7d0cfbadf3')

prepare() {
    sed -e "s/%pkgname%/$pkgname/g" -i "$srcdir/opera"
    sed -e "s/%operabin%/$pkgname\/$pkgname/g" \
        -i "$srcdir/opera"

}

package() {
    tar -xf data.tar.xz --exclude=usr/share/{lintian,menu} -C "$pkgdir/"

    # get rid of the extra subfolder {i386,x86_64}-linux-gnu
    (
        cd "$pkgdir/usr/lib/"*-linux-gnu/
        mv "$pkgname" ../
    )
    rm -rf "$pkgdir/usr/lib/"*-linux-gnu

    # suid opera_sandbox
    chmod 4755 "$pkgdir/usr/lib/$pkgname/opera_sandbox"

    # add extra WidevineCdm location
    sed -e '/\[/a\ \ "/usr/lib/chromium/WidevineCdm",' \
        -i "$pkgdir/usr/lib/opera/resources/widevine_config.json"

    # install default options
    install -Dm644 "$srcdir/default" "$pkgdir/etc/$pkgname/default"

    # install opera wrapper
    rm "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/opera" "$pkgdir/usr/bin/$pkgname"

    # license
    install -Dm644 \
        "$pkgdir/usr/share/doc/${pkgname}-stable/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/copyright"

    # eula
    install -Dm644 \
        "$srcdir/eula.html" \
        "$pkgdir/usr/share/licenses/$pkgname/eula.html"

    # terms
    install -Dm644 \
        "$srcdir/terms.html" \
        "$pkgdir/usr/share/licenses/$pkgname/terms.html"

    # privacy
    install -Dm644 \
        "$srcdir/privacy.html" \
        "$pkgdir/usr/share/licenses/$pkgname/privacy.html"
}

