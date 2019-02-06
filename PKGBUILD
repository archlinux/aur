# Maintainer: Marcs <aur (at) odd.red>

pkgname=nightcode
_name=Nightcode
pkgver=2.7.0
pkgrel=1
pkgdesc="An IDE that bundles a smart editor, the Leiningen and Boot build tools, and a home screen with quick access to the Clojure cheatsheet and REPL."
arch=('any')
url="https://sekao.net/nightcode/"
license=('custom')
makedepends=('boot')
depends=('jdk8-openjdk' 'java-openjfx')
conflicts=('nightcode-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/oakes/${_name}/archive/${pkgver}.tar.gz"
        "nightcode.desktop")
sha256sums=('d0700471def4ec7abfb71ce6e8d16831f53bdcdbd2cf2b85c1be8ad80d56ea6d'
            'aa94a3cf9028756b4bd6dbb6f9b27dc23f8aa4d29ca18507736561ef66fbd267')
noextract=('nightcode.desktop')

build() {
	cd "${_name}-${pkgver}"
	msg2 "Building nightcode..."
	boot build
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
  install -Dm644 ${srcdir}/${_name}-${pkgver}/package/linux/Nightcode.png ${pkgdir}/usr/share/nightcode/Nightcode.png
}
