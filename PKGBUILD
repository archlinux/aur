# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ruben Kelevra <ruben@freifunk-nrw.de>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

_jqueryver=1.12.4
pkgname=etherpad-lite
pkgver=1.8.0
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
backup=("etc/${pkgname}/settings.json"
        "etc/${pkgname}/credentials.json"
        "etc/${pkgname}/APIKEY.txt"
        "etc/${pkgname}/SESSIONKEY.txt")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ether/${pkgname}/archive/${pkgver}.tar.gz"
        "jquery-${_jqueryver}.js::https://code.jquery.com/jquery-${_jqueryver}.js"
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf"
        "${pkgname}.service")
sha512sums=('47dc18dcb2ebcf2cd3320e79519f0a1809ae49c1bffb2089c169e7cfc58f331fc9511fdb1f7894f4605db4a5bf28680ec39b4430860bdd62a3a989d7e1cbdd38'
            '8cac69ec91c437aa5e126ce683a6bb5c904e44d4c1d084c3d8f8bee85524735e8f09a340257d9a859d5e8e7d69d6e637ecfc728ab9ffd0e30d65b2136c48378f'
            '8c9093cc82acb814023b60eecffae7cb697abfa6193a68ca068f010baf3bf1e5f1678bdb862f4af370badbd71deb6a8499f61c8b6115d280477db1b3fd895dfd'
            'f1be6d7094ea0dd267fba21c7c64017de6a63974e193720100d49eba07170a078d43f0b76c96e6453b8e9e94cdc24b36fb7ab14218598d65d1455418daf9e447'
            'b0ee72e0ab370992bd0bf5cd980d53e9222950027a0bf4a41c8085aaec8b93442d0359ef684946f61e005026ad6de5da39ab78c4d54589ecef7d27f1d76410dd')

prepare() {
  cd "${pkgname}-${pkgver}"
  # create needed initializing file
  touch src/.ep_initialized
  # write dirty.db to StateDirectory by default
  sed -i 's/var\/dirty.db/\/var\/lib\/etherpad-lite\/dirty.db/g' \
    settings.json.template
  # create empty APIKEY.txt, SESSIONKEY.txt
  touch {APIKEY,SESSIONKEY}.txt
  # create a valid (but empty credentials.json file
  echo "{}" > credentials.json
  # create needed symlink because setup is weird
  mkdir -v node_modules && cd node_modules
  ln -vs ../src "ep_${pkgname}"
}

build() {
  cd "${pkgname}-${pkgver}"
  # generating html documentation
  node bin/doc/generate doc/index.md --format=html \
    --template=doc/template.html > documentation.html
  (
    cd src
    # required node modules
    npm install --cache "${srcdir}/npm-cache"
    npm audit || echo "npm audit output might return non-zero"
  )
  find . -type f \
          \( \
         -iname '*.1' -o \
         -iname '*.5' -o \
         -iname '*.7' -o \
         -iname '*info' -o \
         -iname '*.py' -o \
         -iname '*samples' \
         \) \
         -delete
  find . -type d \
          \( \
         -iwholename '*/man1' -o \
         -iwholename '*/man5' -o \
         -iwholename '*/man7' -o \
         -iwholename '*/man' \
         \) \
         -delete
}

package() {
  cd "${pkgname}-${pkgver}"
  # install initialization file
  install -vDm 644 "src/.ep_initialized" \
    -t "${pkgdir}/usr/share/${pkgname}/src/"
  # node modules
  cp -av node_modules "${pkgdir}/usr/share/${pkgname}/"
  # protect configuration directory with restrictive permission
  install -vdm 755 "${pkgdir}/etc/${pkgname}"
  install -vdm 755 "${pkgdir}/etc/${pkgname}/no-skin"
  # custom js and css templates
  install -t "${pkgdir}/etc/${pkgname}/no-skin" \
    -vDm 644 "src/static/skins/no-skin/"*.{css,js}
  rm -rv src/static/skins/no-skin/
  # move sources
  cp -av src/* "${pkgdir}/usr/share/${pkgname}/src/"
  # symlink directory for custom css and js
  ln -vs "/etc/${pkgname}/no-skin/" \
    "${pkgdir}/usr/share/${pkgname}/src/static/skins/"
  #jquery
  install -vDm 644 "${srcdir}/jquery-${_jqueryver}.js" \
    "${pkgdir}/usr/share/${pkgname}/src/static/js/jquery.js"
  # configuration
  install -vDm 640 settings.json.template \
    "${pkgdir}/etc/${pkgname}/settings.json"
  install -vDm 640 credentials.json \
    -t "${pkgdir}/etc/${pkgname}"
  install -vDm 640 {APIKEY,SESSIONKEY}.txt \
    -t "${pkgdir}/etc/${pkgname}"
  # symlink configuration files
  ln -vs "/etc/${pkgname}/credentials.json" \
    "${pkgdir}/usr/share/${pkgname}/credentials.json"
  ln -vs "/etc/${pkgname}/SESSIONKEY.txt" \
    "${pkgdir}/usr/share/${pkgname}/SESSIONKEY.txt"
  ln -vs "/etc/${pkgname}/APIKEY.txt" \
    "${pkgdir}/usr/share/${pkgname}/APIKEY.txt"
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
