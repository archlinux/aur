# Maintainer : Zach Hoffman <zach@zrhoffman.net>
# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Michał Górny <zrchos+arch@gmail.com>
# Contributor: Ryan Lee <ryan@swyro.com>
# Contributor: Daniel Bermond < gmail-com: danielbermond >

_player_ver=32.0
pkgname=apache-flex-sdk
pkgver=4.16.1
pkgrel=9
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
        'apache-flex-sdk.sh')
noextract=('playerglobal.swc')
sha256sums=('17fda7ac8d3e476cad3127f345455ef316acfb87c6f4322e5897bd8d9b09388e' 'SKIP'
            '730653da2a766e07f310240af12cd330b91374d8e266669f16eb5bd5a8d532c7'
            '13a4d4a11e44023f52ae9f3ac984065054604ebe6b1f2e3e69897f723d5fbd5d')

package() {
    # remove windows files
    rm "${pkgname}-${pkgver}-bin/"{bin,ide}/*.bat

    install -d "${pkgdir}/opt"
    
    # sdk files
    cp -dr --no-preserve='ownership' "${pkgname}-${pkgver}-bin" "${pkgdir}/opt/${pkgname}"
    
    # player
    install -D -m644 "${srcdir}/playerglobal.swc" "${pkgdir}/opt/${pkgname}/player/${_player_ver}/playerglobal.swc"
    
    # set PATH
    install -D -m755 apache-flex-sdk.sh -t "${pkgdir}/etc/profile.d"
}
