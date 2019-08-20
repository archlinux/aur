# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander 'gridcol' Griesbaum <agrsbm@gmail.com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=mantisbt
pkgver=2.21.2
pkgrel=1
pkgdesc='Web-based issue tracking system'
arch=('any')
url='https://www.mantisbt.org/'
license=('GPL2')
depends=('php')
optdepends=('curl: interface Twitter'
            'mariadb: use local MySQL server'
            'php-fpm: run in fastCGI process manager'
            'php-gd: generate captcha'
            'php-pgsql: use PostgreSQL database backend'
            'postgresql: use local PostgreSQL database'
            'uwsgi: run as application container')
backup=('etc/webapps/mantisbt/config_inc.php'
        'etc/webapps/mantisbt/custom_strings_inc.php'
        'etc/webapps/mantisbt/custom_relationships_inc.php'
        'etc/webapps/mantisbt/custom_functions_inc.php'
        'etc/webapps/mantisbt/custom_constants_inc.php')
source=("https://downloads.sourceforge.net/project/${pkgname}/mantis-stable/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.uwsgi")
sha512sums=('ac4dd21662ef2e8fdfac328c9591ed94d6f89bd76c451b10ad3a1c4c240f710e6f012201296fe4acab7c22796f4202bdb458268452009063169c31caf2951467'
            '3fd4e7faad7774892abfd20006ae3efcd7b0ba315447da9cea8d7352d5fd1e7f0c558d3855ad4e667a0bfe6ae0d95d12c848a78d53312521a7f551f2edca723e'
            'b1b9145d1ba423055d5e45734a9d74c639b75ae5b5d580024b50626332a74830dd39b976de590549ff1c47c400ba4e1c20b27b69fb140f7d8527d8d281d0c7bd'
            '1b36d8956986360306eb15a9279c54eba46e74dfe0623dc26b3be3e8f409ab4f0afe6b34a9001cbeb9f33452fec5ccc8089a53352fa885894cc262ca9c12bc39')
install="${pkgname}.install"

prepare() {
  cd "${pkgname}-${pkgver}"
  # create customization files
  touch "${srcdir}/custom_"{constants,functions,relationships,strings}_inc.php
  find . -type f -exec chmod -c 0644 {} \;
  find . -type d -exec chmod -c 0755 {} \;
  # remove useless scripts
  find "vendor" -type f -iname "*.py" -delete
}

package() {
  cd "${pkgname}-${pkgver}"
  # configuration
  install -vDm 640 config/config_inc.php.sample \
    "${pkgdir}/etc/webapps/${pkgname}/config_inc.php"
  install -vDm 644 ${srcdir}/*.php -t "${pkgdir}/etc/webapps/${pkgname}"
  # web application
  install -vdm 755 "${pkgdir}/usr/share/webapps/${pkgname}"
  cp -av --no-preserve='ownership' ../${pkgname}-${pkgver}/* \
    "${pkgdir}/usr/share/webapps/${pkgname}"
  # symlink configuration and customization
  for config in {config,custom_{constants,functions,relationships,strings}}_inc.php ;do
    ln -sv "/etc/webapps/${pkgname}/${config}" \
      "${pkgdir}/usr/share/webapps/${pkgname}/config/${config}"
  done
  # readme
  install -vDm 644 readme.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # tmpfiles.d
  install -vDm 644 "../${pkgname}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  # sysusers.d
  install -vDm 644 "../${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  # uWSGI
  install -vDm 644 "../${pkgname}.uwsgi" \
    "${pkgdir}/etc/uwsgi/${pkgname}.ini"
}

# vim: ts=2 sw=2 et:
