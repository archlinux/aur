# Maintainer: Bert Burgemeister <trebbu@googlemail.com>
pkgname=p-rout-git
pkgver=defined_below
pkgrel=1
pkgdesc="Collect and view data of a Nedap PowerRouter."
url="https://github.com/trebb/p-rout/"
arch=('any')
license=('MIT')
backup=('usr/lib/systemd/system/p-rout-view.service')
depends=('guile-lib'
         'guile-dbd-postgresql'
	 'guile-json'
         'dnsmasq'
	 'postgresql'
	 'gnuplot')
makedepends=('git')
install=p-rout.install
source=("${pkgname}"::'git://github.com/trebb/p-rout.git'
        'p-rout-collect.service'
        'p-rout-view.service'
        'p-rout-dump.timer'
	'p-rout-dump.service'
        'p-rout.tmpfiles.conf')
md5sums=('SKIP'
         '2844347280ebff1e8f9edc0d1754e766'
         'f73c4edc5540a8b374f783f6974cb303'
         '677e1409fab7cb18003375323db85c9d'
         'bfc32356e90eda415718796c0707d4a3'
         '228ba9f9fc5a508d47bdc022031d65d5')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/-/.r/; s/-/./'
}

build() {
  cd "$srcdir/$pkgname"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install

  install -D -m644 \
    "${srcdir}/p-rout.tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/p-rout.conf"

  install -m755 -d "${pkgdir}/usr/lib/systemd/system/"
  install -m644 \
    "${srcdir}/p-rout-collect.service" \
    "${srcdir}/p-rout-view.service" \
    "${srcdir}/p-rout-dump.service" \
    "${srcdir}/p-rout-dump.timer" \
    "${pkgdir}/usr/lib/systemd/system/"

  install -D -m644 \
    "${srcdir}/${pkgname}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  install -m755 -d "${pkgdir}/usr/share/p-rout/"
  install -m644 \
    "${srcdir}/${pkgname}/datetimepicker_css.js" \
    "${srcdir}/${pkgname}/VERSION" \
    "${pkgdir}/usr/share/p-rout/"

  install -D -m644 \
    "${srcdir}/${pkgname}/README" \
    "${pkgdir}/usr/share/doc/p-rout/README"

  install -m755 -d "${pkgdir}/usr/share/doc/p-rout/example/"
  install -m644 \
    "${srcdir}/${pkgname}/example/dnsmasq.conf" \
    "${srcdir}/${pkgname}/example/ens4v1_static" \
    "${srcdir}/${pkgname}/example/hosts" \
    "${pkgdir}/usr/share/doc/p-rout/example/"

  install -m755 -d "${pkgdir}/var/lib/p-rout/"
}
