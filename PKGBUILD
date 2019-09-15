# Maintainer: MatMoul <matmoul@gmail.com>

pkgbase=octopi-notifier-frameworks
pkgname=('octopi-notifier-frameworks')
pkgver=0.9.0
pkgrel=3
pkgdesc="Notifier for Octopi with Knotifications support"
pkggit=octopi
_gitcommit=d76eb8b1c861ece83b4f3178559e2e5253258c76
_gitsha256='532db1f04c36ec24d4e661c572b0cbf86e9b8bb973161dec4bb605e0309b7d2c'
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
