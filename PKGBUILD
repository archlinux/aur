# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: meklu <meklu at meklu dot org>
# Contributor: Samsagax <samsagax at gmail dot com>
# Contributor: Swift Geek <swiftgeek+spam@gmail.com>

_pkgname=entrance
pkgname=$_pkgname-git
pkgver=0.1.r417.a085f13
pkgrel=1
pkgdesc="Enlightenment Display Manager"
url="http://www.enlightenment.org/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('efl-git' 'xorg-xauth' 'sudo')
optdepends=('ekbd-git: For virtual keyboard')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/entrance/entrance.conf')
source=("git://github.com/Obsidian-StudiosInc/entrance")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  sed -e '/"session_path"/ s|:.*|: "/usr/local/sbin:/usr/local/bin:/usr/bin";|' \
      -e '/"shutdown"/ s|:.*|: "/usr/bin/systemctl poweroff";|' \
      -e '/"reboot"/ s|:.*|: "/usr/bin/systemctl reboot";|' \
      -e '/"suspend"/ s|:.*|: "/usr/bin/systemctl suspend";|' \
      -i "$srcdir/$_pkgname/data/entrance.conf.in"
  rm -rf build
  mkdir "$srcdir/build"
}

build() {
  cd "$srcdir/build"

  meson ../$_pkgname  \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --bindir="/usr/bin" \
    --datadir="/usr/share" \
    --sysconfdir="/etc" \
    -Dconsolekit=false
  ninja
}

package() {
  cd "$srcdir/build"

 DESTDIR="$pkgdir" ninja install
cd "$srcdir/$_pkgname"
# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" AUTHORS ChangeLog NEWS README
}
