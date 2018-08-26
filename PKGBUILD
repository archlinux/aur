# Maintainer: Flakebi <flakebi@t-online.de>

pkgname=etherdraw
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc="A real time collaborative drawing tool using nodejs, socket.io & paper.js "
arch=(any)
url="https://github.com/JohnMcLear/draw"
license=('Apache')
depends=('nodejs' 'cairo')
makedepends=('npm' 'python2')
optdepends=('sqlite: to use sqlite as databse'
            'mariadb: to use mariadb as database'
            'postgresql: to use postgresql as database')
backup=("etc/${pkgname}/settings.json")
source=("${url}/archive/master.zip"
        "${pkgname}-sysusers.conf"
        "${pkgname}-tmpfiles.conf"
        "${pkgname}.service"
        "fix-postgres.patch")
sha512sums=('SKIP'
            '6e6d41aecfae912f7c9b4b848a6bd5b287026920074e20d95c199f8e492280755d794b463db1a905bd50d95aef7802ea181f1395f80a616ff1a56c1a673cbd3a'
            '64badedd03d121a838850ac60fe526c4e9243ee0d8e7b6484255a99bbc066107b905159b5be46d2abe58ec78d62cfa182a2c832e5494403233bc130d2937f058'
            '7b5c21ddf243546bc1dca5da6c140ed59b77507b7ae1798c571cb765e2d05cf6ab36252a1aa48cd10ba8e2e8a83572924207690ad4345f1febb1754dcb218f0c'
            'c55b06bfc5bf0c0b1d171322c3aec4c2156c3f08c8e40c6dbe8dccf80444d7cbc3af46f82eef5f9d38252c84b7beb047163640d574b09f6f752cd878a9a02497')

prepare() {
  cd "draw-master"

  # create needed symlink because setup is weird
  mkdir -v node_modules && cd node_modules
  ln -vs ../src "${pkgname}"
}

build() {
  cd "draw-master"

  cd src
  # required node modules
  export PYTHON=python2
  npm install --cache "${srcdir}/npm-cache"
  cd ..
  # Patch postgres dependency
  patch -p2 -i ../../fix-postgres.patch
}

package() {
  cd "draw-master"

  install -vdm 755 "${pkgdir}/usr/share/${pkgname}/src"

  # node modules
  mv -v node_modules "${pkgdir}/usr/share/${pkgname}/"

  # protect configuration directory with restrictive permission
  install -vdm 750 "${pkgdir}/etc/${pkgname}"

  # move sources
  cp -rv src "${pkgdir}/usr/share/${pkgname}/src/"
  cp -v server.js "${pkgdir}/usr/share/${pkgname}/src/"

  # configuration
  install -vDm 644 settings.json.template \
    "${pkgdir}/etc/${pkgname}/settings.json"

  ln -vs /etc/etherdraw/settings.json "${pkgdir}/usr/share/etherdraw/"

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
    -vDm 644 {CONTRIBUTING,README}.md
}
