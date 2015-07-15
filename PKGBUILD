# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (at) gmail.com>
# Contributor: alexwizard

pkgname=kdeplasma-applets-stackfolder-git
_realname=stackfolder
pkgver=20121024
pkgrel=1
pkgdesc="Browse the stack of folders"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/index.php?p=stackfolder.git&a=summary"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'git' 'docbook-xsl')
#provides=("")
conflicts=("kdeplasma-applets-stackfolder")
md5sums=()

_gitroot="git://anongit.kde.org/${_realname}"
_gitname=${_realname}

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  git clone ${srcdir}/${_gitname} ${srcdir}/build
  cd ${srcdir}/build

  # patch and run localization files
  #patch -Np1 -i ${srcdir}/patch

  #export RK_SRCS="${srcdir}/build"
  #cd scripts
  #chmod +x download_i18n.sh
  #./download_i18n.sh
  #cd ..
  # end path and run localization files

  cmake . -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
