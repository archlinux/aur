# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Nils Czernia <nils[at]czserver[dot]de>
pkgname=librenms
pkgver=1.57
pkgrel=1
pkgdesc='Autodiscovering PHP/MySQL/SNMP based network monitoring'
arch=('any')
url="https://www.librenms.org/"
license=('GPL3')
depends=('fping' 'graphviz' 'imagemagick' 'nmap' 'php-intl' 'php-gd' 'php-snmp'
'python-memcached' 'python-mysqlclient' 'rrdtool' 'whois')
makedepends=('composer' 'git' 'unzip')
optdepends=('cronie: running librenms cron jobs'
            'mariadb: use a local SQL server'
            'python-dotenv: for librenms service'
            'python-redis: for distributed librenms service')
backup=("etc/webapps/${pkgname}/config.php"
        "etc/webapps/${pkgname}/.env"
        "etc/php/conf.d/${pkgname}.ini"
        "etc/cron.d/${pkgname}")
source=("${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.uwsgi"
        "apache.example.conf"
        "nginx.example.conf")
sha512sums=('19fa542b7597adeccdb94add97102a86ba4a238ba44e999c6e8d186cb7d5ed0523893559719e0b8036acd90cdc1a908497c3027ed49b028fba729ed61ad34052'
            'ce020d1a85b9c897dacceb45840aae30e305b65d96854e19a4a58e3ddbc1c78694de1a8665a51c2fb53929f8f52c94bc0d918ab3fd06ede4935e8a617e755f24'
            'f575ed35f6fa1ae9ffd2b7c00e292de574e4a62e60fba7b653e9f55f4d987959be08331c08afa7afe8a616eb9f3a35f304912416f07ea170b70887bf8ff94c2f'
            '150aa9912d25502d9397f0c4a6831363c79c1603ff65151d4efc0061516ee19586f3cc38f08f9e60530176c103c845d0cc1a46f685cb22c1a8a7cb8db4ab6274'
            'cde868416a13353290e4063c937e13b029e616abe3416e4e7c906bbd8000f871429546335470bbc2b219c1bcc95d6ee0f79481ee765c7351bbed6487ad42fee4')

build(){
  php -d 'extension=gd' /usr/bin/composer create-project --no-dev -n ${pkgname}/${pkgname} ${pkgname}-${pkgver} ${pkgver}
  cd "${pkgname}-${pkgver}"
  # make cron jobs compatible with package locations
  # disable daily.sh (update job)
  sed -e 's|/opt/librenms|/usr/share/webapps/librenms|g' \
      -e '/daily.sh/s/^/# /' \
      -i *.cron
  # make logrotate file compatible with package locations
  sed -e 's|/opt/librenms/logs/|/var/log/librenms/|g' -i "misc/${pkgname}.logrotate"
  # make services comptible with package locations
  sed -e 's|/opt/librenms|/usr/share/webapps/librenms|g' \
      -i "misc/${pkgname}"*.service
  # make helper scripts compatible with package locations
  sed -e 's|/opt/librenms|/usr/share/webapps/librenms|g' \
      -i scripts/watchmaillog/* \
      -i scripts/Migration/{Standard_Conversion,XML_Conversion}/*
  # create (commented!) open_basedir settings for php
  # TODO: This actually needs to be massively extended to allow access to required applications
  echo '# open_basedir = ${open_basedir}:/usr/share/webapps/librenms:/etc/webapps/librenms:/proc' > ../"${pkgname}.ini"
  # enfore file permissions
  find {LibreNMS,app,doc,html,includes,mibs,resources,tests} -type f -exec chmod 644 {} +
  find {LibreNMS,app,doc,html,includes,mibs,resources,tests} -type d -exec chmod 755 {} +
}

package() {
  cd "${pkgname}-${pkgver}"
  # docs
  install -vDm 644 {AUTHORS,CHANGELOG,CODE_OF_CONDUCT,CONTRIBUTING,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  # examples
  install -vDm 644 snmp*.example ../{apache,nginx}.example.conf \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
  # cron.d
  install -vDm 644 "${pkgname}.nonroot.cron" "${pkgdir}/etc/cron.d/${pkgname}"
  # services
  install -vDm 644 "misc/${pkgname}"*.service \
    -t "${pkgdir}/usr/lib/systemd/system/"
  # files
  install -vDm 644 bootstrap/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/bootstrap"
  install -vDm 644 config/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/config"
  install -vDm 644 contrib/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/contrib"
  install -vDm 644 database/factories/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/database/factories"
  install -vDm 644 database/migrations/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/database/migrations"
  install -vDm 644 database/seeds/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/database/seeds"
  install -vDm 644 misc/*.{json,yaml,conf,rss,xml} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/misc"
  install -vDm 644 routes/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/routes"
  install -vDm 644 sql-schema/*.sql\
    -t "${pkgdir}/usr/share/webapps/${pkgname}/sql-schema"
  cp -av LibreNMS "${pkgdir}/usr/share/webapps/${pkgname}/"
  cp -av app "${pkgdir}/usr/share/webapps/${pkgname}/"
  cp -av doc "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -av html "${pkgdir}/usr/share/webapps/${pkgname}/"
  cp -av includes "${pkgdir}/usr/share/webapps/${pkgname}/"
  cp -av mibs "${pkgdir}/usr/share/webapps/${pkgname}/"
  cp -av resources "${pkgdir}/usr/share/webapps/${pkgname}/"
  cp -av scripts "${pkgdir}/usr/share/webapps/${pkgname}/"
  cp -av tests "${pkgdir}/usr/share/webapps/${pkgname}/"
  cp -av vendor "${pkgdir}/usr/share/webapps/${pkgname}/"
  # application config
  install -vDm 644 config.php.default \
    "${pkgdir}/etc/webapps/${pkgname}/config.php"
  ln -sv "/etc/webapps/${pkgname}/config.php" \
    "${pkgdir}/usr/share/webapps/${pkgname}/config.php"
  install -vDm 644 .env \
    "${pkgdir}/etc/webapps/${pkgname}/.env"
  ln -sv "/etc/webapps/${pkgname}/.env" \
    "${pkgdir}/usr/share/webapps/${pkgname}/.env"
  # logrotate.d
  install -vDm 644 "misc/${pkgname}.logrotate" \
    "${pkgdir}/etc/logrotate.d/${pkgname}"
  # php conf.d
  install -vDm 644 "../${pkgname}.ini" -t "${pkgdir}/etc/php/conf.d/"
  # sysusers.d
  install -vDm 644 ../${pkgname}.sysusers \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  # tmpfiles.d
  install -vDm 644 ../${pkgname}.tmpfiles \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  # uwsgi
  install -vDm 644 ../${pkgname}.uwsgi \
    "${pkgdir}/etc/uwsgi/${pkgname}.ini"
  # logs
  ln -sv "/var/log/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/logs"
  # cache
  ln -sv "/var/cache/${pkgname}" "${pkgdir}/usr/share/webapps/${pkgname}/cache"
  # rrd
  ln -sv "/var/lib/${pkgname}/rrd" "${pkgdir}/usr/share/webapps/${pkgname}/rrd"
  # bootstrap cache
  ln -sv "/var/lib/${pkgname}/bootstrap/cache" \
    "${pkgdir}/usr/share/webapps/${pkgname}/bootstrap/cache"
  # storage
  ln -sv "/var/lib/${pkgname}/storage" \
    "${pkgdir}/usr/share/webapps/${pkgname}/storage"
  # top-level (cron-related) scripts that require executable bit
  install -vDm 755 cronic daily.sh {poller,discovery}-wrapper.py \
    {discovery,alerts,poll-billing,billing-calculate,check-services}.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}"
  # scripts that also need executable bit for bizarre reasons (being called
  # directly from within the application)
  install -vDm 755 {build-base,irc,poller}.php \
    {librenms-service,services-wrapper,snmp-scan}.py \
    {pbin.sh,lnms} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}"
  # top-level scripts/files, that don't require executable bit
  install -vDm 644 {add{host,user},config_to_json,daily,delhost,dist-pollers,ping,renamehost,syslog,validate}.php \
    build.sql mkdocs.yml webpack.mix.js \
    -t "${pkgdir}/usr/share/webapps/${pkgname}"
  # removing unneeded git related files and folders
  find "${pkgdir}/usr/share/webapps/${pkgname}/vendor" \
    -iname "*.git*" -exec rm -rvf {} +
}
