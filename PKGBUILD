# Maintainer: flu
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

# Select favourite branch uncommenting only one of the following
vcs_branch="next"
#vcs_branch="master"

# Set USE_GDB=1 to build for gdb debugging, otherwise set USE_GDB=0
USE_GDB=0

_name="spacefm"
pkgname="$_name-git"
pkgver=20150309.994
pkgrel=1
pkgdesc="A multi-panel tabbed file manager - git branch"
arch=('i686' 'x86_64')
url=("http://ignorantguru.github.com/$_name/")
license=('GPL3')

makedepends=('intltool' 'gettext')
depends=('gtk3' 'shared-mime-info' 'desktop-file-utils' 'udev' 'ffmpegthumbnailer')
optdepends=(
            'lsof: device processes'
            'eject: eject media'
            'wget: plugin download'
            'ktsuss: perform as root functionality'
            'gksu: perform as root functionality'
            'udevil-git: mount as non-root user and mount networks'
            'pmount: mount as non-root user'
            'udisks: mount as non-root user'
            'udisks2: mount as non-root user'
            'startup-notification'
)
conflicts=("$_name" "$_name-gtk2")
provides=("$_name")
source=(git+https://github.com/IgnorantGuru/$_name#branch=$vcs_branch)
install="install"
sha512sums=(SKIP)


if (( USE_GDB == 1 )); then
  options=('!strip')
fi

pkgver() {
  cd   "$srcdir"/"$_name"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {

  cd "$srcdir/$_name"


  if (( USE_GDB == 1 )); then
    export CFLAGS+="-g"
  fi

  # NOTE: To add a custom su program (mysu in this example), add:
  # --with-preferable-sudo="mysu"  to configure line below.

  ./configure --prefix=/usr --with-gtk3
  make        -s

}

package() {
  cd   "${srcdir}/$_name"
  make DESTDIR="${pkgdir}/"  install
}
