# Maintainer: Chris Morgan <me@chrismorgan.info>
# Maintainer: Carsten Feuls <archlinux dot carstenfeuls dot de>
# Co-Maintainer: Nils Czernia <nils at czserver dot de>

pkgname=matomo
pkgver=3.13.4
pkgrel=1
pkgdesc="real time web analytics platform"
arch=("any")
url="https://matomo.org/"
license=("GPL3")
depends=("php>=5.5.9" "php-gd")
replaces=("piwik")
optdepends=("mysql>=5.5: database server"
            "python2: log importer script"
            "geoip2-database: GeoIP database")
install="$pkgname.install"
source=("https://builds.matomo.org/${pkgname}-${pkgver}.tar.gz"
        "https://builds.matomo.org/${pkgname}-${pkgver}.tar.gz.asc")
backup=("usr/share/webapps/${pkgname}/piwik.js" "usr/share/webapps/${pkgname}/matomo.js")
sha256sums=("5c3ea64729b80861034b757d1a7f5255c077b9c9bd38b43f5c454a352c24a279"
            "8cfbef1ca8aef0c6c88ef75cd9bbb4c0fe34447e397f24ed9a935609c1dede3c")

validpgpkeys=("814E346FA01A20DBB04B6807B5DBD5925590A237")

package() {
  install -d "${pkgdir}/usr/share/webapps"
  cp -r "${srcdir}/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}"
  # Some extensions want to append to piwik.js (matomo.js from 3.8.0 onwards),
  # so we relectantly let them.
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

  # GeoLite2-City.mmdb is provided by geoip2-database, which is optdepends.
  # I figure a dead symlink should be safe if it’s missing.
  ln -s "../../../../../usr/share/GeoIP/GeoLite2-City.mmdb" "${pkgdir}/usr/share/webapps/matomo/misc"
}
