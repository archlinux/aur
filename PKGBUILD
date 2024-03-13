# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
_npmname=node-red
pkgver=3.1.7
pkgname=nodejs-${_npmname}
pkgrel=1
pkgdesc="A visual tool for wiring the Internet of Things."
arch=(x86_64 i686 armv5 armv6h armv7h aarch64)
url="https://nodered.org"
license=("APACHE")
depends=("nodejs>=14" "npm")
optdepends=()
backup=("etc/default/${pkgname}")
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
		"${pkgname}.service"
		"${pkgname}.default")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('6128da6dbc08907da912c9451c1b5d307fb907ba4f60a158c5913814e7cfe791'
            'cb3468c4f5c5883ed89aef13485c6c604d22f917cec714585dbadd4914fff3e8'
            'd08994475b06f270b2f1a2b3c99c22fd33f001dc2a10413460caded125f81f38')

package() {
  install -Dm644 ${pkgname}.default "${pkgdir}/etc/default/${pkgname}"
  install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  mkdir -p ${pkgdir}/usr/lib/node_modules
  cd ${pkgdir}/usr/lib/node_modules
  npm install --cache "${srcdir}/npm-cache" --global --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
  echo "u ${pkgname} - - /var/lib/${pkgname}" | install -Dm644 /dev/stdin "${pkgdir}"/usr/lib/sysusers.d/"${pkgname}".conf
  echo "d /var/lib/${pkgname} 0750 ${pkgname} ${pkgname} -" | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
