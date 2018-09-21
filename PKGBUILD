# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=evostreamms
_build=5649
pkgver="2.0.1.${_build}"
pkgrel=1
pkgdesc="EvoStream Media Server"
arch=('x86_64')
url="https://evostream.com/"
license=('custom')
makedepends=('poppler')
install="${pkgname}.install"
provides=('evostreamms-web' 'evostreamms-libavbin')
source=("http://tarballs.evostream.com/release/${_build}/${pkgname}-${pkgver}-x86_64-Debian_9.tar.gz"
        "config.lua.patch"
        "webconfig.json.patch"
        "emsTranscoder.sh.patch")
md5sums=('d6878fb8b9513bfaa4f70e75ef24a38e'
         'dcf7277c169c9a16710e6ca18c6b48ff'
         '26433b7ca2ea5409f07bdbae57155c38'
         '408c5188a5e3ae37e7efad2545eca4ed')

build() {
  mv ${srcdir}/${pkgname}-${pkgver}-x86_64-Debian_9/** ${srcdir}/
}

package() {
  depends=('evostream-systemd')

  msg2 "Preparing directory structure..."
  mkdir -p "${pkgdir}/etc/evostreamms" "${pkgdir}/run/evostreamms" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/doc/evostreamms" "${pkgdir}/usr/share/evo-avconv/presets" "${pkgdir}/usr/share/licenses/evostreamms" "${pkgdir}/var/evo-webroot" "${pkgdir}/var/evostreamms/media" "${pkgdir}/var/evostreamms/xml" "${pkgdir}/var/log/evostreamms"

  msg2 "Preparing license..."
  pdftotext "${srcdir}/Evostream Media Server EULA v2.pdf"

  msg2 "Copying..."
  mv ${srcdir}/bin ${pkgdir}/usr/
  mv ${srcdir}/config/*.xml ${pkgdir}/var/evostreamms/xml
  mv ${srcdir}/config/* ${pkgdir}/etc/evostreamms
  mv ${srcdir}/"Evostream Media Server EULA v2.txt" ${pkgdir}/usr/share/licenses/evostreamms/LICENSE
  mv ${srcdir}/*.pdf ${pkgdir}/usr/share/doc/evostreamms
  mv ${srcdir}/BUILD_DATE ${pkgdir}/usr/share/doc/evostreamms
  mv ${srcdir}/README.txt ${pkgdir}/usr/share/doc/evostreamms
  mv ${srcdir}/evo-avconv-presets/* ${pkgdir}/usr/share/evo-avconv/presets
  mv ${srcdir}/evo-webroot ${pkgdir}/var

  msg2 "Patching..."
  patch ${pkgdir}/etc/evostreamms/config.lua ${srcdir}/config.lua.patch
  patch ${pkgdir}/etc/evostreamms/webconfig.json ${srcdir}/webconfig.json.patch
  patch ${pkgdir}/usr/bin/emsTranscoder.sh ${srcdir}/emsTranscoder.sh.patch

  msg2 "Cleaning..."
  rm -f ${pkgdir}/usr/bin/run_*.sh ${pkgdir}/usr/bin/platformTests
}
