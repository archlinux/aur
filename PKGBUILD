#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd-git
pkgver=0.19.9.r485.gcd1148c
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music'
url='http://www.musicpd.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2' 'boost-libs' 'libupnp'
         'sqlite' 'jack' 'libmms' 'wavpack' 'avahi' 'libid3tag' 'yajl' 'libmpdclient' 'opus' 'libsoxr')
makedepends=('boost' 'doxygen' 'git')
provides=('mpd')
conflicts=('mpd')
source=("$pkgname::git://git.musicpd.org/master/mpd.git"
        'mpd.conf' 'mpd.tmpfile' 'mpd.service' 'mpd-system.socket' 'mpd-user.socket')
sha256sums=('SKIP'
            '1dafb23f2da8df4600de0be51677201f63f745bd572f7a6fcd8fa7659ac691ea'
            'c1683ba35774c85e16c70e89f7e2ed1c09619512b1a273daabbd5e34d40439bd'
            'ecb4caedf02dacdb9b71040794145d7547d7ee8349eaea200cbddab85d67ee95'
            'a05936116d59d442a5f94858f30e759389719ed2ac6dbef25a512d952a156658'
            'a650e25f9e4490e6dc7172ff95bfb7a1df28175d365741c3d98af3849c4b5428')
backup=('etc/mpd.conf')
install=mpd.install

pkgver() {
  cd $pkgname

  git describe --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd $pkgname

  ./autogen.sh

  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-jack \
      --enable-soundcloud \
      --enable-pipe-output \
      --enable-pulse \
      --disable-sidplay \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --enable-opus \
      --disable-lsr \
      --enable-soxr \
      --disable-aac

  make
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install

  cd ..

  install -d -g 45 -o 45 "$pkgdir"/var/lib/mpd
  install -d -g 45 -o 45 "$pkgdir"/var/lib/mpd/playlists
  install -Dm644 mpd.conf "$pkgdir"/etc/mpd.conf
  install -Dm644 mpd.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/mpd.conf
  install -Dm644 mpd.service "$pkgdir"/usr/lib/systemd/user/mpd.service
  install -Dm644 mpd-system.socket "$pkgdir"/usr/lib/systemd/system/mpd.socket
  install -Dm644 mpd-user.socket "$pkgdir"/usr/lib/systemd/user/mpd.socket
}

# vim:set ts=2 sw=2 et:
