# Maintainer: Martin Rys <rys.pw/contact>
# Previous maintainers:
#  Chris Morgan <me@chrismorgan.info>
#  Carsten Feuls <archlinux dot carstenfeuls dot de>
#  Nils Czernia <nils at czserver dot de>

pkgname=matomo
pkgver=4.13.3
pkgrel=2
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
sha256sums=('d7bcb4c45cba69afd9c849bd554bc88b8fc6971769c1f5aff997623bac05e0ac'
            '5f39484c4deb6cf72b83e02a636f4f1d8b148fd86982c5737df580862bc44289')

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
