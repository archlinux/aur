# Maintainer: mickael9 <mickael9@gmail.com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Inspiration for service and config files: https://github.com/Bisa/factorio-init

pkgname=factorio-headless
pkgver=0.14.20
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories - Server version (stable branch)"
arch=('x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
conflicts=('factorio' 'factorio-demo' 'factorio-experimental' 'factorio-headless-experimental')
install=factorio-headless.install
backup=(etc/conf.d/factorio
        etc/factorio/server-settings.json
)

source=(LICENSE
        factorio-headless.service
        factorio-headless.conf
        factorio-headless.sysusers
        factorio_headless_x64_${pkgver}.tar.gz::http://www.factorio.com/get-download/${pkgver}/headless/linux64)
sha256sums=('67ec2f88afff5d7e0ca5fd3301b5d98655269c161a394368fa0ec49fbc0c0e21'
            'd06a47498ac5e540e8f4e653213b8bd5b21ae9424df718b9b065268f571900c6'
            '5c7b9dcb07167d680de3dd6a0435b21ee4ee448fb7f6ce429f028ee5b543e9ab'
            '87dae15d1bcfb4683faea9c66498bd916bd27f8aa0dc724c4e21076dcf17da64'
            'b665baef98de972d50367c10fdcec975d58e55509de275a27f0e848ab3d6aa45')


# no modifications needed, the executable looks for:
# - data in /usr/share/factorio
# - config in ~/.factorio

package() {
  install -Dm755 "${srcdir}/factorio/bin/x64/factorio" "$pkgdir/usr/bin/factorio"
  install -d "${pkgdir}/usr/share/factorio"
  cp -r "${srcdir}/factorio/data"/* "${pkgdir}/usr/share/factorio"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio-headless/LICENSE"

  install -Dm644 "${srcdir}/factorio-headless.sysusers" "$pkgdir/usr/lib/sysusers.d/factorio.conf"
  install -Dm644 "${srcdir}/factorio-headless.conf" "${pkgdir}/etc/conf.d/factorio"
  install -Dm644 "${srcdir}/factorio-headless.service" "${pkgdir}/usr/lib/systemd/system/factorio.service"
  install -Dm644 "${srcdir}/factorio/data/server-settings.example.json" "${pkgdir}/etc/factorio/server-settings.json"

  # public isn't really a good default especially with the default name/description
  sed -i 's/^    "public": true/    "public": false/' "${pkgdir}/etc/factorio/server-settings.json"
}
