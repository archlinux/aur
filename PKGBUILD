# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=flyspray
pkgver=1.0rc10
pkgrel=2
pkgdesc='Lightweight, web-based bug tracking system written in PHP'
url="https://www.flyspray.org/"
arch=('any')
license=('LGPL2.1')
depends=('php' 'php-gd')
makedepends=('composer' 'unzip')
optdepends=('graphviz: plot task dependency graphs'
            'mariadb: use local MariaDB database'
            'php-fpm: run with FastCGI process manager'
            'php-pgsql: use PostgreSQL database'
            'postgresql: use local PostgreSQL database'
            'uwsgi-plugin-php: run in application container')
backup=("etc/webapps/${pkgname}/.htaccess"
        "etc/webapps/${pkgname}/${pkgname}.conf.php")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver/rc/-rc}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.uwsgi")
sha512sums=('b6d4d786a013141940a9c9f6047a85f39d7a56978a5882c53f101457f6fca2635e1a3727f2c95c7ddbb44527c12a408873640e6cbb832d09eef27183fb4d10e3'
            'ee23df991c6a42bfb139caabad861a3f945ea18d81061fdb90ace8430d4225e7db322802de4fdf36aa8191cbedab3cafd025c76f08806b7fcdb88f6eb185519e'
            '65d333b98a93cc320300bacc8d142f7150e31f4a65da96f09ab0c88e6556a120a5cab8d2c871840753eb4eec6a281d0731b1ab5524834f1281f2d073ba4983f0'
            'a236f32e46b1ef9574fde8201c18f09edcd72ad2a53fc5c88f1b8da7540ac55a936da69e3af096b1c73155882cdfe3343dd2f0242de9b6b7ca6713752a1a3343')
b2sums=('ede853846d898c41c42d7bdec720ede685fd4ed285c5ab014425f7e1d0b2fb2b3122ac598b653acac0e92e7dfa7dd87b4fd9cdd0e42e313653ae336983453f27'
        '93ab7184cceaa6148dcf4161fe6a680cae105859697373021b9f027d85bbad0f0c7ee02b7800305df26858c1b39e70dd4dadf2f539f6659215d159ac6a3151c5'
        'f2c6b9137747aca24875d113251011b1759402372d25de3771ce5d11461fdc530ca000c3490f8b76d567302c8abf3ba95d5a0f831d34164225a99516745f38f3'
        '075ca6cc87246491d5981414ff3e0cd84ce466034fc8afe025fc9d272f295a13d6e19496c8abe3c8db8fbd9a9c1b579c78230f06797527722bae7817255f4e47')

prepare() {
  mv -v "${pkgname}-${pkgver/rc/-rc}" "${pkgname}-${pkgver}"
  touch "${pkgname}.conf.php"
  cd "${pkgname}-${pkgver}"
  # removing forced redirect, if setup/index.php is accessible.
  # access to it should be denied via the webserver settings
  sed -e '45,82d' -i header.php
}

build() {
  cd "${pkgname}-${pkgver}"
  php -d 'extension=gd' /usr/bin/composer install --no-dev
}

package() {
  cd "${pkgname}-${pkgver}"
  # sysusers.d integration
  install -vDm 644 ../${pkgname}.sysusers \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  # tmpfiles.d integration
  install -vDm 644 ../${pkgname}.tmpfiles \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  # uwsgi integration
  install -vDm 644 ../${pkgname}.uwsgi \
    "${pkgdir}/etc/uwsgi/${pkgname}.ini"
  # docs
  install -vDm 644 {docs/*.txt,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  rm -rv docs
  install -vdm 755 "${pkgdir}/usr/share/webapps/${pkgname}/"
  # state
  install -vdm 750 "${pkgdir}/var/lib/${pkgname}/attachments/"
  install -vDm 644 attachments/{.htaccess,index.html} \
    -t "${pkgdir}/var/lib/${pkgname}/attachments/"
  rm -rv attachments
  ln -sv "/var/lib/${pkgname}/attachments" \
    "${pkgdir}/usr/share/webapps/${pkgname}/attachments"
  install -vdm 750 "${pkgdir}/var/lib/${pkgname}/avatars/"
  install -vDm 644 avatars/index.html \
    -t "${pkgdir}/var/lib/${pkgname}/avatars/"
  rm -rv avatars
  ln -sv "/var/lib/${pkgname}/avatars" \
    "${pkgdir}/usr/share/webapps/${pkgname}/avatars"
  # cache
  install -vdm 750 "${pkgdir}/var/cache/${pkgname}"
  install -vDm 644 cache/index.html \
    -t "${pkgdir}/var/cache/${pkgname}/"
  rm -rv cache
  ln -sv "/var/cache/${pkgname}" \
    "${pkgdir}/usr/share/webapps/${pkgname}/cache"
  # config
  install -vDm 644 htaccess.dist "${pkgdir}/etc/webapps/${pkgname}/.htaccess"
  rm -v htaccess.dist
  ln -sv /etc/webapps/${pkgname}/.htaccess \
    "${pkgdir}/usr/share/webapps/${pkgname}/.htaccess"
  install -vDm 660 "../${pkgname}.conf.php" \
    -t "${pkgdir}/etc/webapps/${pkgname}"
  ln -sv /etc/webapps/${pkgname}/${pkgname}.conf.php \
    "${pkgdir}/usr/share/webapps/${pkgname}/${pkgname}.conf.php"

  # install webapp
  find . -type f -exec install -vDm 644 {} "${pkgdir}/usr/share/webapps/${pkgname}/"{} \;
  # remove unneeded files
  find "${pkgdir}/usr/share/webapps/${pkgname}" -type f \
    \( \
    -iname "*.py" -or \
    -iname "*.gitignore" -or \
    -iname "*.travis.yml" -or \
    -iname "*composer.lock" -or \
    -iname "*composer.json" \
    \) \
    -delete
}
# vim: ts=2 sw=2 et:
