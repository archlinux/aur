# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: meklu <meklu at meklu dot org>
# Contributor: Samsagax <samsagax at gmail dot com>
# Contributor: Swift Geek <swiftgeek+spam@gmail.com>

pkgname=entrance-git
_pkgname=${pkgname%-*}
pkgver=0.0.4.40.6da13be
pkgrel=1
pkgdesc="Enlightenment Display Manager"
url="http://www.enlightenment.org/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('elementary' 'xorg-xauth')
  [[ ! $(pacman -T ekbd-svn) ]] && depends+=('ekbd-svn')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/entrance.conf')
source=("git://git.enlightenment.org/misc/$_pkgname.git"
        'entrance.service')
md5sums=('SKIP'
         'a64b761bb312d9685705232618f57d84')

pkgver() {
  cd "$srcdir/$_pkgname"

  local _ver=$(awk -F , '/^AC_INIT/ {print $2}' configure.ac | tr -d '[ ]')

  echo $_ver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  sed -e '/"session_path"/ s|/bin:/usr/bin:/usr/local/bin|/usr/local/sbin:/usr/local/bin:/usr/bin|' \
      -e '/"shutdown"/ s|/sbin/shutdown -h now|/usr/bin/systemctl poweroff|' \
      -e '/"reboot"/ s|/sbin/shutdown -r now|/usr/bin/systemctl reboot|' \
      -e '/"suspend"/ s|/usr/sbin/pm-suspend|/usr/bin/systemctl suspend|' \
      -i "$srcdir/$_pkgname/data/entrance.conf"
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
	--prefix=/usr \
	--sbindir=/usr/bin \
	--sysconfdir=/etc \
	--disable-grub2 \
	--disable-consolekit

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install correct PAM file
  install -Dm644 "data/entrance.other" "$pkgdir/etc/pam.d/entrance"

# install systemd files
  install -Dm644 "$srcdir/entrance.service" "$pkgdir/usr/lib/systemd/system/entrance.service"

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
}
