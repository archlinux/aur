# Maintainer: Marco Pompili <aur@emarcs.org>

pkgname=nightcode
_name=Nightcode
pkgver=2.1.7
pkgrel=1
pkgdesc="A simple IDE for Clojure and ClojureScript."
arch=('any')
url="https://sekao.net/nightcode/"
license=('custom')
depends=('java-runtime>7' 'java-openjfx')
conflicts=('nightcode-git')
source=("https://github.com/oakes/Nightcode/archive/$pkgver.tar.gz"
        "https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh"
        "nightcode.desktop")
sha256sums=('36f742c17a15123f43dc94102a8caa462808a51e85cd1df2168373a325413f01'
            '895def8ef37f4b78bb37a26566ce970dc24219e880154a18ef7ade5a778d3a2f'
            '8fb613946bb9cb3dc636933ff2f0c7de8c61d2b43e49b9d6baf380b07377eaa1')
noextract=('boot.sh')

build() {
	cd "$_name-$pkgver"
	msg2 "Building nightcode..."
	bash $srcdir/boot.sh build
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
