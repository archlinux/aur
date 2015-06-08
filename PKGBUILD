# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=gitea
_pkgname=${pkgname}
pkgver=0.6.1
pkgrel=1
epoch=1
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
        "${_pkgname}::git+https://${_gourl}/${_pkgname}.git#tag=v${pkgver}")

sha512sums=('2b4303f850e3b13b2fc3c9f0bc5820dae431d228002b35f01be0d4bfbcf05de8dcec2a559a85e318b609e4a4d492d44306eadf5f6508fd72333b198661bb0bb7'
            '809c7668a508e792a32eed7242d9bd1093137668aef7baada0bf7064a1fbb1610468dbf632c9548e268f92b97a61ee0b947a95560b15f88a22588da2d50801c2'
            'SKIP')


prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  mv "${_pkgname}" "${srcdir}/src/${_gourl}/${_pkgname}"
  msg2 "go get"
  GOPATH="${srcdir}" go get -tags "sqlite redis memcache" "${_gourl}/${_pkgname}"
  
  msg2 "Patch: GITEA app.ini"
  patch -Np1 -i "${srcdir}/app.ini.patch" "${srcdir}/src/${_gourl}/${_pkgname}/conf/app.ini"
}

build() {
  msg2 "Build program"
  cd ${srcdir}/src/${_gourl}/${_pkgname}
  GOPATH="${srcdir}" go fix
  GOPATH="${srcdir}" go build -tags "sqlite redis memcache cert"
}

package() {
  install -D -m 0755 "${srcdir}/src/${_gourl}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"

  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/conf" "${pkgdir}/usr/share/${_pkgname}"
  install -d "${pkgdir}/usr/share/themes/${_pkgname}/default/"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/public" "${pkgdir}/usr/share/themes/${_pkgname}/default"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/templates" "${pkgdir}/usr/share/themes/${_pkgname}/default"

  install -D -m 0600 "${pkgdir}/usr/share/${_pkgname}/conf/app.ini" "$pkgdir/srv/${_pkgname}/conf/app.ini"
  install -D -m 0644 "${srcdir}/${_pkgname}.service" "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
  install -d "${pkgdir}/var/log/${_pkgname}"
  install -D -m 0644 "${srcdir}/src/${_gourl}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/$_pkgname"
}
