# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Tinu Weber <http://ayekat.ch>

set -u
pkgname='ttylog'
pkgver='0.31'
pkgrel='1'
pkgdesc='A serial port logger'
arch=('x86_64')
#url='http://ttylog.sourceforge.net/'
url='https://github.com/rocasa/ttylog'
license=('GPL-2.0-only')
depends=('glibc')
makedepends=('cmake')
#_verwatch=("${url}/releases.atom" '\s\+<title>\([0-9\.]\+\)</title>.*' 'f') # RSS
# https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rocasa/ttylog/archive/${pkgver}.tar.gz")
md5sums=('1af983d72ad55914bfac691302a178a3')
sha256sums=('5a063a57fff0239a511f1964efc8aa9cedf099f9e2cd9c33e33ea8dc8149015d')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  sed -e 's:sbin:bin:g' -i 'INSTALL' 'CMakeLists.txt' 'TODO'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  if [ ! -d 'build' ]; then
    mkdir 'build'
    cd 'build'
    cmake -D CMAKE_INSTALL_PREFIX='/usr' '..' -DCMAKE_POLICY_VERSION_MINIMUM='3.5'
  else
    cd 'build'
  fi
  nice -n1 make -j1 # no speed benefit
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}/build"
  make -j1 DESTDIR="${pkgdir}/" install
  set +u
}
set +u
