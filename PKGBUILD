# Maintainer: soh @ AUR
# Contributor: navigaid <navigaid@gmail.com>
# Contributor: shi liang <shiliang2008@msn.com>

pkgname=naiveproxy-git-new
_pkgname=naiveproxy
pkgver=v114.0.5735.91.3.r0.gc53143ba5
pkgrel=1
pkgdesc='camouflage traffic with strong censorship resistence, git version that CAN build'
arch=('x86_64')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr')
source=('git+https://github.com/klzgrad/naiveproxy' 'naiveproxy@.service')
makedepends=()
optdepends=()
backup=(etc/naiveproxy/config.json)
b2sums=('SKIP'
        '91ea619c5dfcd8acfdcc5ea74bf108be172e18973fb3ce2ad418308176c17580a066d6d75d20fec8e05caedc6d4a7adafd9f693235f3fadbc2cef670a3ab4782')
provides=('naiveproxy')
conflicts=('naiveproxy' 'naiveproxy-bin' 'naiveproxy-git')

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
