# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Carl George <arch <at> cgtx.us>

pkgname=couchpotato
_pkgname=CouchPotato
pkgver=3.0.1
_fullname=CouchPotatoServer-build-${pkgver}
pkgrel=3
pkgdesc="Automatic Movie Downloading via NZBs & Torrent"
arch=('any')
url="http://couchpota.to/"
license=('GPL3')
depends=('python2' 'python2-lxml')
install='couchpotato.install'
source=("https://github.com/RuudBurger/CouchPotatoServer/archive/build/${pkgver}.tar.gz"
        "${pkgname}.service"
	"${pkgname}-confd.conf"
	"${pkgname}.sh"
	"${pkgname}-tmpfiles.conf"
	"${pkgname}-sysusers.conf"
	'journal-logging.patch')
md5sums=('6168004bc99a604b09e0752f9bd2e419'
         '8fc7c9021900d0fa1fed20465232e322'
         '42ec6846a96efdf6524d7905b3f03393'
         '48126ad1674d4679c2a645dfb9d5a2c2'
         '95ebd431433b87d88c7a48cf0a32be7d'
         '9601ee082f7fc0fc543e51e3b7b297fa'
         '4cf459a79a8148cb1a3aeb0802c02d87')

build() {
	cd "${srcdir}/${_fullname}"
	patch -Np1 -i "$srcdir/journal-logging.patch"
}

package() {
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/var/lib/${pkgname}"

  cp -r "${srcdir}/${_fullname}/"* "${pkgdir}/usr/lib/${pkgname}"

  find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/lib/${pkgname}" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/usr/lib/${pkgname}/${_pkgname}.py"

  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm640 "${srcdir}/${pkgname}-confd.conf" "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
