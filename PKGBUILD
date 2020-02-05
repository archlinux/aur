# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>
#
# TODO: when updating $pkgver, make sure path replacements are ok

pkgname=amlite
pkgver=20171117
pkgrel=2
pkgdesc='Protocol Buffers with small code size'
arch=('i686' 'x86_64')
url='https://www.amscope.com/'
license=('custom')
source=(
    "https://www.amscope.com/software/AmScopeX/${pkgver}/${pkgname}_${pkgver}.tar"
    'amlite'
)
md5sums=(
    '955332833658f1111cfb42ad88504546'
    '523d3755ff0768d0a6cec861542813d6'
)

prepare() {
    cd "$srcdir"

    if [[ "$CARCH" == "i686" ]]; then
        installer="AmScopeAmLite.x86.run"
    elif [[ "$CARCH" == "x86_64" ]]; then
        installer="AmScopeAmLite.x64.run"
    else
        exit 1
    fi

    replacements=""
    replacements+="s#targetdir=/usr/local/AmLite#targetdir=${pkgdir}/usr/local/amlite#g;"
    replacements+="s#sudo ##g;"
    replacements+="s#/etc/udev/rules.d/99-amcam.rules#${pkgdir}/etc/udev/rules.d/99-amcam.rules#g"
    sed "${replacements}" "${installer}" > "installer.bin"
    chmod +x "installer.bin"
}

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}/usr/local/amlite/"
    mkdir -p "${pkgdir}/etc/udev/rules.d/"
    mkdir -p "${pkgdir}/usr/bin/"

    ./installer.bin
    install -Dm755 "${srcdir}/amlite" "${pkgdir}/usr/bin/"
}
