# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

pkgname=j4status-git
_gitname=j4status
pkgver=227.7bbb63d
pkgrel=1
pkgdesc="A plugin-based status line generator: j4status generates a status line to use with bar programs (like i3bar). It is plugin-based to allow anyone to extend it easily."
arch=('i686' 'x86_64')
url="http://j4status.j4tools.org/"
license=('GPL')
provides=('j4status')
depends=('dbus' 'yajl' 'networkmanager' 'upower' 'lm_sensors')
makedepends=('git' 'docbook-xsl')
options=('!libtool')
source=('git://github.com/sardemff7/j4status.git'
        'git://github.com/sardemff7/libgwater.git')
sha256sums=('SKIP'
            'SKIP')

pkgver()
{
  cd "${srcdir}/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare()
{
  cd "${srcdir}/${_gitname}"
  git submodule init
  git config submodule.libgwater.url "${srcdir}/libgwater"
  git submodule update
}

build()
{
  cd "${srcdir}/${_gitname}"

  ./autogen.sh
  ./configure --prefix=/usr --enable-systemd-input
  make
}

package()
{
  cd "${srcdir}/${_gitname}"

  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
