# Maintainer: Christoph Korn <christoph.korn at posteo dot de>
pkgname=chatty
pkgver=0.8.7
pkgrel=8
pkgdesc='Twitch Chat Client for Desktop'
arch=('any')
url='https://chatty.github.io/'
license=('MIT')
depends=('java-environment' 'sh')
optdepends=('streamlink: for watching streams in a custom video player.'
            'livestreamer: for watching streams in a custom video player.')
makedepends=('apache-ant' 'java-environment>=8')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/chatty/chatty/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}_script"
        'config_dir.patch'
        'manifest.patch'
        'disable_version_check.patch'
        'build.patch')
sha512sums=('de772c4403f82cd66283eb340bce2cb62d5a7fd946cdfc46fbab9e3ec0858c3b8e08b5ec8db93efcb57a46f5b4422358a257069a260373228fa23b99d7dce5f1'
            '6b18009b4e34a2255cec42fd1e136e437aa528c80c40d9f1ab7379ab9e4a637fbd64860fb51e7e57aa0c74165b42f8d4c1ed6a1ffd061d07a02af1ec5167145e'
            'a2e3e61195c3bd9bb56ee7772a505e355d324cf86edfd41b0d92f261b77097eecf616e071c5cfed8bee7b4f779a5f1e126f9c8c2082a866e7a2e4bc4e4c0469c'
            '5d56ac61a14342e5ea98e6d793d0455fbdf1f5ca5ac503ace5672b6a4182416051d39cfeea719152e907bbd16cb886b8edf2960914bd88f5f818094ec5388ebc'
            '41aeb54f5705d5d612f779365a51b4df156b9ad8a6a282c271bf4d03f280ea7fe0470f2169896b6ef430d04f0f6bb5bcf16b2d6a0edaf2fc86847270e7179b91'
            '69d8e2deec3feef312a04e5e4a6080d7aaad63cbd93d43eda8f1958ebbe65e79d38c6a65e3143669a37fb4af50a5960dfe7793ee9dce6b726096608f301a2fdf'
            '3beb726fecfd7855be4fac50d4926bbcc8a44d0d1f43402443223cc90a743ba81968844a530fa37f38115fdf526bf05a60a331be862a3f452e909a2f5cb26ae7')

prepare() {
  cd "chatty-${pkgver}"
  patch -p1 -i "${srcdir}/build.patch"
  patch -p1 -i "${srcdir}/config_dir.patch"
  patch -p1 -i "${srcdir}/disable_version_check.patch"
  patch -p1 -i "${srcdir}/manifest.patch"
}

build() {
  cd "chatty-${pkgver}"
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk ant
}

package(){
  install -Dm644 "${srcdir}/chatty-${pkgver}/dist/${pkgname}.jar" "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"
  cp -a "${srcdir}/chatty-${pkgver}/assets" "${pkgdir}/usr/share/${pkgname}/"

  install -Dm755 "${srcdir}/${pkgname}_script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/chatty-${pkgver}/src/chatty/gui/app_16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/chatty-${pkgver}/src/chatty/gui/app_64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "${srcdir}/chatty-${pkgver}/APACHE_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/APACHE_LICENSE"
  install -Dm644 "${srcdir}/chatty-${pkgver}/LGPL" "${pkgdir}/usr/share/licenses/${pkgname}/LGPL"
  install -Dm644 "${srcdir}/chatty-${pkgver}/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}

