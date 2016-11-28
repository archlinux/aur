# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>

pkgname=gitea
pkgname=${pkgname}
pkgver=0.9.97
pkgrel=1
pkgdesc="Git with a cup of tea, forked from Gogs. Is a Self Hosted Git Service in the Go Programming Language."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
changelog=$pkgname.changelog
url="http://gitea.io"
license=('MIT')
depends=('git')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
makedepends=('go>=1.2' 'git' 'patch')
conflicts=('gogs-bin' 'gogs-git' 'gogs-git-dev' 'gitea-git' 'gitea-git-dev')
options=('!strip' '!emptydirs')
backup=('srv/gitea/conf/app.ini')

install=gitea.install

_gourl=github.com/go-gitea
source=('gitea.service'
        'app.ini.patch'
        "https://github.com/go-gitea/${pkgname}/releases/tag/v${pkgver}")

sha512sums=('2b4303f850e3b13b2fc3c9f0bc5820dae431d228002b35f01be0d4bfbcf05de8dcec2a559a85e318b609e4a4d492d44306eadf5f6508fd72333b198661bb0bb7'
            '809c7668a508e792a32eed7242d9bd1093137668aef7baada0bf7064a1fbb1610468dbf632c9548e268f92b97a61ee0b947a95560b15f88a22588da2d50801c2'
            'f64a8b2d3d2cf7a11b4188320c38fe1ebdf6c5d4a0d31af8181c8a05a48d0f829e6cc93f0a57f56a5d253081ae738b5e05ff1c4c5507406726269f0879bc8050')


prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  mv "${pkgname}" "${srcdir}/src/${_gourl}/${pkgname}"
  msg2 "go get"
  GOPATH="${srcdir}" go get -tags "sqlite redis memcache" "${_gourl}/${pkgname}"
  
  msg2 "Patch: GITEA app.ini"
  patch -Np1 -i "${srcdir}/app.ini.patch" "${srcdir}/src/${_gourl}/${pkgname}/conf/app.ini"
}

build() {
  msg2 "Build program"
  cd ${srcdir}/src/${_gourl}/${pkgname}
  GOPATH="${srcdir}" go fix
  GOPATH="${srcdir}" go build -tags "sqlite redis memcache cert"
}

package() {
  install -D -m 0755 "${srcdir}/src/${_gourl}/${pkgname}/${pkgname}" "${pkgdir}/usr/share/${pkgname}/${pkgname}"

  cp -r "${srcdir}/src/${_gourl}/${pkgname}/conf" "${pkgdir}/usr/share/${pkgname}"
  install -d "${pkgdir}/usr/share/themes/${pkgname}/default/"
  cp -r "${srcdir}/src/${_gourl}/${pkgname}/public" "${pkgdir}/usr/share/themes/${pkgname}/default"
  cp -r "${srcdir}/src/${_gourl}/${pkgname}/templates" "${pkgdir}/usr/share/themes/${pkgname}/default"

  install -D -m 0600 "${pkgdir}/usr/share/${pkgname}/conf/app.ini" "$pkgdir/srv/${pkgname}/conf/app.ini"
  install -D -m 0644 "${srcdir}/${pkgname}.service" "$pkgdir/usr/lib/systemd/system/${pkgname}.service"
  install -d "${pkgdir}/var/log/${pkgname}"
  install -D -m 0644 "${srcdir}/src/${_gourl}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname"
}
