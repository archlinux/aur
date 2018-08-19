# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ruben Kelevra <ruben@freifunk-nrw.de>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

_jqueryver=1.9.1
pkgname=etherpad-lite
pkgver=1.7.0
pkgrel=1
epoch=1
pkgdesc="Lightweight fork of etherpad based on javascript"
arch=(any)
url="http://etherpad.org"
license=('Apache')
depends=('coffeescript' 'nodejs')
makedepends=('npm')
optdepends=('sqlite: to use sqlite as databse'
            'mariadb: to use mariadb as database'
            'postgresql: to use postgresql as database'
            'abiword: advanced import/export of pads'
            'libreoffice: advanced import/export of pads'
            'tidy: improve quality of exported pads')
conflicts=('etherpad-lite-git')
backup=("etc/${pkgname}/settings.json")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ether/${pkgname}/archive/${pkgver}.tar.gz"
        "jquery-${_jqueryver}.js::https://code.jquery.com/jquery-${_jqueryver}.js"
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf"
        "${pkgname}.service")
sha512sums=('6acffc4f05efd0d64774ab1908a74878eec7456e74674cfa90efe1cf873290f35c45e070511ac85d06584ec747d81031e341942f7761df4ad3ee64e1f71a21b5'
            'd62700e7a1ff41f9d6326ca024ba2be1d391bc8fbb2aeae0f427d74837899b230940bf7c2df3d193f5300a68bb3686706d4c31328234b5cda026a1bf52ef9e70'
            '8c9093cc82acb814023b60eecffae7cb697abfa6193a68ca068f010baf3bf1e5f1678bdb862f4af370badbd71deb6a8499f61c8b6115d280477db1b3fd895dfd'
            '31a411f8a93ec2bbd854545cce80eaf435b75432f876ac81df0a6d4ba2bc8437a7b9196456cb04b0a5c9b29d013be7f35501f0af48de5c2fe261d12adb3a1895'
            'b0ee72e0ab370992bd0bf5cd980d53e9222950027a0bf4a41c8085aaec8b93442d0359ef684946f61e005026ad6de5da39ab78c4d54589ecef7d27f1d76410dd')

prepare() {
  cd "${pkgname}-${pkgver}"
  # create needed initializing file
  touch src/.ep_initialized

  # create custom js and css from templates
  cp -v src/static/custom/js.template src/static/custom/index.js
  cp -v src/static/custom/js.template src/static/custom/pad.js
  cp -v src/static/custom/js.template src/static/custom/timeslider.js
  cp -v src/static/custom/css.template src/static/custom/index.css
  cp -v src/static/custom/css.template src/static/custom/pad.css
  cp -v src/static/custom/css.template src/static/custom/timeslider.css

  # write dirty.db to StateDirectory by default
  sed -i 's/var\/dirty.db/\/var\/lib\/etherpad-lite\/dirty.db/g' \
    settings.json.template

  # create needed symlink because setup is weird
  mkdir -v node_modules && cd node_modules
  ln -vs ../src "ep_${pkgname}"
}

build() {
    cd "${pkgname}-${pkgver}"

    # generating html documentation
    node bin/doc/generate doc/index.md --format=html \
      --template=doc/template.html > documentation.html

    cd src
    # required node modules
    npm install --cache "${srcdir}/npm-cache"
}

package() {
  cd "${pkgname}-${pkgver}"
  # install initialization file
  install -t "${pkgdir}/usr/share/${pkgname}/src/" \
    -vDm 644 "src/.ep_initialized"

  # node modules
  mv -v node_modules "${pkgdir}/usr/share/${pkgname}/"

  # protect configuration directory with restrictive permission
  install -vdm 750 "${pkgdir}/etc/${pkgname}"
  install -vdm 750 "${pkgdir}/etc/${pkgname}/custom"

  # custom js and css templates
  install -t "${pkgdir}/etc/${pkgname}/custom" \
    -vDm 644 "src/static/custom/"*.{css,js}
  rm -rv src/static/custom

  # move sources
  mv -v src/* "${pkgdir}/usr/share/${pkgname}/src/"

  # symlink directory for custom css and js
  ln -vs "/etc/${pkgname}/custom/" \
    "${pkgdir}/usr/share/${pkgname}/src/static/"

  # symlink needed files (not yet created)
  ln -vs "/etc/${pkgname}/SESSIONKEY.txt" \
    "${pkgdir}/usr/share/${pkgname}/SESSIONKEY.txt"
  ln -vs "/etc/${pkgname}/APIKEY.txt" \
    "${pkgdir}/usr/share/${pkgname}/APIKEY.txt"

  #jquery
  install -vDm 644 "${srcdir}/jquery-${_jqueryver}.js" \
    "${pkgdir}/usr/share/${pkgname}/src/static/js/jquery.js"

  # configuration
  install -vDm 644 settings.json.template \
    "${pkgdir}/etc/${pkgname}/settings.json"

  # systemd service
  install -vDm 644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  # systemd-sysusers
  install -vDm 644 "${srcdir}/${pkgname}-sysusers.conf" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  # systemd-tmpfiles
  install -vDm 644 "${srcdir}/${pkgname}-tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # documentation
  install -t "${pkgdir}/usr/share/doc/${pkgname}/" \
    -vDm 644 {CHANGELOG,CONTRIBUTING,README}.md \
    -vDm 644 documentation.html
}
