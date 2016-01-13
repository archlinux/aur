# Maintainer: Leonard de Ruijter <alderuijter@gmail.com>

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
sha256sums=('SKIP'
            '46f4d6942223a6d82f0b188e616a8a9cda3911663d59cc976c44b7a9822149f0'
            'b09ac79daccf8347ead4088aca31d2214dcd27e211e9ee2e96ef1a44b65df84f'
            '4b7f31aff45c6a572d54279531b7944567363d4c2bcd86d9c48887dc7da80a73')

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
