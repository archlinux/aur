# Maintainer: Jeongseok Kim <jeongseok.kim@sk.com>

pkgname='stardog'
_pkgname="${pkgname}-latest"
pkgver=9.1.1
pkgrel=3
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
	    'f7c6ca09cf650c328709922dc2090b8a178fdbfeec452c07275bb2fb2f88b0f1'
	    'b4d88609f6fffdec1dd15550c6430a9ae7dccbb2ae35fd8fd252e1ab1e9a0057'
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
