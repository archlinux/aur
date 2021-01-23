# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=flyspray
pkgver=1.0rc9
pkgrel=3
pkgdesc='Lightweight, web-based bug tracking system written in PHP'
url="https://www.flyspray.org/"
arch=('any')
license=('LGPL2.1')
depends=('php7' 'php7-gd')
makedepends=('composer' 'unzip')
optdepends=('graphviz: plot task dependency graphs'
            'mariadb: use local MariaDB database'
            'php7-fpm: run with FastCGI process manager'
            'php7-pgsql: use PostgreSQL database'
            'postgresql: use local PostgreSQL database'
            'uwsgi: run in application container')
backup=("etc/webapps/${pkgname}/.htaccess"
        "etc/webapps/${pkgname}/${pkgname}.conf.php")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver/rc/-rc}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "${pkgname}.uwsgi")
sha512sums=('30b297c6c993936db2e10eeea75a049b8bf42a9bd4090bbba2465de946eb04a5cde9d4b8ec88065c12f2f2dce99b9bf3d0fcdf30334fd1b77030813b8393c070'
            'ee23df991c6a42bfb139caabad861a3f945ea18d81061fdb90ace8430d4225e7db322802de4fdf36aa8191cbedab3cafd025c76f08806b7fcdb88f6eb185519e'
            '65d333b98a93cc320300bacc8d142f7150e31f4a65da96f09ab0c88e6556a120a5cab8d2c871840753eb4eec6a281d0731b1ab5524834f1281f2d073ba4983f0'
            '1f2817cd0cf3ef1a642fed7b1814e2e773b2ad3b2fd9e5df305ab5d6f6dbc8bfa38e6220380c288f252d015c810dc8c83046555e9e1a54a9b7cb805a75dbe4f2')

prepare() {
  mv -v "${pkgname}-${pkgver/rc/-rc}" "${pkgname}-${pkgver}"
  touch "${pkgname}.conf.php"
  cd "${pkgname}-${pkgver}"
  # removing forced redirect, if setup/index.php is accessible.
  # access to it should be denied via the webserver settings
  sed -e '45,82d' -i header.php
  # removing unused perl script
  rm -v setup/composerit.pl
}

build() {
  cd "${pkgname}-${pkgver}"
  php7 -d 'extension=gd' /usr/bin/composer install --no-dev
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
  # webapp
  install -vDm 644 *.{ico,php,png,txt,xml} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}"
  install -vDm 644 fonts/index.html \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/fonts/"
  install -vDm 644 includes/{.htaccess,*.php} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/includes/"
  install -vDm 644 js/*.js\
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/"
  install -vDm 644 js/callbacks/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/callbacks/"
  install -vDm 644 js/ckeditor/*.{css,js,md} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/"
  install -vDm 644 js/ckeditor/adapters/*.js \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/adapters/"
  install -vDm 644 js/ckeditor/lang/*.js \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/lang/"
  cp -ar js/ckeditor/plugins "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/"
  install -vDm 644 js/ckeditor/samples/*.{css,html,js,php} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/samples/"
  install -vDm 644 js/ckeditor/samples/assets/*.{css,jpg,php} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/samples/assets"
  install -vDm 644 js/ckeditor/samples/assets/inlineall/*.png \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/samples/assets/inlineall"
  install -vDm 644 js/ckeditor/samples/assets/outputxhtml/*.css \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/samples/assets/outputxhtml"
  install -vDm 644 js/ckeditor/samples/assets/uilanguages/*.js \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/samples/assets/uilanguages"
  cp -ar js/ckeditor/samples/plugins \
    "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/samples/"
  install -vDm 644 js/ckeditor/skins/moono/images/hidpi/*.png \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/skins/moono/images/hidpi"
  install -vDm 644 js/ckeditor/skins/moono/images/*.png \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/skins/moono/images/"
  install -vDm 644 js/ckeditor/skins/moono/*.{css,md,png} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/ckeditor/skins/moono/"
  install -vDm 644 js/jit/*.js \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/jit"
  install -vDm 644 js/jscalendar/*.{css,gif,js,php} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/jscalendar"
  install -vDm 644 js/jscalendar/lang/*.js \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/jscalendar/lang"
  install -vDm 644 js/jscalendar/skins/aqua/*.{css,gif} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/jscalendar/skins/aqua"
  install -vDm 644 js/lightbox/css/*.css \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/lightbox/css"
  install -vDm 644 js/lightbox/images/*.gif \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/lightbox/images"
  install -vDm 644 js/lightbox/js/*.js \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/lightbox/js"
  install -vDm 644 js/prototype/*.js \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/prototype"
  install -vDm 644 js/script.aculo.us/*.js \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js/script.aculo.us/"
  install -vDm 644 lang/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/lang/"
  install -vDm 644 plugins/.htaccess \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/"
  install -vDm 644 plugins/dokuwiki/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki"
  install -vDm 644 plugins/dokuwiki/conf/{.htaccess,*.{conf,php}} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/conf"
  install -vDm 644 plugins/dokuwiki/img/*.{gif,png} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/img"
  install -vDm 644 plugins/dokuwiki/inc/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/inc"
  install -vDm 644 plugins/dokuwiki/inc/geshi/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/inc/geshi"
  install -vDm 644 plugins/dokuwiki/inc/parser/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/inc/parser"
  install -vDm 644 plugins/dokuwiki/lib/exe/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/lib/exe"
  install -vDm 644 plugins/dokuwiki/lib/images/fileicons/*.{gif,php,png} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/lib/images/fileicons"
  install -vDm 644 plugins/dokuwiki/lib/images/interwiki/*.gif \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/lib/images/interwiki"
  install -vDm 644 plugins/dokuwiki/lib/images/smileys/*.gif \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/lib/images/smileys"
  install -vDm 644 plugins/dokuwiki/lib/plugins/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/lib/plugins"
  install -vDm 644 plugins/dokuwiki/lib/plugins/changelinks/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/lib/plugins/changelinks"
  install -vDm 644 plugins/dokuwiki/lib/plugins/fslink/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/lib/plugins/fslink"
  install -vDm 644 plugins/dokuwiki/lib/plugins/newline/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/dokuwiki/lib/plugins/newline"
  install -vDm 644 scripts/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/scripts"
  install -vDm 644 setup/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/setup"
  install -vDm 755 setup/*.pl \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/setup"
  install -vDm 644 setup/images/*.png \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/setup/images"
  install -vDm 644 setup/lang/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/setup/lang"
  install -vDm 644 setup/styles/*.css \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/setup/styles"
  install -vDm 644 setup/templates/*.tpl \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/setup/templates"
  for _upgrade in setup/upgrade/*; do
    install -vDm 644 "setup/upgrade/$(basename $_upgrade)/"*.{info,php,xml} \
      -t "${pkgdir}/usr/share/webapps/${pkgname}/setup/upgrade/$(basename $_upgrade)/"
  done
  install -vDm 644 tests/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/tests"
  install -vDm 644 themes/.htaccess \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/themes"
  install -vDm 644 themes/CleanFS/*.{css,html,md,png} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/themes/CleanFS"
  install -vDm 644 themes/CleanFS/*.{css,html,md,png} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/themes/CleanFS"
  install -vDm 644 themes/CleanFS/fonts/*.{eot,otf,svg,ttf,woff,woff2} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/themes/CleanFS/fonts"
  install -vDm 644 themes/CleanFS/fonts/octicons/*.{css,eot,less,svg,ttf,woff,scss,txt} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/themes/CleanFS/fonts/octicons"
  install -vDm 644 themes/CleanFS/img/*.gif \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/themes/CleanFS/img"
  for _imgs in themes/CleanFS/img/*; do
    if [ -d $_imgs ]; then
      install -vDm 644 "themes/CleanFS/img/$(basename $_imgs)"/*.png \
        -t "${pkgdir}/usr/share/webapps/${pkgname}/themes/CleanFS/img/$(basename $_imgs)"
    fi
  done
  install -vDm 644 themes/CleanFS/mime/*.png \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/themes/CleanFS/mime"
  install -vDm 644 themes/CleanFS/mime/application/*.png \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/themes/CleanFS/mime/application"
  install -vDm 644 themes/CleanFS/mime/text/*.png \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/themes/CleanFS/mime/text"
  install -vDm 644 themes/CleanFS/templates/*.tpl \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/themes/CleanFS/templates"
  # vendor
  cp -ar vendor "${pkgdir}/usr/share/webapps/${pkgname}/"
  # state
  install -vdm 750 "${pkgdir}/var/lib/${pkgname}/attachments/"
  install -vDm 644 attachments/{.htaccess,index.html} \
    -t "${pkgdir}/var/lib/${pkgname}/attachments/"
  ln -sv "/var/lib/${pkgname}/attachments" \
    "${pkgdir}/usr/share/webapps/${pkgname}/attachments"
  install -vdm 750 "${pkgdir}/var/lib/${pkgname}/avatars/"
  install -vDm 644 avatars/index.html \
    -t "${pkgdir}/var/lib/${pkgname}/avatars/"
  ln -sv "/var/lib/${pkgname}/avatars" \
    "${pkgdir}/usr/share/webapps/${pkgname}/avatars"
  # cache
  install -vdm 750 "${pkgdir}/var/cache/${pkgname}"
  install -vDm 644 cache/index.html \
    -t "${pkgdir}/var/cache/${pkgname}/"
  ln -sv "/var/cache/${pkgname}" \
    "${pkgdir}/usr/share/webapps/${pkgname}/cache"
  # config
  install -vDm 644 htaccess.dist "${pkgdir}/etc/webapps/${pkgname}/.htaccess"
  ln -sv /etc/webapps/${pkgname}/.htaccess \
    "${pkgdir}/usr/share/webapps/${pkgname}/.htaccess"
  install -vDm 660 "../${pkgname}.conf.php" \
    -t "${pkgdir}/etc/webapps/${pkgname}"
  ln -sv /etc/webapps/${pkgname}/${pkgname}.conf.php \
    "${pkgdir}/usr/share/webapps/${pkgname}/${pkgname}.conf.php"
  # remove unneeded python scripts from vendor libraries
  find "${pkgdir}/usr/share/webapps/${pkgname}/vendor" -type f -iname "*.py" -delete
}
# vim: ts=2 sw=2 et:
