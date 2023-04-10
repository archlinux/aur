# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Michael Manley <mmanley@nasutek.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Maik Broemme <mbroemme@libmpq.org>

_pkgname=asterisk
pkgname=$_pkgname-cisco
pkgver=18.16.0
pkgrel=1
pkgdesc="A complete PBX solution. Includes the Cisco Presence patch for use with Cisco IP Phones"
provides=('asterisk')
conflicts=('asterisk')
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://www.asterisk.org"
license=('GPL')
depends=('alsa-lib'
         'curl'
         'jansson'
         'libedit'
         'libvorbis'
         'libxml2'
         'libxslt'
         'opus'
         'pjproject'
         'popt'
         'speex')
makedepends=('gsm'
             'sqlite3')
optdepends=('dahdi'
            'iksemel'
            'libpri'
            'libsrtp'
            'libss7'
            'lua51'
            'openr2'
            'postgresql'
            'unixodbc')
source=("https://downloads.asterisk.org/pub/telephony/asterisk/old-releases/asterisk-${pkgver}.tar.gz" \
	"https://raw.githubusercontent.com/usecallmanagernz/patches/master/asterisk/cisco-usecallmanager-${pkgver}.patch" \
	"DialTemplate.xml" \
	"FeaturePolicy.xml" \
	"SEPMAC.cnf.xml" \
	"SoftKeys.xml" \
	"AppDialRules.xml" \
	"asterisk.sysusers" \
	"asterisk.logrotated" \
	"asterisk.tmpfile")
install=$pkgname.install
sha256sums=('2d280794ae7505ed3dfc58b3190774cb491aa74c339fbde1a11740e6be79b466'
            '989bacb9096a2f4c0851cd6b49aa094b4a6b1a8349f873b1b2960e845e2114dc'
            '10795bc3b2fb28b79b3ab74bbd8f33b667e3bf4b1c87ccfb2aae168f9b07a17c'
            'da5a87717517b37d0554369235e0bdb86700bd696c1a70db5a47d9f4711b44db'
            'ecff1e7807003beb3198f95859fa3c1b57d618940872d1c8638e65f5a49afce4'
            'f75707ccd176ae1223f80a1c02fdebafbd0bce3e5ec12667e6e061b0427bb075'
            'c1243a3459b0d43020f9644fa2a2a6c9003a7bd51927715d626dc4060c234818'
            'fc2e42f79e1672cc25b9b8ad2ba99616fbba0047641c986d30718655d0e7d4d8'
            'c97aea10852842aa6e997789c3d207dce7b585c37b1308d5aa4d5b1b6560e627'
            '673c0c55bce8068c297f9cdd389402c2d5d5a25e2cf84732cb071198bd6fa78a')

prepare() {
  cd ${srcdir}/asterisk-${pkgver}
  patch -p1 -i "${srcdir}/cisco-usecallmanager-${pkgver}.patch"
}

build() {
  cd ${srcdir}/asterisk-${pkgver}
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --sbindir=/usr/bin \
      --with-pjproject-bundled=no
  make menuselect.makeopts
  ./menuselect/menuselect --disable BUILD_NATIVE
  make
}

package(){
  cd ${srcdir}/asterisk-${pkgver}
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-headers
  make DESTDIR="$pkgdir" samples
  
  # Note you must build the package before you can update meta data!
  backup=($(cd "$pkgdir" && echo "etc/$_pkgname/"*))

  sed -i -e 's,/var/run,/run,' "$pkgdir/etc/asterisk/asterisk.conf"
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/examples" "$pkgdir/etc/asterisk/"*
  mkdir -p ${pkgdir}/usr/share/doc/$_pkgname/cisco/examples
  
  mv "$pkgdir/var/run" "$pkgdir"

  pushd contrib/systemd
  install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$_pkname"*.{service,socket}

  pushd "$srcdir"
  install -Dm644 ${srcdir}/DialTemplate.xml ${pkgdir}/usr/share/doc/asterisk/cisco/examples/DialTemplate.xml
  install -Dm644 ${srcdir}/FeaturePolicy.xml ${pkgdir}/usr/share/doc/asterisk/cisco/examples/FeaturePolicy.xml
  install -Dm644 ${srcdir}/SEPMAC.cnf.xml ${pkgdir}/usr/share/doc/asterisk/cisco/examples/SEPMAC.cnf.xml
  install -Dm644 ${srcdir}/SoftKeys.xml ${pkgdir}/usr/share/doc/asterisk/cisco/examples/SoftKeys.xml
  install -Dm644 ${srcdir}/AppDialRules.xml ${pkgdir}/usr/share/doc/asterisk/cisco/examples/AppDialRules.xml

  install -Dm644 "$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$_pkgname.logrotated" "$pkgdir/etc/logrotate.d/$_pkgname"
  install -Dm644 "$_pkgname.tmpfile" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
 }
