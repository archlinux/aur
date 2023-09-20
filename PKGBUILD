# Maintainer: Jeongseok Kim <jeongseok.kim@sk.com>

pkgname='stardog'
_pkgname="${pkgname}-latest"
pkgver=9.1.1
pkgrel=1
pkgdesc="Stardog Knowledge Graph"
arch=('x86_64')
url="https://stardog.com"

makedepends=('unzip')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")

options=('!strip')

source=(https://downloads.stardog.com/stardog/${_pkgname}.zip
        ${pkgname}.default
        ${pkgname}.service
        ${pkgname}.sysusers)

sha256sums=('SKIP'
            'a13e9c660890232fe5ac8f76819eaec5cbac945afca8c1b94b6e67c8ac0aab0f'
            '8038cc25603c10bd2f61f2c727cea9d5c5d1fce96421ad5d21eeb930d1cb5633'
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

  ln -fs "/opt/${pkgname}/${pkgname}-${pkgver}" $pkgdir/opt/${pkgname}/latest
}
