# Maintainer:  Johan Vandegriff <johan at vandymail dot com>

pkgname=alice2-bin
pkgver=2.4
_pkgver=2_4e
pkgrel=2
pkgdesc='An educational software that teaches students computer programming in a 3D environment'
arch=('x86_64' 'i586') #NOTE: not tested on i586 but the "run-alice" script seems to indicate that it works
url='https://www.alice.org/get-alice/alice-2/'
license=('custom')
makedepends=('gendesk')
depends=('jdk8-openjdk'
         'java-runtime'
         'lib32-libglvnd')
source=("${pkgname}-${pkgver}.tar::https://www.alice.org/wp-content/uploads/2017/05/Alice${_pkgver}.tar")
sha256sums=('5a087c75c7a1af95141791f0d4d5846e6067cec9ef5c89c3d67fe7af3b612040')

package() {
  gendesk --pkgname "Alice 2" --pkgdesc "${pkgdesc}" --exec "/usr/bin/alice2" --categories "Development;IDE" -n -f
  install -D -m644 "${srcdir}/Alice 2.desktop" "${pkgdir}/usr/share/applications/alice2.desktop"

  install -d "${pkgdir}/usr/bin" "${pkgdir}/opt"
  echo '#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
cd /opt/alice2/Required/
./run-alice
' > alice2
  install -Dm755 alice2 -t "${pkgdir}/usr/bin"

  mkdir -p "Alice 2.4/Required/jython-2.1/cachedir/packages"
  cp -avR "Alice 2.4" "${pkgdir}/opt/alice2"
  chmod -R 755 "${pkgdir}/opt/alice2"
  #chmod 755 "${pkgdir}/opt/alice2/Required/run-alice"
  install -Dm644 "Alice 2.4/Required/Alice2.4_LICENSE.pdf" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
