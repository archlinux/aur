# Maintainer: Daniel YC Lin <dlin.tw at gmail>
# vim:et sw=2 ts=2:

pkgname="fossil-tip"
_pkgname=fossil
pkgver=20150611.18fc
pkgrel=1
pkgdesc="Simple, high-reliability, distributed software configuration management"
arch=('i686' 'x86_64' 'sh4')
license=('BSD')
url="http://www.fossil-scm.org"
depends=('openssl' 'fuse')
backup=(etc/xinetd.d/fossil)
conflicts=('fossil')
provides=('fossil')
source=(fossil.socket fossil.service fossil-xinetd
  fossil-autocomplete.bash
  fossil-autocomplete.zsh
  http://www.fossil-scm.org/index.html/tarball/tip.tar.gz)
pkgver() {
  cd tip
  d=$(head manifest | awk 'NR==2{print substr($2,1,4) substr($2,6,2) substr($2,9,2)}')
  u=$(awk 'NR==1{print substr($1,1,4)}' manifest.uuid)
  echo "$d.$u"
}

prepare() {
  cp fossil-autocomplete.{bash,zsh} tip/tools
}

build() {
  cd tip
  ./configure --prefix=/usr
  # headers and translate targets are problematic with parallel jobs
  make -j1 bld bld/headers
  make
}

package() {
  install -Dm644 fossil-xinetd "$pkgdir"/etc/xinetd.d/fossil
  install -Dm644 fossil.socket "$pkgdir"/usr/lib/systemd/system/fossil.socket
  install -Dm644 fossil.service "$pkgdir"/usr/lib/systemd/system/fossil@.service

  cd $srcdir/tip
  install -Dm644 tools/fossil-autocomplete.bash "$pkgdir"/usr/share/bash-completion/completions/fossil
  install -Dm644 tools/fossil-autocomplete.zsh $pkgdir/usr/share/zsh/site-functions/_fossil

  install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 COPYRIGHT-BSD2.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
md5sums=('47b8382c177e45b1932c4c8f98895ed4'
         'aea80ead0dc14f773c2b0b546292f02c'
         '62f6fb3739191b352c3e2995ced9be4e'
         '2e57690b9153f4eb684acc378f2134d3'
         'ff2fa9218fc7580e7866a07e752d031d'
         SKIP)
