# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writefreely
pkgver=0.6.0
pkgrel=1
pkgdesc='Federated blogging from write.as'
arch=('x86_64')
url='https://writefreely.org/'
license=('AGPL3')
optdepends=('sqlite: For SQLite support',
            'mariadb: For MariaDB support')
backup=('var/lib/writefreely/config.ini')
install=writefreely.install
source=('writefreely.tmpfiles'
        'writefreely-sysusers.conf'
        'writefreely.service'
        'config.ini'
        "https://github.com/writeas/writefreely/releases/download/v${pkgver}/writefreely_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fe04838284663b3725d5bb1cd82ca8fbe180512d59200c88b0a5829f8e390b2d'
            '6c74c81e27165851daf20d4bcf958227342f063aa3ec53b1cb86a56dac565f10'
            'dbb332d30c49a8b9f8a1f926c0b3439c1487d395fbef979481f9e76e53a3bcaa'
            '6946f0211b25743451954d2c155222df2aeaf7f49c3fafcb9183c6fc62a95ef9'
            '9faec39501ea24cc7e76b6b3dc3476d84cf8a2a51ac9d54dcb79dfbe6e53f941')

package() {
  # -o writefreely -g writefreely
  install -dm770 "${pkgdir}"/var/lib/writefreely/data
  install -dm770 "${pkgdir}"/var/lib/writefreely/keys
  install -dm770 "${pkgdir}"/var/lib/writefreely/pages
  install -dm770 "${pkgdir}"/var/lib/writefreely/static
  install -dm770 "${pkgdir}"/var/lib/writefreely/templates
  install -Dm644 writefreely.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm755 writefreely "${pkgdir}"/usr/bin/writefreely
  install -Dm644 writefreely.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/writefreely.conf
  install -Dm644 writefreely-sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/writefreely.conf

  # These files should probably be in /usr/share and /etc but writefreely
  # expects everything in the same directory.
  install -Dm644 config.ini "${pkgdir}"/var/lib/writefreely/config.ini
  install -Dm644 schema.sql "${pkgdir}"/var/lib/writefreely/schema.sql
  cp -r pages/* "${pkgdir}"/var/lib/writefreely/pages
  cp -r static/* "${pkgdir}"/var/lib/writefreely/static
  cp -r templates/* "${pkgdir}"/var/lib/writefreely/templates
}

# vim: ts=2 sw=2 et:
