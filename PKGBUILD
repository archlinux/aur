# Maintainer:F43nd1r <support@faendir.com>
pkgname=megameklab
pkgver=0.48.0
pkgrel=1
epoch=
pkgdesc="Customize mechs for a MegaMek game."
arch=('x86_64')
url="https://github.com/MegaMek/megamek"
license=('GPL')
groups=()
depends=('java-runtime>=8')
makedepends=('git' 'tar')

source=("${pkgname}::git+https://github.com/MegaMek/${pkgname}#tag=v${pkgver}"
        "megamek::git+https://github.com/MegaMek/megamek#tag=v${pkgver}"
        "megameklab.desktop"
        "megameklab.sh"
        "megameklab.patch"
        "megamek.patch")
sha256sums=('SKIP'
            'SKIP'
            '7b3615680c9892099ab6e7b675e8e22baf9680d12a58050d46d71537a7fe0372'
            'ca4459489d3c188b7418f7b596290accec61e2b190a58f4d0fd7593911d87597'
            '7a5949eacb26b612b784211c5067d1042e86232b180a9f41530f2d6ecb4a4cc3'
            'c3d19a1933b36d29caf577c31f10683f2c99c0501fe3f23de678fcedae69f373')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "%s" "$(grep -Po "^version = \'\K[^\']*" build.gradle)"
}

prepare() {
	cd "$srcdir/${pkgname}"
	git am "../${pkgname}.patch"
	cd "../megamek"
	git am "../megamek.patch"
}

build() {
	cd "$srcdir/${pkgname}"
	./gradlew clean assemble unixDistTar --no-daemon
	cd "build/distributions"
	tar -xvzf ${pkgname}-${pkgver}.tar.gz
}

package() {
	cd "$srcdir"
    install -D megameklab.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 megameklab.sh "${pkgdir}/usr/bin/${pkgname}"
    
	cd "${pkgname}/build/distributions/${pkgname}-${pkgver}"
    install -D "MegaMekLab.jar" "${pkgdir}/usr/share/java/${pkgname}/MegaMekLab.jar"
    install -Dm755 "lab" "${pkgdir}/usr/share/java/${pkgname}/lab"
    cp -r "data" "${pkgdir}/usr/share/java/${pkgname}"
    cp -r "docs" "${pkgdir}/usr/share/java/${pkgname}"
    cp -r "lib" "${pkgdir}/usr/share/java/${pkgname}"
    cp -r "logs" "${pkgdir}/usr/share/java/${pkgname}"
    cp -r "mmconf" "${pkgdir}/usr/share/java/${pkgname}"
    
    install -Dm666 /dev/null "${pkgdir}/var/log/megameklab/megameklab.log"
}

