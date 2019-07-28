# Maintainer: MatMoul <matmoul@gmail.com>


# Comment to preserve the very old release...
USE_DEV='1'


pkgbase=octopi-notifier-qt5
pkgname=('octopi-notifier-qt5')
pkgver=0.9.0
pkgrel=2
pkgdesc="Notifier for Octopi using Qt5 libs"
pkggit=octopi
if [[ ${USE_DEV} == '1' ]]; then
	_gitcommit=31060ae2b2f7c496c95b2262b8219c39b65e45be
	_gitsha256='2eac6062b3589700b0d0e37c601f5bff4ad49dc59847be5950777d7e5a09685c'
fi
arch=('i686' 'x86_64')
url="http://octopiproject.wordpress.com"
license=('GPL2')
depends=("octopi>=${pkgver}-${pkgrel}" 'libnotify')
makedepends=('qt5-declarative' 'clang' 'qt5-tools')
optdepends=('xfce4-notifyd: for notifications in XFCE')
provides=('octopi-notifier')
conflicts=('octopi-notifier-frameworks')

if [[ ${USE_DEV} == '1' ]]; then
  source=("octopi-${pkgver}-${pkgrel}.tar.gz::https://github.com/aarnt/octopi/archive/${_gitcommit}.tar.gz")
  sha256sums=(${_gitsha256})
else
  source=("octopi-${pkgver}.tar.gz::https://github.com/aarnt/octopi/archive/v${pkgver}.tar.gz")
  sha256sums=('f6c7fe6bbcc26a79b1e455a42a8dc906bee4edd1b386b4f76178f006f4d7f822')
fi

prepare() {
  if [[ ${USE_DEV} == '1' ]]; then
    cd "${srcdir}/${pkggit}-${_gitcommit}"
    
    # set version
    sed -i -e "s|0.10.0 (dev)|${pkgver}-${pkgrel} (git-${_gitcommit:0:6})|g" src/strconstants.cpp
  else
    cd "${srcdir}/${pkggit}-${pkgver}"
  fi
}

build() {
  cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  cpucount=$((${cpucount:-1}))

  if [[ ${USE_DEV} == '1' ]]; then
    cd "${srcdir}/${pkggit}-${_gitcommit}"
    
    msg "Building octopi-notifier..."
    cd notifier
    qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-notifier.pro -spec linux-clang
    make -j $cpucount
  else
    cd "${srcdir}/${pkggit}-${pkgver}"
    
    msg "Building octopi-pacmanhelper..."
    cd notifier/pacmanhelper
    qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" pacmanhelper.pro -spec linux-clang
    make -j $cpucount
    
    msg "Building octopi-notifier..."
    cd ../octopi-notifier
    qmake-qt5 PREFIX=/usr QMAKE_CFLAGS="${CFLAGS}" QMAKE_CXXFLAGS="${CXXFLAGS}" QMAKE_LFLAGS="${LDFLAGS}" octopi-notifier.pro -spec linux-clang
    make -j $cpucount
  fi
}

package() {
  if [[ ${USE_DEV} == '1' ]]; then
    cd "${srcdir}/${pkggit}-${_gitcommit}"
    
    cd notifier
    make INSTALL_ROOT="${pkgdir}" install
  else
    cd "${srcdir}/${pkggit}-${pkgver}"
    
    cd notifier/pacmanhelper
    make INSTALL_ROOT="${pkgdir}" install
    
    cd ../octopi-notifier
    make INSTALL_ROOT="${pkgdir}" install
  fi
}
