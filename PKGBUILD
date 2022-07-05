pkgname=halcyon
pkgver=0.9.45
pkgrel=2
pkgdesc="Halcyon 3d virtual reality world simulator"
arch=('any')
url="https://github.com/HalcyonGrid/${pkgname}"
license=('custom:BSD-3-clause')
depends=(mariadb mono sqlite whip-server)
makedepends=(mono-msbuild nuget doxygen graphviz)
provides=(opensimulator)
install=$pkgname.install
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz"
  "${pkgname}.sh"
  "hc-database.sh"
  "${pkgname}.service")
sha512sums=('91c8686ce38836934e5d393f618cdc1c2a007f731837b5f452211332d68e1a0f70bad7b971196929d39af1bc5631ce7d2826722a08ebb1d09fbc9c4fff0c15e9'
  '305d0b5eaf3f5c3f3d78ec37c772789b723dae190c4c921deee1f79f65ac500d9274ae2e952f3d7d0222f6ca81115cf2dafe7c8aef61833a09cf4869608d615c'
  '559be52f045e30ab8ae002335744270242abab24c1e10b84548d2db6d145aa8a8d66e90d621e441ddee8d8a7746d404f349a56aa85ebaf1e3b6640cbd2aefe31'
  '12a3b2dd50b9e3c8c19e24399026f558c744278c74d7f776ce319b1db48520576693641f9dfebbdcae57222d7b2a341e9ad2b1c763ffa54c1d4499c865e6c070')
# https://github.com/KSP-CKAN/CKAN/issues/3361#issuecomment-847426156
build() {
  cd ${pkgname}-${pkgver}
  ./build.sh
  doxygen doc/doxygen.conf
}

package() {
  install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -m755 hc-database.sh "${pkgdir}/usr/bin/hc-database"
  cd ${pkgname}-${pkgver}
  mkdir -p "${pkgdir}/srv/inworldz"
  cp -r bin/* "${pkgdir}/srv/inworldz/"
  chmod -R 644 "${pkgdir}/srv/inworldz"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r share/* "${pkgdir}/usr/share/${pkgname}/"
  chmod -R 644 "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/bot LSL Functions"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/html"
  cp -r "doc/bot LSL Functions/"* "${pkgdir}/usr/share/doc/${pkgname}/bot LSL Functions/"
  cp -r html/* "${pkgdir}/usr/share/doc/${pkgname}/html/"
  chmod -R 644 "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgdir}/srv/inworldz"
  rm PhysX3*.dll
  # rm Prebuild.exe
  rm aperture.example.cfg
  rm aperture.exe
  rm cg*.dll
  rm cudart64_32_16.dll
  rm glut32.dll
  rm libapr*.dll
  rm libbulletnet.dll
  rm libcurl.dll
  rm libdb44d.dll
  rm libeay32.dll
  rm *.dylib
  rm *.so.*
  rm libssh2.dll
  rm msvc*.dll
  rm openjpeg*.dll
  rm sqlite3.dll
  rm sqlite3.dll.version.txt
  rm ssleay32.dll
  rm zlib1.dll
}

# vim:set ts=2 sw=2 et:
