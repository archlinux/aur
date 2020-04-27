# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=jss
pkgver=4.6.4
pkgrel=1
pkgdesc='Java interface to NSS'
arch=('x86_64')
url="https://www.dogtagpki.org/wiki/JSS"
license=(GPL)
depends=('java-runtime' 'nspr' 'nss' 'slf4j' 'java-commons-codec' 'java-commons-lang' 'jaxb-api' 'junit' 'zip')
makedepends=('java-environment' 'cmake')
source=("https://github.com/dogtagpki/jss/archive/v${pkgver}.tar.gz"
        'lang3.patch'
        'paths.patch')
sha512sums=('c0adc950e1ce5e0f3d846dcb158d831575be84176ded3eec7ce3569cfd96c872a2089a2eede249c5924e1eee58d88574accd3403623910343130cf90b504b348'
            '686e88c96be5bb18b88a0ac922aec2779a41e771830d904a130d983962b642bcae0cbcaba74491d7948ea02ec447be8529fc8fa23c24d540e8454b53c10bab15'
            'b2921cf6a18e1b9adf4d246bc773aaa85d9d7f2fe19a6605deb8d2e63309dcd9661720b1b102fae0c1a9f6a618822a4e92d659568fc49f2d3685826cbfb1fc05')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "../lang3.patch"

  cd "${srcdir}/${pkgname}-${pkgver}/cmake"
  patch < "${srcdir}/paths.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  if [[ -z "${JAVA_HOME}" ]]; then
    export JAVA_HOME=/usr/lib/jvm/default
  fi

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..

  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  install -dm755 "${pkgdir}/usr/share/java/"
  install -m644 jss4.jar "${pkgdir}/usr/share/java/jss4.jar"

  # We have to use the name libjss4.so because this is dynamically
  # loaded by the jar file.
  install -dm755 "${pkgdir}/usr/lib/jss/"
  install -m755 libjss4.so "${pkgdir}/usr/lib/jss/"

  pushd "${pkgdir}/usr/lib/jss/"
    ln -sf /usr/share/java/jss4.jar jss4.jar
  popd
}
