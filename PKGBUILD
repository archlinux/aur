# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: meklu <meklu at meklu dot org>
# Contributor: Samsagax <samsagax at gmail dot com>
# Contributor: Swift Geek <swiftgeek+spam@gmail.com>

_pkgname=entrance
pkgname=$_pkgname-git
pkgver=3.0.0_alpha2.r8.g388bb2b
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
  git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    -Dconsolekit=false \
    -Dlogind=true
  ninja
}

package() {
  cd "$srcdir/build"

 DESTDIR="$pkgdir" ninja install
cd "$srcdir/$_pkgname"
# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" AUTHORS ChangeLog README
}
