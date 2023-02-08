# Maintainer: J. Kerr <disconsented[at]disconsented[dot]com

pkgname=pufferpanel-bin
_pkgname=pufferpanel
pkgver=2.6.2
pkgrel=1
pkgdesc="PufferPanel: A web-base game management system (binary version)."
arch=('x86_64' 'aarch64')
url="https://github.com/PufferPanel/PufferPanel"
license=('Apache')
provides=('pufferpanel')
conflicts=('pufferpanel')
optdepends=('nginx: TLS support'
			'postgresql: Dedicated database'
			'docker: Container support'
                        'sqlite: Database support')
depends=()
source_aarch64=(https://github.com/PufferPanel/PufferPanel/releases/download/v${pkgver///-}/pufferpanel_${pkgver///-}_linux_arm64.zip)
source_x86_64=(https://github.com/PufferPanel/PufferPanel/releases/download/v${pkgver///-}/pufferpanel_${pkgver///-}_linux_amd64.zip)
source=(https://raw.githubusercontent.com/PufferPanel/PufferPanel/v${pkgver//_/-}/systemd/servicefiles/pufferpanel.service
               https://raw.githubusercontent.com/PufferPanel/PufferPanel/v${pkgver//_/-}/config.linux.json)
b2sums=('ed744c35200b918c3107ea6191e3c6c38b3a731183b5cf7ed8b066550a6038fd712429b24264b0b00c52f9533b8503462962d2bfdb45c49724be49a2b9b39141'
        '87d5cbcd6652209913527fc595ec457659ff05c759b6b4ff4d0154e856adc2056640b4dceff9216b0a118751e24bf1b43b80ff6fe3ad74e0ce45f5c82bc59f7e')
b2sums_x86_64=('e39d2bd544a820ad47ee14ff4ce3655f39f97f86a9048a2c9311a53dea4f8542b5e9ddab71e4b0dfe15727390a9534ed535bdebfb8695423d91df32321da93d9')
b2sums_aarch64=('bc67ec643608a4d6156401b6ed1005ded643f920ce5e16b04cd152e72836b714a9fd1ba4ef12ee52fbfd4fb775867afc166a753871482deeaed6656ee5450c40')
package() {
  export pkg=pufferpanel
  mkdir -p ${pkgdir}/var/www/${pkg}/
  mkdir -p ${pkgdir}/var/lib/${pkg}/
  mkdir -p ${pkgdir}/var/log/${pkg}/
  mkdir -p ${pkgdir}/etc/${pkg}/
  cp -R --no-preserve=ownership ${srcdir}/www/* "${pkgdir}/var/www/${pkg}"
  cp -R --no-preserve=ownership "${srcdir}/email/" "${pkgdir}/etc/${pkg}/"
  install -Dm 755 "${srcdir}/${pkg}" "${pkgdir}/usr/bin/${pkg}" 
  install -Dm 644 "${srcdir}/config.linux.json" "${pkgdir}/etc/${pkg}/config.json" 
  install -D "${srcdir}/pufferpanel.service" "${pkgdir}/etc/systemd/system/pufferpanel.service" 
  install -D -m 644 "${srcdir}/../pufferpanel.sysusers" "${pkgdir}/usr/lib/sysusers.d/pufferpanel.conf"
  install -D -m 644 "${srcdir}/../pufferpanel.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/pufferpanel.conf"
}
