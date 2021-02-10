# Maintainer: Leonard de Ruijter <alderuijter@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=icecast-kh
pkgver=2.4.0_kh15
pkgrel=2
pkgdesc='The KH branche extends the official release of Icecast with features that may be (if found to be working out well) merged into the next official release.'
arch=('x86_64')
url='http://karlheyes.github.com'
license=('GPL2')
conflicts=('icecast' 'icecast' 'icecast-svn' 'icecast-kh-git')
provides=("icecast=${pkgver/_*}")
depends=('glibc' 'libkate' 'libxml2' 'libxslt' 'openssl' 'speex' 'libtheora')
makedepends=('curl' 'libogg' 'libvorbis')
backup=('etc/icecast.xml' 'etc/logrotate.d/icecast')
source=(
  "https://github.com/karlheyes/$pkgname/archive/${pkgname/-*}-${pkgver//_/-}.tar.gz"
  "${pkgname}.logrotate"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha512sums=('698332967a1a9c0c6b67a1e01f9cefe85741eb2ba62b692877ca4003c9bdcf6a32e90842246ae67c700a0bd2e7760ca53455b4197f46089649b6148b5894cc64'
            'db10c9c4b6f12fa2524820afd9f14d1ee14a7af6dfa1896975394a0d95ec412332f36f3d95375b5cd8679d64093ae609ebb66b9de14b3f95afda980f4f6dd458'
            '8b9170e155e393396aaf471bd304b77d6ae6b8a6198959aa5e1ddc8fe55be7f19efc844d0352300ba5621a8de9e47cc3842b8b8d0ac8606635e27346d805f497'
            'ca0c6e81e84910ac5bcd573aa280224426201b4aa8580f974b17daea6f95472e3ba47b3319ea1291d6762e858a3f7e9120f05357fe02aa83f01bb767862a04c8'
            'db3cf00e5ff1e2f5636288992212964f068f94ee98a880c27f00afda44f048e608636a34f2ae551f3cf24f7c43ebd2f40ab8a9bcc5d8057901d4a871c6b79f13')

_srcpath=$pkgname-${pkgname/-*}-${pkgver//_/-}

prepare() {
  cd "$srcdir/$_srcpath"
  autoreconf -vfi
}

build() {
  cd "$srcdir/$_srcpath"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make 
}

package() {
  depends+=('libcurl.so' 'libogg.so' 'libvorbis.so')
  cd "$srcdir/$_srcpath"
  make DESTDIR="$pkgdir" install

  # install logrotate config
  install -vDm0644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/icecast"
  # install systemd unit
  install -vDm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/icecast.service"
  install -vDm 644 "../${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -vDm 644 "../${pkgname}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
# vim:set ts=2 sw=2 et:
