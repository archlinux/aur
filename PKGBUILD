# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=jss
pkgver=4.6.0
pkgrel=1
pkgdesc="Network Security Services for Java (JSS) is a Java interface to NSS"
arch=('x86_64' 'i686')
url="https://www.dogtagpki.org/wiki/JSS"
license=(GPL)
depends=('java-runtime' 'nspr' 'nss' 'slf4j' 'java-commons-codec' 'java-commons-lang' 'jaxb-api' 'junit')
makedepends=('java-environment' 'cmake')
source=("https://github.com/dogtagpki/jss/archive/v${pkgver}.tar.gz"
        'paths.patch')
sha512sums=('9568f783a75e7fa994ea2a0a85dee02000146b19fd4270dff844c6edbefe04f4ddc0886d6c19450b8d33a4595e67f8ab45a4e8f5194c383fc0ee5344243577c2'
            '93a5ad83c590d82283fe83d08e9c9b2bb489b0b89361aed9eb86163d59cc74dd07b63905d36c11e3181f01377b270839ce68600fcec7f31d2ce59c780a181499')

prepare() {
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
