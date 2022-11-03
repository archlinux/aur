#
# PKGBUILD for albert-minimal (with minimal plugins included))
#
# Maintainer: Uffe Jakobsen
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Manuel Schneider  <manuelschneid3r at googles mail>

pkgname=albert-minimal
pkgver=0.17.6
pkgrel=1
pkgdesc="A sophisticated standalone keyboard launcher - minimal plugins included"
arch=('x86_64')
url="https://github.com/albertlauncher"
license=('custom')
provides=('albert')
conflicts=('albert')
depends=('qt5-charts' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-svg' 'qt5-x11extras' 'libx11')
#makedepends=( 'cmake' 'git' 'muparser' 'python' 'qt5-declarative' 'qt5-svg' 'virtualbox' 'virtualbox-sdk')
makedepends=( 'cmake' 'git' 'muparser' 'python' 'qt5-declarative' 'qt5-svg')
optdepends=('muparser: Calculator plugin'
            'python: Python extension'
            #'virtualbox: VirtualBox plugin'
            )
source=("mirrors/albert::git+https://github.com/albertlauncher/albert.git#tag=v${pkgver}"
        "mirrors/plugins::git+https://github.com/albertlauncher/plugins.git"
        "mirrors/python::git+https://github.com/albertlauncher/python.git"
        "mirrors/pybind11::git+https://github.com/pybind/pybind11.git")

sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

#
#
#
prepare()
{
  mkdir -p build

  #
  cd "${srcdir}/albert"
  git submodule init
  git config protocol.file.allow always
  git config submodule.plugins.url "${srcdir}/plugins"
  git submodule--helper update plugins

  #
  cd "${srcdir}/albert/plugins"
  git submodule init
  git config protocol.file.allow always
  git config submodule.python/pybind11.url "${srcdir}/pybind11"
  git config submodule.python/share/modules.url "${srcdir}/python"
  git submodule--helper update python/pybind11 python/share/modules
}


#
#
#
build()
{
  cd build

  cmake "../albert" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -Wno-dev \
    -DBUILD_WIDGETBOXMODEL=ON \
    -DBUILD_QMLBOXMODEL=ON \
    -DBUILD_APPLICATIONS=ON \
    -DBUILD_CALCULATOR=ON \
    -DBUILD_CHROMEBOOKMARKS=ON \
    -DBUILD_EXTERNALEXTENSIONS=ON \
    -DBUILD_DEBUG=OFF \
    -DBUILD_FILES=ON \
    -DBUILD_FIREFOXBOOKMARKS=ON \
    -DBUILD_HASHGENERATOR=ON \
    -DBUILD_KVSTORE=ON \
    -DBUILD_MPRIS=ON \
    -DBUILD_PYTHON=ON \
    -DBUILD_SSH=ON \
    -DBUILD_SYSTEM=ON \
    -DBUILD_TEMPLATE=OFF \
    -DBUILD_TERMINAL=ON \
    -DBUILD_VIRTUALBOX=OFF

  make
}

#
#
#
package()
{
  cd build
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
# EOF
