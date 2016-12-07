# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=crtmpserver-git
_gitname=crtmpserver
pkgdesc="High performance rtmp streaming server"
pkgver=b866fff
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.rtmpd.com/"
install=crtmpserver-git.install
license=('GPL')
depends=('openssl')
makedepends=('git' 'cmake')
provides=('crtmpserver')
conflicts=('crtmpserver' 'crtmpserver-svn')
source=(
  'git://github.com/shiretu/crtmpserver'
  #'git://github.com/j0sh/crtmpserver'
  #'git://github.com/mich181189/crtmpserver'
  'crtmpserver-conf.zip'
)
md5sums=(
  'SKIP'
  '6ba239d886cd67013bd501ab423889e4'
)

pkgver() {
  cd "${srcdir}/${_gitname}"
  git log | head -n 1 | cut -d" " -f2 | awk '{print substr($0,0,7)}'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  #git checkout improved
  #patch -p1 < ../../fixes.patch

  cd "${srcdir}/${_gitname}/builders/cmake"

  # disable tests and errors
  #sed -i 's/SET(GENERIC_FLAGS "-Wall -Werror")/SET(GENERIC_FLAGS "-Wall")/g' CMakeLists.txt
  sed -i 's/ADD_SUBDIRECTORY(tests)/#ADD_SUBDIRECTORY(tests)/g' CMakeLists.txt

  # change log and applications location
  sed -i 's/fileName="\/tmp\/crtmpserver",/fileName="\/var\/log\/crtmpserver\/main.log",/g' crtmpserver/crtmpserver.lua
  sed -i 's/rootDirectory="applications",/rootDirectory="\/usr\/lib\/crtmpserver\/applications",/g' crtmpserver/crtmpserver.lua

  # enable applestreamingclient and vmapp
  #sed -i 's/#ADD_SUBDIRECTORY/ADD_SUBDIRECTORY/g' applications/CMakeLists.txt
}

build() {
  cd "${srcdir}/${_gitname}/builders/cmake"

  cmake \
    -DCMAKE_CXX_FLAGS="-std=c++03 -Wno-c++11-compat" \
    -DCRTMPSERVER_INSTALL_PREFIX=/usr

  make -j1
}

package(){
  cd "$srcdir/${_gitname}"/builders/cmake
  make DESTDIR="$pkgdir" install

  # move sbin to bin directory
  mv "$pkgdir"/usr/sbin "$pkgdir"/usr/bin

  # move man page to proper directory
  install -dm755 "$pkgdir"/usr/share
  mv "$pkgdir"/usr/man "$pkgdir"/usr/share/

  # move etc to proper directory
  rm -rf "$pkgdir"/usr/etc
  install -dm755 "$pkgdir"/etc/crtmpserver
  cp -r "$srcdir/"crtmpserver-conf/* "$pkgdir"/etc/crtmpserver/

  # add development files
  install -dm644 "$pkgdir"/usr/include/crtmpserver/common
  install -dm644 "$pkgdir"/usr/include/crtmpserver/thelib
  cp -r "$srcdir/${_gitname}"/sources/common/include/* "$pkgdir"/usr/include/crtmpserver/common/
  cp -r "$srcdir/${_gitname}"/sources/thelib/include/* "$pkgdir"/usr/include/crtmpserver/thelib/

  # add systemd service file
  install -Dm644 "$srcdir"/../crtmpserver.service "$pkgdir"/usr/lib/systemd/system/crtmpserver.service

  # create log directory
  install -dm644 "$pkgdir"/var/log/crtmpserver
}
