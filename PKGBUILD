# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ruben Kelevra <ruben@freifunk-nrw.de>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

_jqueryver=1.9.1
pkgname=etherpad-lite
pkgver=1.6.2
pkgrel=2
epoch=1
pkgdesc="Lightweight fork of etherpad based on javascript"
arch=(any)
url="http://etherpad.org"
license=('Apache')
depends=('nodejs' 'coffeescript' 'gnuplot')
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
        "jquery.js::https://code.jquery.com/jquery-${_jqueryver}.js"
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf"
        "${pkgname}.service")
sha512sums=('58e996bde1992b9a05d27f2d56b15107c1eadf40164ed5e0645f245fe9040dcd40f6bd78feb842a9e1a8a44a232bbbeb80686e8d1564a8e67f74b44f942c0e55'
            'd62700e7a1ff41f9d6326ca024ba2be1d391bc8fbb2aeae0f427d74837899b230940bf7c2df3d193f5300a68bb3686706d4c31328234b5cda026a1bf52ef9e70'
            'ca3588610b2d8abc67ef1bd83a079f49e0b980768e1f968869be01721026506ed15cf280cac5a60c26b2bb7a248ffffb78883eced89581e982260efad1af68a3'
            '31a411f8a93ec2bbd854545cce80eaf435b75432f876ac81df0a6d4ba2bc8437a7b9196456cb04b0a5c9b29d013be7f35501f0af48de5c2fe261d12adb3a1895'
            'b54ea26a6918c817b58d950fb9afa07e069b8d2e8c343017a9e52cd17221710fcf9c875e1f8089b773df0ed5de419e6db2c379259863fb6f15afe6ca14bec06b')

prepare() {
  cd "${pkgname}-${pkgver}"
  # create needed initializing file
  touch src/.ep_initialized
  # create custom js and css from templates
  cp src/static/custom/js.template src/static/custom/index.js
  cp src/static/custom/js.template src/static/custom/pad.js
  cp src/static/custom/js.template src/static/custom/timeslider.js
  cp src/static/custom/css.template src/static/custom/index.css
  cp src/static/custom/css.template src/static/custom/pad.css
  cp src/static/custom/css.template src/static/custom/timeslider.css

  # write dirty.db to StateDirectory by default
  sed -i 's/var\/dirty.db/\/var\/lib\/etherpad-lite\/dirty.db/g' \
    settings.json.template

  # create needed symlink because setup is weird
  mkdir node_modules && cd node_modules
  ln -s ../src "ep_${pkgname}"
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
  install -t "${pkgdir}/usr/share/${pkgname}/src/" -Dm644 \
    "src/.ep_initialized"

  # node modules
  mv node_modules "${pkgdir}/usr/share/${pkgname}/"

  # custom js and css templates
  install -t "${pkgdir}/etc/${pkgname}/custom" -Dm0640 \
    "src/static/custom/"*.{css,js}
  rm -r src/static/custom

  # move sources
  mv src/* "${pkgdir}/usr/share/${pkgname}/src/"

  # symlink directory for custom css and js
  ln -s "/etc/${pkgname}/custom/" \
    "${pkgdir}/usr/share/${pkgname}/src/static/"

  # symlink needed files (not yet created)
  ln -s /var/lib/etherpad-lite/SESSIONKEY.txt \
    "${pkgdir}/usr/share/${pkgname}/SESSIONKEY.txt"
  ln -s /var/lib/etherpad-lite/APIKEY.txt \
    "${pkgdir}/usr/share/${pkgname}/APIKEY.txt"

  #jquery
  install -Dm0644 "${srcdir}/jquery.js" \
    "${pkgdir}/usr/share/${pkgname}/src/static/js/jquery.js"

  # configuration
  install -Dm0644 settings.json.template \
    "${pkgdir}/etc/${pkgname}/settings.json"

  # systemd service
  install -Dm0644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  # systemd-sysusers
  install -Dm0644 "${srcdir}/${pkgname}-sysusers.conf" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  # systemd-tmpfiles
  install -Dm0644 "${srcdir}/${pkgname}-tmpfiles.conf" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # documentation
  install -Dm0644 CHANGELOG.md \
    "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm0644 CONTRIBUTING.md \
    "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm0644 documentation.html \
    "${pkgdir}/usr/share/doc/${pkgname}/documentation.html"
}
