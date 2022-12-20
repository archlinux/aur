# Maintainer: Max Meinhold <mxmeinhold@gmail.com>
# Contributor: mickael9 <mickael9@gmail.com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Inspiration for service and config files: https://github.com/Bisa/factorio-init

pkgname=factorio-headless
pkgver=1.1.74
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories - Server version (stable branch)"
arch=('x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
depends=('glibc')
conflicts=('factorio' 'factorio-demo' 'factorio-experimental' 'factorio-headless-experimental')
install=factorio-headless.install
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

sha256sums=('3bfab9744936c48b309ab18d9a8d05bfb1f3be31079f745a05409e779c0b5716'
            '72bbef31fced163e5993eff0e73a836a557165775eb77e0d69b24fe5ec4690a7'
            '40931abfd15db6027c02471c20f86923e74471a9eb91453638c42e0f968027f5'
            '87dae15d1bcfb4683faea9c66498bd916bd27f8aa0dc724c4e21076dcf17da64'
            '9bfac35f13b51fff11f21bd86f0d020570c3124bb2fde4e0a8798fa86abe1dd3')

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
