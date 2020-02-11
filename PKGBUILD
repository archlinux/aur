# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>

pkgname=jss
pkgver=4.6.2
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
sha512sums=('53c12822b980f6dcaf5616366834fe4eaee07d84feae53096aa0ea142146e90d375910456d8192068cde5e63c3b60ded87862af50ea89c6b64224e8c105e00dd'
            '8542994a2fc908e8aef73556753cfd0b7afe92200987654a8290c7aa5aa7dd1dbca618859891f5c5f02147d950ef5f00a3cd2fe40ed2d1b37c0da982e9720ee6'
            '93a5ad83c590d82283fe83d08e9c9b2bb489b0b89361aed9eb86163d59cc74dd07b63905d36c11e3181f01377b270839ce68600fcec7f31d2ce59c780a181499')

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
