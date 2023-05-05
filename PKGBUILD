# Maintainer: soh @ AUR
# Contributor: navigaid <navigaid@gmail.com>
# Contributor: shi liang <shiliang2008@msn.com>

pkgname=naiveproxy-git
_pkgname=naiveproxy
pkgver=v113.0.5672.62.1.r1.g900f316fd
pkgrel=1
pkgdesc='camouflage traffic with strong censorship resistence using Chromium network stack'
arch=('x86_64')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr')
source=('git+https://github.com/klzgrad/naiveproxy' 'naiveproxy.service')
makedepends=()
optdepends=("ccache: Speed up compilation")
backup=(etc/naiveproxy/config.json)
md5sums=('SKIP'
         'cb40c8c7586f92892a81f698fd6140b3')
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
  install -Dm 0644 -o root "naiveproxy@.service" -t "${pkgdir}/usr/lib/systemd/system/"
  cd ${srcdir}/${_pkgname}
  install -Dm755 src/out/Release/naive ${pkgdir}/usr/bin/naiveproxy
  install -Dm644 src/config.json ${pkgdir}/etc/naiveproxy/config.json
  install -Dm644 README.md ${pkgdir}/usr/share/doc/naiveproxy/README.md
  install -Dm644 USAGE.txt ${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/naiveproxy/LICENSE
}
