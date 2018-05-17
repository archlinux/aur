# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
# Contributor: Valere Monseur <valere.monseur@NO-SPAM.ymail.com>
# http://github.com/fukawi2/aur-packages

pkgname=husk-git
pkgver=20130604
pkgrel=1
pkgdesc="An iptables front-end to allow rules to be expressed in a more flexible, free-form style using language."
arch=('any')
url="https://huskfw.info/"
license=('GPL')
depends=('perl' 'perl-config-inifiles' 'perl-config-simple')
makedepends=('git')
conflicts=('husk')
backup=('etc/husk/addr_groups.conf'
        'etc/husk/husk.conf'
        'etc/husk/interfaces.conf')

_gitroot="git://github.com/fukawi2/husk.git"
_gitname="husk"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --branch develop $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  sed -i Makefile \
      -e 's|/usr/local/|/usr/|g' \
      -e 's|/usr/sbin|/usr/bin|g'
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR=$pkgdir install
}
