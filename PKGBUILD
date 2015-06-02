# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
pkgname=icecast-kh-git
pkgver=2_kh
pkgrel=3
pkgdesc='The KH branche extends the official release of Icecast with features that may be (if found to be working out well) merged into the next official release. This package installs the most recent version from GitHub.'
arch=('i686' 'x86_64')
url='http://karlheyes.github.com'
license=('GPL2')
conflicts=('icecast' 'icecast-svn' 'icecast-kh')
provides=("icecast=${pkgver/_*}")
depends=('libxslt' 'libvorbis' 'libtheora' 'speex' 'curl')
optdepends=('ices-kh: client for icecast server')
makedepends=('git')
OPTIONS=(!debug !strip)
backup=('etc/icecast.xml' 'etc/logrotate.d/icecast')
install=$pkgname.install
source=($pkgname::git://github.com/karlheyes/icecast-kh.git
        $pkgname.logrotate
        start-by-icecast.patch
        $pkgname.service)
md5sums=('SKIP'
         'c619028040f547621e62ebd6f644c233'
         'a4a7a21a1c21ded249913edf45606068'
         'a0ba8a1e301acf2945e498331d1fced0')

pkgver() {
  cd $pkgname
  git describe --always | sed 's|-|_|g' | cut -c9-
}

prepare() {
  cd "$srcdir/$pkgname"
./autogen.sh  
  patch -Np1 -i "${srcdir}/start-by-icecast.patch"
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install

  # install logrotate config
  install -Dm644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/icecast"
  # install systemd unit
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/icecast.service"
find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
# vim:set ts=2 sw=2 et:
