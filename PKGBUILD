# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander 'gridcol' Griesbaum <agrsbm@gmail.com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=mantisbt
pkgver=2.24.0
pkgrel=1
pkgdesc='Web-based issue tracking system'
arch=('any')
url="https://www.mantisbt.org/"
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
sha512sums=('e782a47e84f86b394e47053d4c39a951ea08323bbb5deb96f40f8e533d47c62583f06592e158e559812aca6f8f5037c985108104c261618bb27b4d279ba9ec73'
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
  install -vDm 644 *.{php,sample} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}"
  install -vDm 644 admin/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/admin"
  install -vDm 644 admin/check/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/admin/check"
  install -vDm 644 api/rest/{.htaccess,*.{config,json,php}} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/api/rest"
  install -vDm 644 api/rest/restcore/{.htaccess,*.php} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/api/rest/restcore"
  install -vDm 644 api/soap/*.{php,wsdl,xsl} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/api/soap"
  install -vDm 644 config/{.htaccess,*.config} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/config"
  install -vDm 644 core/{.htaccess,*.{php,config}} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/core"
  install -vDm 644 core/cfdefs/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/core/cfdefs"
  install -vDm 644 core/classes/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/core/classes"
  install -vDm 644 core/commands/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/core/commands"
  install -vDm 644 core/exceptions/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/core/exceptions"
  install -vDm 644 css/*.{css,php} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/css"
  install -vDm 644 css/images/*.{gif,jpg,png} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/css/images"
  install -vDm 644 doc/{.htaccess,*.{config,png,txt}} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/doc"
  for _guide in {Admin_Guide,Developers_Guide}; do
    install -vDm 644 doc/en-US/${_guide}/*.{pdf,txt} \
      -t "${pkgdir}/usr/share/webapps/${pkgname}/doc/en-US/${_guide}"
    for _html_type in {html-desktop,html-single-plain}; do
      install -vDm 644 doc/en-US/${_guide}/${_html_type}/*.html \
        -t "${pkgdir}/usr/share/webapps/${pkgname}/doc/en-US/${_guide}/${_html_type}"
      install -vDm 644 doc/en-US/${_guide}/${_html_type}/Common_Content/css/*.css \
        -t "${pkgdir}/usr/share/webapps/${pkgname}/doc/en-US/${_guide}/${_html_type}/Common_Content/css"
      install -vDm 644 doc/en-US/${_guide}/${_html_type}/Common_Content/images/*.{png,svg} \
        -t "${pkgdir}/usr/share/webapps/${pkgname}/doc/en-US/${_guide}/${_html_type}/Common_Content/images"
      install -vDm 644 doc/en-US/${_guide}/${_html_type}/images/*.png \
        -t "${pkgdir}/usr/share/webapps/${pkgname}/doc/en-US/${_guide}/${_html_type}/images"
    done
  done
  install -vDm 644 fonts/{.htaccess,*.{eot,svg,ttf,woff,woff2}} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/fonts"
  install -vDm 644 images/*.{gif,ico,png} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/images"
  install -vDm 644 js/*.js \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/js"
  install -vDm 644 lang/{.htaccess,README,*.{config,txt}} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/lang"
  install -vDm 644 library/{.htaccess,README.md,*.config} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/library"
  install -vDm 644 library/rssbuilder/*.{html,php,txt} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/library/rssbuilder"
  install -vDm 644 library/rssbuilder/doc/*.{css,htm} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/library/rssbuilder/doc"
  install -vDm 644 plugins/{.htaccess,*.config} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins"
  install -vDm 644 plugins/Gravatar/*.{php,md} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/Gravatar"
  install -vDm 644 plugins/Gravatar/lang/*.txt \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/Gravatar/lang"
  install -vDm 644 plugins/MantisCoreFormatting/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/MantisCoreFormatting"
  install -vDm 644 plugins/MantisCoreFormatting/core/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/MantisCoreFormatting/core"
  install -vDm 644 plugins/MantisCoreFormatting/lang/*.txt \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/MantisCoreFormatting/lang"
  install -vDm 644 plugins/MantisCoreFormatting/pages/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/MantisCoreFormatting/pages"
  install -vDm 644 plugins/MantisGraph/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/MantisGraph"
  install -vDm 644 plugins/MantisGraph/core/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/MantisGraph/core"
  install -vDm 644 plugins/MantisGraph/files/*.js \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/MantisGraph/files"
  install -vDm 644 plugins/MantisGraph/lang/*.txt \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/MantisGraph/lang"
  install -vDm 644 plugins/MantisGraph/pages/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/MantisGraph/pages"
  install -vDm 644 plugins/XmlImportExport/*.{php,dtd} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/XmlImportExport"
  install -vDm 644 plugins/XmlImportExport/ImportXml/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/XmlImportExport/ImportXml"
  install -vDm 644 plugins/XmlImportExport/lang/*.txt \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/XmlImportExport/lang"
  install -vDm 644 plugins/XmlImportExport/pages/*.php \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/plugins/XmlImportExport/pages"
  install -vDm 644 scripts/{.htaccess,*.{config,md,php}} \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/scripts"
  install -vDm 755 scripts/*.sh \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/scripts"
  # webapp vendor
  install -vDm 644 vendor/.htaccess \
    -t "${pkgdir}/usr/share/webapps/${pkgname}/vendor"
  cp -av --no-preserve='ownership' ../${pkgname}-${pkgver}/vendor/* \
    "${pkgdir}/usr/share/webapps/${pkgname}/vendor"
  # symlink configuration and customization
  for config in {config,custom_{constants,functions,relationships,strings}}_inc.php ;do
    ln -sv "/etc/webapps/${pkgname}/${config}" \
      "${pkgdir}/usr/share/webapps/${pkgname}/config/${config}"
  done
  # doc
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
