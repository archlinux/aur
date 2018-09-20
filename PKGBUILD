# Maintainer: Leonard de Ruijter <dev@systeemdenker.nl>

pkgname=icecast-kh
pkgver=2.4.0_kh10
pkgrel=2
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
sha256sums=('783684db7b199b0e4096fcbd9f1b4c50bb79542e1a33dbaf6d817b2ba4150d33'
            '46f4d6942223a6d82f0b188e616a8a9cda3911663d59cc976c44b7a9822149f0'
            'b09ac79daccf8347ead4088aca31d2214dcd27e211e9ee2e96ef1a44b65df84f'
            '4b7f31aff45c6a572d54279531b7944567363d4c2bcd86d9c48887dc7da80a73')
_srcpath=$pkgname-${pkgname/-*}-${pkgver//_/-}

build() {
  cd "$srcdir/$_srcpath"
  patch -Np1 -i "${srcdir}/start-by-icecast.patch"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
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
