# Maintainer: Martin Rys <rys.pw/contact>
# Previous maintainers:
#  Chris Morgan <me@chrismorgan.info>
#  Carsten Feuls <archlinux dot carstenfeuls dot de>
#  Nils Czernia <nils at czserver dot de>

pkgname=matomo
pkgver=4.14.2
pkgrel=1
pkgdesc="A real-time web analytics platform"
arch=("any")
url="https://matomo.org/"
license=("GPL3")
depends=("php" "php-gd")
replaces=("piwik")
optdepends=("mariadb: Database server"
            "python: Log importer script"
            "geoipupdate: GeoIP database")
install="$pkgname.install"
source=("https://builds.matomo.org/${pkgname}-${pkgver}.tar.gz"
        "https://builds.matomo.org/${pkgname}-${pkgver}.tar.gz.asc")
backup=("usr/share/webapps/${pkgname}/piwik.js" "usr/share/webapps/${pkgname}/matomo.js")
sha256sums=('8cfb3fe1b82ded5a9e4a878b9f01ebf85238dba84087088ff117224033700a9a'
            '0bc92ee812f7c257bd09cdcf4269f5cb34d32ae1dd8367e310d31f00836fa0a0')

validpgpkeys=("F529A27008477483777FC23D63BB30D0E5D2C749")

package() {
  install -d "${pkgdir}/usr/share/webapps"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}"
  # Some extensions want to append to piwik.js (matomo.js from 3.8.0 onwards),
  # so we reluctantly let them.
  chmod g+w "${pkgdir}/usr/share/webapps/${pkgname}/piwik.js"
  chmod g+w "${pkgdir}/usr/share/webapps/${pkgname}/matomo.js"

  # While installing matomo, it insists on being able to write to the config directory,
  # because it creates config.ini.php. After it’s installed, you can make it read-only,
  # e.g. by `chown -R root:http /etc/webapps/${pkgname}`
  install -d "${pkgdir}/etc/webapps"
  mv "${pkgdir}/usr/share/webapps/${pkgname}/config" "${pkgdir}/etc/webapps/${pkgname}"
  ln -s "../../../../etc/webapps/${pkgname}" "${pkgdir}/usr/share/webapps/matomo/config"

  # matomo uses this tmp dir for writing its own data;
  # but it belongs in /var rather than /usr.
  rmdir "${pkgdir}/usr/share/webapps/matomo/tmp"
  install -dm700 "${pkgdir}/var/lib/webapps/matomo/tmp"
  ln -s "../../../../var/lib/webapps/matomo/tmp" "${pkgdir}/usr/share/webapps/matomo/tmp"

  # Installing or upgrading non-core plugins requires write access to plugins/;
  # we could try g+w on the directory and try to restrict core plugins, but
  # then you’ve got mixed ownership (anything it creates will be http:http
  # instead of root:http) which is nasty. Another approach is to put `plugins`
  # in /var/lib with core plugins *actually* in /usr/share and symlinked back;
  # but that’s getting too clever for my sanity at present: this is all getting
  # rather bothersome; I’m tired of messing around with PHP apps that are
  # ill-designed for hardening and not designed for use in the scope of a
  # system package manager. So for now at least, we’re just going to leave it
  # as it is, chown the whole plugins directory in matomo.install, and wash our
  # hands of it.

  # GeoLite2-City.mmdb is provided by geoipupdate, which is optdepends.
  # See /etc/GeoIP.conf and make sure to enable geoipupdate's timer
  # Keep in mind it takes a while before a newly generated license becomes active
  # I figure a dead symlink should be safe if the DB is missing.
  ln -s "../../../../../var/lib/GeoIP/GeoLite2-City.mmdb" "${pkgdir}/usr/share/webapps/matomo/misc"
}
