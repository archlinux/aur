# Maintainer: Tricia, `creyon` <gtcreyon@gmail.com>
# Contributor: xiliuya <xiliuya@aliyun.com>
# Contributor: Alexandre `Zopieux` Macabies <web+aur@zopieux.com>
pkgname=ffdec
pkgver=20.1.0
pkgrel=1
pkgdesc="Open source Flash SWF decompiler and editor"
arch=('any')
url="https://github.com/jindrapetrik/jpexs-decompiler/releases"
license=('GPL3')
depends=('java-runtime>=8')
makedepends=('ant')
source=(https://github.com/jindrapetrik/jpexs-decompiler/archive/refs/tags/version${pkgver}.tar.gz
        $pkgname
        $pkgname.desktop
        version.patch)
b2sums=('41ebb5c913baa16071f70ac9e8c4788ba39c803137002a45944df9df75733932faaf1cdbe3e5d1b17906016f2ac6f1742a66347b91047e5065ab6fe376f54301'
        '9fb18759764df78715295e3e110edde21fde377117a0166cb94677f9824e43624933e2fb49d2a9787531aa0f3ddcb22d9b6702f13d05d5667136b6cea674b546'
        '4ab0b43f051893bbc5ea8b5c4822474b139622f5023b157e7763ca8802494fd53af4eaf1471ea03c0130f339e838604daf84c2766935e4bc00c75d1d9a566fef'
        'd874316146f395ddde442cf73610aa0213d51df9b7b6e5de7fe06254119d7937cdfb07ce6aeb0aedbf37635356069331011e64e47aec06db10dd5c46abca4b7c')

prepare() {
    cd "jpexs-decompiler-version${pkgver}"
    
    cp ../version.patch version.patch

    IFS='.' read -r major minor patch <<< ${pkgver}
    sed -i "s/MAJOR/${major}/g" version.patch
    sed -i "s/MINOR/${minor}/g" version.patch
    sed -i "s/PATCH/${patch}/g" version.patch

    patch -p1 -i version.patch
}

build() {
    cd "jpexs-decompiler-version${pkgver}"
    ant build
}

package() {
    cd "jpexs-decompiler-version${pkgver}"
    install -Ddm755 "${pkgdir}/usr/share/java/${pkgname}/lib"
    install -Ddm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "dist/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "resources/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
    install -Dm644 "resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    cd "lib"
    for f in *.license.txt; do
        install -Dm644 "$f" "${pkgdir}/usr/share/licenses/${pkgname}/$f"
    done
    for f in *.jar; do
        install -Dm644 "$f" "${pkgdir}/usr/share/java/${pkgname}/lib/$f"
    done

    cd "$srcdir"
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
