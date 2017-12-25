# Maintainer: Marco Pompili <aur (at) odd.red>

pkgname=nightcode
_name=Nightcode
pkgver=2.5.4
pkgrel=1
pkgdesc="An IDE that bundles a smart editor, the Leiningen and Boot build tools, and a home screen with quick access to the Clojure cheatsheet and REPL."
arch=('any')
url="https://sekao.net/nightcode/"
license=('custom')
depends=('java-runtime>7' 'java-openjfx')
conflicts=('nightcode-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oakes/Nightcode/archive/${pkgver}.tar.gz"
        "https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh"
        "nightcode.desktop")
sha256sums=('26e86d224cc3cf17a85155f1c0f2d6d869524a7500c398bc32552c9bd33b3055'
            '0ccd697f2027e7e1cd3be3d62721057cbc841585740d0aaa9fbb485d7b1f17c3'
            '8fb613946bb9cb3dc636933ff2f0c7de8c61d2b43e49b9d6baf380b07377eaa1')
noextract=('boot.sh'
	   'nightcode.desktop')

build() {
	cd "${_name}-${pkgver}"
	msg2 "Building nightcode..."
	bash ${srcdir}/boot.sh build
}

package() {
  JARNAME="nightcode-standalone.jar"

  #artifact
  install -Dm644 ${srcdir}/$_name-${pkgver}/target/project.jar ${pkgdir}/usr/share/java/${pkgname}/$JARNAME

  #license
  install -Dm644 ${srcdir}/$_name-${pkgver}/UNLICENSE ${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE

  #launcher
  mkdir -p "${pkgdir}/usr/bin/"
  echo '#!/bin/sh' > "${pkgdir}/usr/bin/nightcode"
  echo 'java -Xmx512m -jar /usr/share/java/nightcode/'$JARNAME' $@' >> "${pkgdir}/usr/bin/nightcode"
  chmod 755 ${pkgdir}/usr/bin/nightcode

  #icon
  install -Dm644 ${srcdir}/nightcode.desktop ${pkgdir}/usr/share/applications/nightcode.desktop
}
