# Maintainer: Jeongseok Kim <jeongseok.kim@sk.com>

pkgname='stardog'
_pkgname="${pkgname}-latest"
pkgver=9.2.0
pkgrel=2
pkgdesc="Stardog Knowledge Graph"
arch=('x86_64')
url="https://stardog.com"

makedepends=('unzip')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")

options=('!strip')

backup=(etc/default/stardog)

source=(https://downloads.stardog.com/stardog/${_pkgname}.zip
        ${pkgname}.default
        ${pkgname}.service
        ${pkgname}.sysusers)

sha256sums=('SKIP'
	    '604e11b1164d67d31aa77d31ee21b39257651c67e012ffdab9fb1b84bcf469e7'
	    'f3e5e65f01dcc6eea54a1bd61dd85db5a1b1448177de975edbcce511e9275e37'
            'c8d9c3b0103db768f0353122dff6f9fd8f91cc032ea1a4e2b8f2468299667332')


pkgver() {
  zipinfo -1 ${_pkgname}.zip | head -1 | sed 's/.*-\([0-9][0-9\.]*\).*/\1/'
}

#build() {
#}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/etc/${pkgname}"
  cp -a "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"

  #cd "${pkgname}-${pkgver}"
  install -Dm644 "${srcdir}/${pkgname}.default" "${pkgdir}/etc/default/stardog"
  install -Dm644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/stardog.conf"

}

post_upgrade() {
  rm -f /opt/${pkgname}/latest
  ln -fs "/opt/${pkgname}/${pkgname}-${pkgver}" "/opt/${pkgname}/latest"
}
