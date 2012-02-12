# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit.com>
pkgname=filetea-git
pkgver=20111031
pkgrel=1
pkgdesc="Low friction, one-click anonymous file sharing."
arch=(i686 x86_64)
url="https://gitorious.org/filetea/filetea"
license=('AGPL3')
depends=(evd-git)
optdepends=('jquery: to have automatic jquery updates')
makedepends=('git')
backup=('etc/filetea/filetea.conf')
source=('filetea.rc.d'
        'filetea.service')

_gitroot=git://gitorious.org/filetea/filetea
_gitname=filetea

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  mkdir -p ${pkgdir}/etc/{filetea,rc.d}
  cp ${srcdir}/filetea.rc.d ${pkgdir}/etc/rc.d/filetea
  cp filetea.conf ${pkgdir}/etc/filetea/

  # systemd support
  mkdir -p ${pkgdir}/lib/systemd/system/
  cp ${srcdir}/filetea.service ${pkgdir}/lib/systemd/system/

  # change config (if you have installed jquery to /usr/share/jquery/jquery.min.js)
  # jquery{,-ui} packets in AUR have no static filenames atm
  # sed -i 's|^#jquery-dir=.*$|jquery-dir=/usr/share/jquery/|'   ${pkgdir}/etc/filetea/filetea.conf
  # same goes for jquery-ui
  # sed -i 's|^#jquery-ui-dir=.*$|jquery-dir=/usr/share/jquery/|'   ${pkgdir}/etc/filetea/filetea.conf

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
sha1sums=('e48b01a3b261495169e2d42da0cc9a776839aa27'
          'baf43b7f5b5eb218245b727138c7b1d3a97d29fc')
