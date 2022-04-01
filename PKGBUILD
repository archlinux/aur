# Maintainer: Paul Mattal <paul@archlinux.org>
pkgname=hylafax
pkgver=6.0.7
pkgrel=4
pkgdesc="Fax Server"
arch=('x86_64')
install='hylafax.install'
license=('custom')
depends=('libtiff' 'pam' 'ghostscript')
makedepends=('smtp-server')
url="https://www.hylafax.org/"
backup=(var/spool/hylafax/bin/{faxrcvd,notify}
	usr/lib/fax/{faxcover.ps,hfaxd.conf,pagesizes,typerules}
	var/spool/hylafax/etc/hosts.hfaxd) 
source=(ftp://ftp.hylafax.org/source/${pkgname}-${pkgver}.tar.gz 
        hylafax.{timer,service,sysusers}
        config.local
        faxq.service
        hfaxd.service
        faxgetty@.service)
md5sums=('7602e98b882fa61a0722109c2706d1f1'
         '9ef38446d2a2aeac698c4ae178fd5c2b'
         'e5afba881859f018ee88d35fc62a488f'
         '05cb5b7055e4a54d35c91c138fd7a217'
         '5f3a89fbfb10c47755d3ca19183b8a59'
         'a10aa2ef613551a88d750f6602b5f2f7'
         '38a00db6d9d765d130b2d8d3a98e5c24'
         'fe10ea597e786fe8c09e4104fbdf16de')

prepare() {
  cd $pkgname-$pkgver
  sed -e 's|4.\[0\]|4.[012]|g' -i configure # Support libtiff 4.x
}

build () {
  cd ${pkgname}-${pkgver}
  cp ../config.local .
  ./configure --nointeractive --with-OPTIMIZER="${CFLAGS} ${LDFLAGS}"
  make
}

package () {
  cd ${pkgname}-${pkgver}
  mkdir -p "$pkgdir"/usr/{bin,lib/fax,share/ghostscript/fonts}
  mkdir -p "$pkgdir"/var/{spool/hylafax,lock}
  make ROOT="$pkgdir" install
  # add missing awk file for notify-4.1 script
  install -D -m 755 "$srcdir"/${pkgname}-${pkgver}/util/notify.awk \
  	"$pkgdir"/var/spool/hylafax/bin/notify.awk
  # remove /var/lock
  rm -r "$pkgdir"/var/lock
  # add systemd files
  install -D -m644 "$srcdir"/hfaxd.service "$pkgdir"/usr/lib/systemd/system/hfaxd.service
  install -D -m644 "$srcdir"/faxq.service "$pkgdir"/usr/lib/systemd/system/faxq.service
  install -D -m644 "$srcdir"/faxgetty@.service "$pkgdir"/usr/lib/systemd/system/faxgetty@.service
  install -D -m644 "$srcdir"/hylafax.sysusers "$pkgdir"/usr/lib/sysusers.d/hylafax.conf
  install -D -m644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
  # systemd timer
  install -D -m644 "${srcdir}"/hylafax.timer "${pkgdir}"/usr/lib/systemd/system/hylafax.timer
  install -D -m644 "${srcdir}"/hylafax.service "${pkgdir}"/usr/lib/systemd/system/hylafax.service
  install -d -m755 "${pkgdir}"/usr/lib/systemd/system/multi-user.target.wants
  ln -s ../shadow.timer "${pkgdir}"/usr/lib/systemd/system/multi-user.target.wants/hylafax.timer
  # fix permissions
  chown 10:14 "${pkgdir}"/var/spool/hylafax/{,archive,bin,client,config,dev,docq,doneq,etc}
  chown 10:14 "${pkgdir}"/var/spool/hylafax/{FIFO,info,log,pollq,recvq,sendq,status,tmp}
  chown 10:14 "${pkgdir}"/var/spool/hylafax/etc/{hosts.hfaxd,lutRS18.pcf,xferfaxlog}
  chown 10:14 -R "${pkgdir}"/var/spool/hylafax/etc/templates
}
