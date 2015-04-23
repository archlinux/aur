# Maintainer: Alan Young <harleypig@gmail.com>
#
# Stolen and modified from https://aur.archlinux.org/packages/taskd-git/
#
# Found and stole various bits and pieces from
#
# http://threebean.org/rpm/taskd-config
# http://threebean.org/rpm/taskd.service
# http://threebean.org/rpm/taskd.spec

_pkgname=taskd
pkgname=$_pkgname-git
pkgver=1.1.0
pkgrel=1
pkgdesc="A lightweight, secure server providing multi-user, multi-client access to task data"

arch=('i686' 'x86_64')
depends=('gnutls')
license=('MIT')
makedepends=('git' 'cmake')
provides=('taskd')
url='http://tasktools.org/projects/taskd.html'

install=taskd.install

source=('git+https://git.tasktools.org/scm/tm/taskd.git'
        'taskd.conf'
        'taskd.notes'
        'taskd.service')

md5sums=('SKIP'
         '8e644fd70bea84c8fabe8a24e26a4549'
         '455f7ef0c9c5ed292f82b4864ef56aef'
         '7e2f6b38ea5b03a75611d20b1add4d3f')

#pkgver() {
#
#  # https://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines#Git
#
#  cd "${srcdir}/${_pkgname}"
#  #git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
#  #git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
#  git describe --long --tags | sed -r 's/^[^[:digit:]]+//;s/([^-]*-g)/r\1/;s/-/./g'
#
#}

build() {

  cd "${srcdir}/${_pkgname}"

  cmake_opts="${cmake_opts} -DCMAKE_BUILD_TYPE=Release"
  cmake_opts="${cmake_opts} -DTASKD_BINDIR=/usr/bin"
  cmake_opts="${cmake_opts} -DTASKD_DOCDIR=/usr/share/doc/taskd"
  cmake_opts="${cmake_opts} -DTASKD_MAN1DIR=/usr/share/man/man1"
  cmake_opts="${cmake_opts} -DTASKD_MAN5DIR=/usr/share/man/man5"

  cmake $cmake_opts .

  make

}

check() {

  cd "${srcdir}/${_pkgname}"
  make test
  cd test
  make
  ./run_all

}

package() {

  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 doc/client.txt      "${pkgdir}/usr/share/doc/taskd"
  install -Dm644 doc/extensions.txt  "${pkgdir}/usr/share/doc/taskd"
  install -Dm644 doc/operation.txt   "${pkgdir}/usr/share/doc/taskd"
  install -Dm644 doc/protocol.txt    "${pkgdir}/usr/share/doc/taskd"
  install -Dm644 doc/request.txt     "${pkgdir}/usr/share/doc/taskd"
  install -Dm644 doc/sync.txt        "${pkgdir}/usr/share/doc/taskd"
  install -Dm644 doc/task.txt        "${pkgdir}/usr/share/doc/taskd"
  install -Dm644 doc/template.txt    "${pkgdir}/usr/share/doc/taskd"
  install -Dm644 LICENSE             "${pkgdir}/usr/share/licenses/taskd/LICENSE"
  install -Dm644 ../taskd.conf       "${pkgdir}/etc/conf.d/taskd"
  install -Dm644 ../taskd.service    "${pkgdir}/usr/lib/systemd/system/taskd.service"
  install -Dm644 ../taskd.notes      "${pkgdir}/usr/lib/taskd/taskd.notes"
  install -Dm755 pki/generate.ca     "${pkgdir}/usr/lib/taskd/pki/generate.ca"
  install -Dm755 pki/generate.client "${pkgdir}/usr/lib/taskd/pki/generate.client"
  install -Dm755 pki/generate.crl    "${pkgdir}/usr/lib/taskd/pki/generate.crl"
  install -Dm755 pki/generate        "${pkgdir}/usr/lib/taskd/pki/generate"
  install -Dm755 pki/generate.server "${pkgdir}/usr/lib/taskd/pki/generate.server"
  install -Dm644 pki/README          "${pkgdir}/usr/lib/taskd/pki/README"

}
