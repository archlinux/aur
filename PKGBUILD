# Maintainer: mickael9 <mickael9@gmail.com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Inspiration for service and config files: https://github.com/Bisa/factorio-init

pkgname=factorio-headless-experimental
pkgver=0.18.16
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories - Server version (experimental branch)"
arch=('x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
conflicts=('factorio' 'factorio-demo' 'factorio-headless' 'factorio-experimental')
provides=("factorio-headless=$pkgver")
install=factorio-headless.install
options=(!strip)
backup=(etc/conf.d/factorio
        etc/factorio/server-settings.json
        etc/factorio/map-gen-settings.json
        etc/factorio/map-settings.json
)

source=(LICENSE
        factorio-headless.service
        factorio-headless.conf
        factorio-headless.sysusers
        factorio_headless_x64_${pkgver}.tar.xz::http://www.factorio.com/get-download/${pkgver}/headless/linux64
)

sha256sums=('8859e0c8650bd90a7ff35f6ec15df91cbbc5ef6ffab6119876731feb811861d1'
            '72bbef31fced163e5993eff0e73a836a557165775eb77e0d69b24fe5ec4690a7'
            'd384e69bac3807006b0af787d1c5dcd9f247ad49c7250ac18a3737763d755d47'
            '87dae15d1bcfb4683faea9c66498bd916bd27f8aa0dc724c4e21076dcf17da64'
            '114c5bc3211ede106c9e16472fcbad8d9918994d1d3b8e3b16fa0ade8038c368')


# no modifications needed, the executable looks for:
# - data in /usr/share/factorio
# - config in ~/.factorio

package() {
  install -Dm755 "${srcdir}/factorio/bin/x64/factorio" "${pkgdir}/usr/bin/factorio"
  install -d "${pkgdir}/usr/share/factorio"
  cp -r "${srcdir}/factorio/data"/* "${pkgdir}/usr/share/factorio"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/factorio-headless.sysusers" "${pkgdir}/usr/lib/sysusers.d/factorio.conf"
  install -Dm644 "${srcdir}/factorio-headless.conf" "${pkgdir}/etc/conf.d/factorio"
  install -Dm644 "${srcdir}/factorio-headless.service" "${pkgdir}/usr/lib/systemd/system/factorio.service"
  # server-settings.json can contain sensitive data so we need to make it only readable by the factorio user
  install -Dm600 "${srcdir}/factorio/data/server-settings.example.json" "${pkgdir}/etc/factorio/server-settings.json"
  install -Dm644 "${srcdir}/factorio/data/map-gen-settings.example.json" "${pkgdir}/etc/factorio/map-gen-settings.json"
  install -Dm644 "${srcdir}/factorio/data/map-settings.example.json" "${pkgdir}/etc/factorio/map-settings.json"

  # public isn't really a good default especially with the default name/description
  sed -i 's/^    "public": true/    "public": false/' "${pkgdir}/etc/factorio/server-settings.json"
}
