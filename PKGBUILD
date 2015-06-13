# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (at) gmail.com>
# Contributors: @alexwizard and @gcala

pkgname=rekonq-git
pkgver=2.3.2.39.g489dbe4.2013.11.10
pkgrel=1
pkgdesc="A WebKit based web browser for KDE, git version"
arch=('i686' 'x86_64')
url="http://rekonq.kde.org"
license=('GPL')
depends=('kdebase-keditbookmarks' 'qoauth' 'qtwebkit')
optdepends=('kdebase-konqueror: search engines support'
            'qca-ossl: to use the sync handler')
makedepends=('cmake' 'automoc4' 'git' 'docbook-xsl' 'bc')
provides=(${_realname})
conflicts=(${_realname})
install=${pkgname}.install
source=('rekonq::git://anongit.kde.org/rekonq'
  'patch')
md5sums=('SKIP'
         '5b81227b06f793322e9b854965803886')

pkgver() {
  cd rekonq
  echo $(git describe --tags).$(git log -1 --format="%cd" --date=short) | sed 's:-:.:g'
}
         
build() {
 
  cd rekonq
  # patch and run localization files
  patch -Np1 -i ${srcdir}/patch
  
  export RK_SRCS="${srcdir}/rekonq"
  cd scripts
  chmod +x download_i18n.sh
  ./download_i18n.sh
  cd ..
  # end path and run localization files

  cmake . -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DQT_QMAKE_EXECUTABLE=qmake4
  make
}

package() {
  cd ${srcdir}/rekonq
  make DESTDIR=${pkgdir} install
}