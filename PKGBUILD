# Maintainer: navigaid <navigaid@gmail.com>
# Maintainer: shi liang <shiliang2008@msn.com>

pkgname=naiveproxy-git
_pkgname=naiveproxy
pkgver=v93.0.4577.63.2.r3.g696e87142
pkgrel=1
pkgdesc='Make a fortune quietly'
arch=('x86_64' 'amd64' 'i386' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr')
source=('git+https://github.com/klzgrad/naiveproxy.git' 'naiveproxy.service')
makedepends=("clang" "lld" "ninja" "gn" "python2" "gcc" "llvm")
optdepends=("ccache: Speed up compilation")
backup=(etc/naiveproxy/config.json)
md5sums=('SKIP' 'SKIP')
provides=('naiveproxy')
conflicts=('naiveproxy' 'naiveproxy-bin')

prepare() {
  cd ${srcdir}/${_pkgname}/src
  #sed -ri "s|./gn/out/||" build.sh
  chmod a+x build.sh
  ./get-clang.sh
}

pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd ${srcdir}/${_pkgname}/src
  ./build.sh
}

package(){
  install -Dm 0644 -o root "naiveproxy.service" -t "${pkgdir}/usr/lib/systemd/system/"
  cd ${srcdir}/${_pkgname}
  install -Dm755 src/out/Release/naive ${pkgdir}/usr/bin/naiveproxy
  install -Dm644 src/config.json ${pkgdir}/etc/naiveproxy/config.json
  install -Dm644 README.md ${pkgdir}/usr/share/doc/naiveproxy/README.md
  install -Dm644 USAGE.txt ${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/naiveproxy/LICENSE
}
