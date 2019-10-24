# Maintainer: MatMoul <matmoul@gmail.com>

pkgbase=octopi-notifier-frameworks
pkgname=('octopi-notifier-frameworks')
pkgver=0.9.0
pkgrel=6
pkgdesc="Notifier for Octopi with Knotifications support"
pkggit=octopi
_gitcommit=7c5e3f9f27529f8a372b17611eeec18cf788c8d7
_gitsha256='88e3488dcf9035cc754bd4cad34aab8ba68b60f9a19552c63da01738149b472a'
arch=('i686' 'x86_64')
url="http://octopiproject.wordpress.com"
license=('GPL2')
depends=("octopi-dev>=${pkgver}-${pkgrel}" 'knotifications')
makedepends=('qt5-declarative' 'clang' 'qt5-tools')
provides=('octopi-notifier')
conflicts=('octopi-notifier-qt5')

source=("octopi-${pkgver}-${pkgrel}.tar.gz::https://github.com/aarnt/octopi/archive/${_gitcommit}.tar.gz")
sha256sums=(${_gitsha256})

prepare() {
  cd "${srcdir}/${pkggit}-${_gitcommit}"
  
  # set version
  sed -i -e "s|0.10.0 (dev)|${pkgver}-${pkgrel} (git-${_gitcommit:0:6})|g" src/strconstants.cpp
  
  # set Knotifications
  sed -i 's|#KSTATUS|KSTATUS|' notifier/octopi-notifier.pro
}

build() {
  cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  cpucount=$((${cpucount:-1}))

  cd "${srcdir}/${pkggit}-${_gitcommit}"
  
  msg "Building octopi-notifier..."
  cd notifier
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-notifier.pro -spec linux-clang
  make -j $cpucount
}

package() {
  cd "${srcdir}/${pkggit}-${_gitcommit}"
  
  cd notifier
  make INSTALL_ROOT="${pkgdir}" install
}
