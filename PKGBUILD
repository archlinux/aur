# Maintainer: MatMoul <matmoul@gmail.com>

pkgbase=octopi-notifier-frameworks
pkgname=('octopi-notifier-frameworks')
pkgver=0.9.0
pkgrel=2
pkgdesc="Notifier for Octopi with Knotifications support"
pkggit=octopi
# Temporary solution for an up to date release, need to be commented for the tagged release.
_gitcommit=31060ae2b2f7c496c95b2262b8219c39b65e45be
arch=('i686' 'x86_64')
url="http://octopiproject.wordpress.com"
license=('GPL2')
depends=("octopi>=${pkgver}-${pkgrel}" 'knotifications')
makedepends=('qt5-declarative' 'clang' 'qt5-tools')
provides=('octopi-notifier')
conflicts=('octopi-notifier-qt5')

if [ "${_gitcommit}" != "" ]; then
  source=("octopi-${pkgver}-${pkgrel}.tar.gz::https://github.com/aarnt/octopi/archive/${_gitcommit}.tar.gz")
else
  source=("octopi-${pkgver}.tar.gz::https://github.com/aarnt/octopi/archive/v${pkgver}.tar.gz")
fi
sha256sums=('2eac6062b3589700b0d0e37c601f5bff4ad49dc59847be5950777d7e5a09685c')


prepare() {
  if [ ! -z ${_gitcommit} ]; then
    cd "${srcdir}/${pkggit}-${_gitcommit}"
  else
    cd "${srcdir}/${pkggit}-${pkgver}"
  fi

  # set version
  sed -i -e "s|0.10.0 (dev)|${pkgver}-${pkgrel} (git-${_gitcommit:0:6})|g" src/strconstants.cpp

  # set Knotifications
  sed -i 's|#KSTATUS|KSTATUS|' notifier/octopi-notifier.pro
}

build() {
  cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  cpucount=$((${cpucount:-1}))

  if [ ! -z ${_gitcommit} ]; then
    cd "${srcdir}/${pkggit}-${_gitcommit}"
  else
    cd "${srcdir}/${pkggit}-${pkgver}"
  fi

  cd notifier
  msg "Building octopi-notifier..."
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-notifier.pro -spec linux-clang
  make -j $cpucount
}

package() {
  if [ ! -z ${_gitcommit} ]; then
    cd "${srcdir}/${pkggit}-${_gitcommit}"
  else
    cd "${srcdir}/${pkggit}-${pkgver}"
  fi

  cd notifier
  make INSTALL_ROOT="${pkgdir}" install
}
