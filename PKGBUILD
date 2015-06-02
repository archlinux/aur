# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
pkgname=icecast-kh
pkgver=2.4.0_kh1
pkgrel=1
pkgdesc='The KH branche extends the official release of Icecast with features that may be (if found to be working out well) merged into the next official release.'
arch=('i686' 'x86_64')
url='http://karlheyes.github.com'
license=('GPL2')
conflicts=('icecast' 'icecast' 'icecast-svn' 'icecast-kh-git')
provides=("icecast=${pkgver/_*}")
depends=('libxslt' 'libvorbis' 'libtheora' 'speex' 'curl')
optdepends=('ices-kh: client for icecast server')
OPTIONS=(!debug !strip)
backup=('etc/icecast.xml' 'etc/logrotate.d/icecast')
install=$pkgname.install
source=(https://github.com/karlheyes/$pkgname/archive/${pkgname/-*}-${pkgver//_/-}.tar.gz
        $pkgname.logrotate
        start-by-icecast.patch
        $pkgname.service)
md5sums=('bf53ed192ff2fba1c13c3fba1852d693'
         'c619028040f547621e62ebd6f644c233'
         'a4a7a21a1c21ded249913edf45606068'
         'a0ba8a1e301acf2945e498331d1fced0')
_srcpath=$pkgname-${pkgname/-*}-${pkgver//_/-}

prepare() {
  cd "$srcdir/$_srcpath"
  patch -Np1 -i "${srcdir}/start-by-icecast.patch"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
}

build() {
  cd "$srcdir/$_srcpath"
  make 
}

package() {
  cd "$srcdir/$_srcpath"
  make DESTDIR="$pkgdir" install

  # install logrotate config
  install -Dm0644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/icecast"
  # install systemd unit
  install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/icecast.service"
}
# vim:set ts=2 sw=2 et:
