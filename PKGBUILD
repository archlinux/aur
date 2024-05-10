# Maintainer: Matthieu Ippersiel <matthieu.ippersiel@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander 'gridcol' Griesbaum <agrsbm@gmail.com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=mantisbt
pkgver=2.26.1
pkgrel=1
pkgdesc="Web-based issue tracking system"
arch=(any)
url="https://www.mantisbt.org/"
license=(GPL2)
depends=(php)
optdepends=(
  'curl: interface Twitter'
  'mariadb: use local MySQL server'
  'php-fpm: run in fastCGI process manager'
  'php-gd: generate captcha'
  'php-pgsql: use PostgreSQL database backend'
  'postgresql: use local PostgreSQL database'
  'uwsgi-plugin-php: run as application container'
)
backup=(
  "etc/webapps/${pkgname}/config_inc.php"
  "etc/webapps/${pkgname}/custom_strings_inc.php"
  "etc/webapps/${pkgname}/custom_relationships_inc.php"
  "etc/webapps/${pkgname}/custom_functions_inc.php"
  "etc/webapps/${pkgname}/custom_constants_inc.php"
  "etc/uwsgi/${pkgname}.ini"
)
# building from source requires dead tooling for documentation:
# https://mantisbt.org/bugs/view.php?id=27140
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/release-${pkgver}.tar.gz"
source=(
  "https://downloads.sourceforge.net/project/${pkgname}/mantis-stable/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
  "${pkgname}.uwsgi"
)
sha512sums=('9d4b47d7c6df286205baa7d38bb3b9dee65f590cd7d57959721a79281807cd5845f6da94e1d24da8dffac74a0787a7c2fcc687c5e50d0d5343abe9f0c35417b5'
  '3fd4e7faad7774892abfd20006ae3efcd7b0ba315447da9cea8d7352d5fd1e7f0c558d3855ad4e667a0bfe6ae0d95d12c848a78d53312521a7f551f2edca723e'
  '6f6c6ca7cafeb3f76ba0aa62af1a7adb39b87d7db201b30a52d57507b1333cdffd60ae787b15c97919380a7a133daef73bd22fde5cccda2d5b98f54b32049c5b'
  'e0ff53f4465fb2f73ef87ed9a036ad87e2d9c9fe40bd5562ba79282d019ff643205b7c55b0263fde6d55076b191c5a7e51a3cd4857dfc61cdfbf275accf08944')
b2sums=('7c7cae3755cd96d8b4e68c319b792d01093da6f7cbae112d0d6b6b46aa51ed7d967cb38a4baff168aa7fd90a7bbb0aed4bfbc44a9fb4c0aded9b8d10e0bddf92'
  'a533265d7bbbf1ae059a128baa43fb639e803094c62179252b416957fcfdb43a6068182d2bf29003c8fa55757a95bb1c3f054622bb0926055819c5dc989fe067'
  '39b7704651933f3f153909e9b3900a65b24fc99eaa652c9b42affdaf1bb0b8383105573d7c8d9e6aa94250b9e5ea7b4ccc0dd781dbc888421930bc64773aa130'
  '9c57af5d108c10c21a5f5c049716bdfe310d227f9932318e8f4c2904f18780a8536f5e2817717518a7158973bd9a555dfcb6e713eeef810634282765feedde69')
install="${pkgname}.install"

prepare() {
  # Create customization files
  touch custom_{constants,functions,relationships,strings}_inc.php

  # Remove useless scripts
  find "${pkgname}-${pkgver}/vendor" -type f -iname "*.py" -delete
}

package() {
  cd "${pkgname}-${pkgver}"
  # Configuration and add suggestion disk location as per package structure
  install -Dm 640 config/config_inc.php.sample "${pkgdir}/etc/webapps/${pkgname}/config_inc.php"
  rm config/config_inc.php.sample
  sed -i "/^# \\\$g_absolute_path_default_upload_folder/s|''|'/var/lib/${pkgname}/|" "${pkgdir}/etc/webapps/${pkgname}/config_inc.php"
  install -Dm 644 ../*.php -t "${pkgdir}/etc/webapps/${pkgname}/"

  # Doc
  install -Dm 644 ./*.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  rm ./*.md

  # Web application
  find . -type f -exec install -Dm 644 {} "${pkgdir}/usr/share/webapps/${pkgname}/"{} \;

  # Symlink configuration and customization
  for config in {config,custom_{constants,functions,relationships,strings}}_inc.php; do
    ln -s "/etc/webapps/${pkgname}/${config}" "${pkgdir}/usr/share/webapps/${pkgname}/config/${config}"
  done

  # tmpfiles.d
  install -Dm 644 ../${pkgname}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # sysusers.d
  install -Dm 644 ../${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  # uWSGI
  install -Dm 644 ../${pkgname}.uwsgi "${pkgdir}/etc/uwsgi/${pkgname}.ini"
}
