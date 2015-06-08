# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=gogs-git
_pkgname=gogs
pkgver=20150317
pkgrel=1
epoch=1
pkgdesc="Gogs(Go Git Service) is a Self Hosted Git Service in the Go Programming Language. This is the current git version from branch master."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://gogs.io/"
license=('MIT')
depends=('git')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
makedepends=('go>=1.2' 'git' 'mercurial' 'patch')
conflicts=('gogs-bin' 'gogs' 'gogs-git-dev')
options=('!strip' '!emptydirs')
backup=('srv/gogs/conf/app.ini')

install=gogs.install

_gourl=github.com/gogits
source=('gogs.service'
        'app.ini.patch'
        "${_pkgname}::git+https://${_gourl}/${_pkgname}.git")

sha512sums=('2b4303f850e3b13b2fc3c9f0bc5820dae431d228002b35f01be0d4bfbcf05de8dcec2a559a85e318b609e4a4d492d44306eadf5f6508fd72333b198661bb0bb7'
            '9c3d8425cf0e5291e9a7870b9b0ceec4d3d0de3818e0bd93b6a9e9c954cf16e8f2ae230242d6cc0d71147ad10c4224322b1f4f2f8eb3ca5e96c219e9fc35d29b'
            'SKIP')

pkgver(){
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  mv "${_pkgname}" "${srcdir}/src/${_gourl}/${_pkgname}"
  msg2 "go get"
  GOPATH="${srcdir}" go get -tags "sqlite redis memcache" "${_gourl}/${_pkgname}"

  msg2 "Patch: GOGS app.ini"
  patch -Np1 -i "${srcdir}/app.ini.patch" "${srcdir}/src/${_gourl}/${_pkgname}/conf/app.ini"
}

build() {
  msg2 "Build program"
  cd ${srcdir}/src/${_gourl}/${_pkgname}
  GOPATH="${srcdir}" go fix
  GOPATH="${srcdir}" go build -tags "sqlite redis memcache"
}

package() {
  install -D -m 0755 "${srcdir}/src/${_gourl}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"

  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/conf" "${pkgdir}/usr/share/${_pkgname}"
  install -d "${pkgdir}/usr/share/themes/gogs/default/"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/public" "${pkgdir}/usr/share/themes/gogs/default"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/templates" "${pkgdir}/usr/share/themes/gogs/default"

  install -D -m 0600 "${pkgdir}/usr/share/${_pkgname}/conf/app.ini" "$pkgdir/srv/${_pkgname}/conf/app.ini"
  install -D -m 0644 "${srcdir}/gogs.service" "$pkgdir/usr/lib/systemd/system/gogs.service"
  install -d "${pkgdir}/var/log/gogs"
  install -D -m 0644 "${srcdir}/src/${_gourl}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/$_pkgname"
}
