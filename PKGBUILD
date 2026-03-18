# vim:set ft=sh:
# Maintainer: Refreeze5911
# Maintainer: XSilverTH <XSilverTH AT proton DOT me>
# Maintainer: Shadowphoenix <allescool85 AT gmail DOT com>
# Contributor: Carlinix <rcarlini DOT aur AT gmail DOT com>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>
# Contributor: eworm

pkgname=opera
pkgver=129.0.5823.15
pkgrel=1
pkgdesc="A fast and secure web browser"
url="https://www.opera.com/"
options=(!strip !zipman)
license=('custom:opera')
backup=("etc/$pkgname/default")
arch=('x86_64')
depends=('gtk3' 'alsa-lib' 'libnotify' 'curl' 'nss' 'libcups' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
optdepends=(
    'qt6-base' 'qt5-base'
    'upower: opera battery save'
)
nwjs_ffmpeg_version=0.108.0
source=(
    "https://get.geo.opera.com/ftp/pub/${pkgname}/desktop/${pkgver}/linux/${pkgname}-stable_${pkgver}_amd64.deb"
    "opera"
    "default"
    'eula.html'
    'terms.html'
    'privacy.html'
    "https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/${nwjs_ffmpeg_version}/${nwjs_ffmpeg_version}-linux-x64.zip"
)

sha512sums=('f93d288df4f4b9b11d044dffdc9603f81791a6e966c03bdbf6aaad08bf249d13c8918dfabfb7afa0b77317fbf34a16aa98fda91b61b9ec9bbb5c91790e25656c'
            '7e854e4c972785b8941f60117fbe4b88baeb8d7ca845ef2e10e8064043411da73821ba1ab0068df61e902f242a3ce355b51ffa9eab5397ff3ae3b5defd1be496'
            'ddb1773877fcfd7d9674e63263a80f9dd5a3ba414cda4cc6c411c88d49c1d5175eede66d9362558ddd53c928c723101e4e110479ae88b8aec4d2366ec179297f'
            'aaaa4435a3b6a08bf8e6ad4802afcbf111c1e8f477054251f031b70ae57ac1234fa19048121d64c878dc3b1de03522ce7ef11a263a86dc7062f643d569ecff82'
            '800d62321344ff4e3521ff20fae281cad9206bae80e60965784d144f8bf852f756cbc21f4c9d8d4e93d026da7ca10e0eda7601c83a6d8d85125831eacb907d9a'
            '43d4a066758805597527dbdfc95b4c8ad4b22c5db812b9493e50f8820c72f30c1e431bed40fdb821ab0c23a63aa31dc0e946ab708cc23ac617446964fa6b96f2'
            '4547f909a430b3bcc08838ce5f34a01519e336d0c2a0fb6d4d3811afe6aa983d7d16bc40c0a340cd04944ccc8f774e487ad7b0282ebc0fe5808f070d3148a0b0')

prepare() {
    sed -e "s/%pkgname%/$pkgname/g" -i "$srcdir/opera"
    sed -e "s/%operabin%/$pkgname-stable\/$pkgname/g" \
        -i "$srcdir/opera"

}

package() {
    tar -xf data.tar.xz --exclude=usr/share/{lintian,menu} -C "$pkgdir/"

    # get rid of the extra subfolder {i386,x86_64}-linux-gnu
    (
        cd "$pkgdir/usr/lib/"*-linux-gnu/
        mv "$pkgname-stable" ../
    )
    rm -rf "$pkgdir/usr/lib/"*-linux-gnu

    rm -f "$pkgdir/usr/lib/$pkgname-stable/libffmpeg.so"
    install -Dm755 "$srcdir/libffmpeg.so" \
        "$pkgdir/usr/lib/$pkgname-stable/libffmpeg.so"

    # suid opera_sandbox
    chmod 4755 "$pkgdir/usr/lib/$pkgname-stable/opera_sandbox"

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

