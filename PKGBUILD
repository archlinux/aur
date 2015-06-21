# Maintainer: flu
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

_gitname="udevil"
pkgname=${_gitname}-git
pkgver=20131209.192
pkgrel=1
pkgdesc="Mount without password - includes devmon - git branch"
arch=('i686' 'x86_64')
url=("http://ignorantguru.github.com/${_gitname}/")
license=('GPL3')

makedepends=('intltool' 'gettext')
depends=('udev' 'glib2')
# See devmon dependency table:
#     http://igurublog.wordpress.com/downloads/script-devmon/#withtable
optdepends=(
            'nfs-utils:  mount nfs shares'
            'sshfs:      mount sftp shares'
            'curlftpfs:  mount ftp shares'
            'cifs-utils: mount samba shares'
            'davfs2:     mount WebDAV shares'
            'eject:      eject via devmon'
            'spacefm:    devmon popups'
            'zenity:     devmon popups'
            'pmount:     devmon mount without suid udevil'
            'udisks:     devmon mount without suid udevil'
            'udisks2:    devmon mount without suid udevil'
)
conflicts=('udevil' 'devmon' 'devmon-git')
provides=('udevil' 'devmon')
backup=(etc/udevil/udevil.conf etc/conf.d/devmon)
source=(git://github.com/IgnorantGuru/${_gitname}.git)
md5sums=(SKIP)

# Set USE_GDB=1 to build for gdb debugging, otherwise set USE_GDB=0
USE_GDB=0

if (( USE_GDB == 1 )); then
  options=('!strip')
fi

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd "${srcdir}/${_gitname}"

  # make
  if (( USE_GDB == 1 )); then
    CFLAGS+="-g" ./configure --prefix=/usr
    CFLAGS+="-g" make
  else
                 ./configure --prefix=/usr
                 make
  fi
  msg "REMEMBER to enable kernel polling when using udevil without udisks:"
  msg "         http://ignorantguru.github.com/udevil/#polling"
}

package() {
  cd   "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}/" install
}
