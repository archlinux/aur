# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: meklu <meklu at meklu dot org>
# Contributor: Samsagax <samsagax at gmail dot com>
# Contributor: Swift Geek <swiftgeek+spam@gmail.com>

_pkgname=entrance
pkgname=$_pkgname-git
pkgver=0.0.99.r73.9f1e051
pkgrel=1
pkgdesc="Enlightenment Display Manager"
url="http://www.enlightenment.org/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('elementary' 'xorg-xauth')
  [[ (! $(pacman -T ekbd-svn)) || (! $(pacman -T ekbd-git)) ]] && depends+=('ekbd-git')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=('etc/entrance.conf')
source=("git://git.enlightenment.org/misc/$_pkgname.git"
        'entrance.service')
sha256sums=('SKIP'
            '187e721108e342bf0442cdaf2a3e4b836b17c3c756b691d1ee3f02e6abcb0ecb')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
