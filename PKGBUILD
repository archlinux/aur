# Maintainer: Caleb Johnson <me@calebj.io>
_pkgname=pcgen
pkgname=${_pkgname}-git
provides=(pcgen)
pkgrel=1
pkgver=6.07.08.g4f0948c954
conflicts=(pcgen)
pkgdesc="An RPG Character Generator."
arch=(any)
url=http://pcgen.org
license=(LGPL2)
depends=(sh java-runtime gtk-update-icon-cache desktop-file-utils shared-mime-info java-openjfx)
makedepends=(git gradle java-environment)
source=("${pkgname}"::'git+https://github.com/PCGen/pcgen.git'
        ${_pkgname}.xml
        ${_pkgname}.desktop
        ${_pkgname}.sh
        config.ini)
sha256sums=('SKIP'
            'ddc882d843d9afa80ae82934619b7a54380e8b7b45b78d5236589e358ea82b62'
            'c0350cf4b92b8a417399ba27e072ffa27a729c391ee7260bd9e30db3daaedb21'
            '79604420bc3667555da1ed74f3e644b3f09d5c6b23d1d9f00230fef3e9436091'
            '6c14727dcde94d2fe6bfc977d48e8e65a7efbb7ccc2741fd2c95ffff820a7075')

pkgver(){
    cd "${srcdir}/${pkgname}"
    githash=$(git rev-parse --short HEAD)
    ver=$(grep 'version=' gradle.properties | cut -d'=' -f2 | sed 's/-/_/g')
    echo ${ver}.g${githash}
}

build(){
    cd "${srcdir}/${pkgname}"
    ./gradlew
}

package(){
  cd "$srcdir"
  install -Dm644 ${_pkgname}.xml "${pkgdir}/usr/share/mime/packages/${_pkgname}.xml"
  install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm755 ${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 config.ini "${pkgdir}/usr/share/java/pcgen/config.ini"
  install -Dm644 ${pkgname}/output/pcgen.jar "${pkgdir}/usr/share/java/pcgen/pcgen.jar"
  install -Dm644 ${pkgname}/output/pcgen-batch-convert.jar "${pkgdir}/usr/share/java/pcgen/pcgen-batch-convert.jar"
  install -Dm644 ${pkgname}/code/src/images/PCGenApp.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  for dir in data docs output/libs outputsheets plugins preview system; do
    cp -a ${pkgname}/$dir ${pkgdir}/usr/share/java/${_pkgname}/
  done
}
