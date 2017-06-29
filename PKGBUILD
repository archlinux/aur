# Maintainer: mickael9 <mickael9@gmail.com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Inspiration for service and config files: https://github.com/Bisa/factorio-init

pkgname=factorio-headless-experimental
pkgver=0.15.25
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
)

source=(LICENSE
        factorio-headless.service
        factorio-headless.conf
        factorio-headless.sysusers
        factorio_headless_x64_${pkgver}.tar.xz::http://www.factorio.com/get-download/${pkgver}/headless/linux64
)

sha256sums=('67ec2f88afff5d7e0ca5fd3301b5d98655269c161a394368fa0ec49fbc0c0e21'
            'ab67c31cd6ef6ad2477f1e7daa534f73972ef69e1b39932bd8fa1e35e01bf98b'
            'b85c31d17bdce596a6d3b33b8f72954e5719ac54b071a8af82702ac5d35fac6c'
            '87dae15d1bcfb4683faea9c66498bd916bd27f8aa0dc724c4e21076dcf17da64'
            'c7ea6045a4f35dccdfefb3dd263db08168e414975ada2f5500eb4ad51534a5e0')


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
