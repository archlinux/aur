# Maintainer : Zach Hoffman <zach@zrhoffman.net>
# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Michał Górny <zrchos+arch@gmail.com>
# Contributor: Ryan Lee <ryan@swyro.com>
# Contributor: Daniel Bermond < gmail-com: danielbermond >

_player_ver=32.0
pkgname=apache-flex-sdk
pkgver=4.16.1
_srcdir="${pkgname}-${pkgver}-bin"
pkgrel=13
pkgdesc='The open-source framework for building expressive web and mobile applications'
arch=('any')
url='https://flex.apache.org/'
license=('APACHE')
depends=('bash' 'java-environment')
optdepends=('apache-flex-sdk-docs: Documentation for Apache Flex SDK'
            'adobe-air-sdk: for compiling flex projects into AIR apps'
            'flashplayer-standalone-debug: for debugging SWFs'
            'flashplugin-debug: for debugging SWFs in-browser'
  )
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("https://downloads.apache.org/flex/${pkgver}/binaries/apache-flex-sdk-${pkgver}-bin.tar.gz"{,.md5}
        "playerglobal.swc::https://fpdownload.macromedia.com/get/flashplayer/updaters/32/playerglobal${_player_ver/./_}.swc"
        '27.0-to-32.0.patch'
        '27.0-to-32.0-frameworks.patch'
        'apache-flex-sdk.sh')
noextract=('playerglobal.swc')
sha256sums=('17fda7ac8d3e476cad3127f345455ef316acfb87c6f4322e5897bd8d9b09388e' 'SKIP'
            '7d4d6168d27603cfb3b750302448e354e0bbc1bdd58f5d101c3dcf6891e9bb65'
            '6eb5c8842b109bebe3a87c4400b24131c00b6437eba7204a123174a3b1acca0c'
            '53eace428741c38097b2824e3ebe7f6d7a1e139128a20bbb50098551daebc6e1'
            '13a4d4a11e44023f52ae9f3ac984065054604ebe6b1f2e3e69897f723d5fbd5d')

package() {
    # remove windows files
    rm "${_srcdir}/"{bin,ide}/*.bat

    (
    cd "$_srcdir"
    patch -i "${srcdir}/27.0-to-32.0.patch" # Update default version from 27.0 to 32.0
    cd frameworks
    patch -i "${srcdir}/27.0-to-32.0-frameworks.patch"
    )

    install -d "${pkgdir}/opt"
    
    # sdk files
    cp -dr --no-preserve='ownership' "$_srcdir" "${pkgdir}/opt/${pkgname}"
    
    # player
    install -D -m644 "${srcdir}/playerglobal.swc" "${pkgdir}/opt/${pkgname}/player/${_player_ver}/playerglobal.swc"
    
    # set PATH
    install -D -m755 apache-flex-sdk.sh -t "${pkgdir}/etc/profile.d"
}
