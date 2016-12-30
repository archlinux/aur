# Maintainer: Francois Menning <f.menning@protonmail.com>
# Contributor: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Thomas Laroche <tho.laroche@gmail.com>

_pkgname=gitea
_gourl="code.gitea.io"
pkgname=gitea-git
pkgver=4698.d0490c18
pkgrel=1
pkgdesc='A painless self-hosted Git service.'
url='https://gitea.io/'
license=('MIT')
source=('git://github.com/go-gitea/gitea.git#branch=master'
'gitea.service.patch'
'app.ini'
'gitea.sysusers'
'gitea.tmpfiles')
sha256sums=('SKIP'
            'f7b570315bd98a4e2d1c82ebdc2e78d76f6df49286ca4ac59cfb2b3f9985d1f9'
            'ec5398cd2ef1bf25bce2ad7f9cb260b43d6e6e9c4ebfb3228212979e36660280'
            'd8efbf6f1e634548a3ee875c9a7444282966ffe76f2ed9532ee7b724a364264b'
            '5631db5f47b41cdae180b98214e436856daec497949c68c1e13f70f12bbb855d')
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
depends=('go')
makedepends=('patch' 'git')
optdepends=('mariadb: MariaDB database support'
            'postgresql: PostgreSQL database support'
            'sqlite: SQLite database support'
            'redis: Redis session support'
            'memcached: MemCached session support'
            'openssh: Git over SSH support')
install=gitea.install
backup=("var/lib/gitea/custom/conf/app.ini")
conflicts=('gitea')
options=('!strip' 'emptydirs')
provides=('gitea')

pkgver() {
  cd "${srcdir}/src/${_gourl}/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  mv "${_pkgname}" "${srcdir}/src/${_gourl}/${_pkgname}"

  # build with tags
  msg2 "Build with tags"
  GOPATH="${srcdir}" go get -tags "sqlite redis memcache" "${_gourl}/${_pkgname}"

  # patch
  msg2 "Patch gitea.service"
  patch -Np1 -i "${srcdir}/gitea.service.patch" "${srcdir}/src/${_gourl}/${_pkgname}/scripts/systemd/gitea.service"
}

build() {
  cd ${srcdir}/src/${_gourl}/${_pkgname}
  GOPATH="${srcdir}" go fix
  GOPATH="${srcdir}" go build -tags "sqlite redis memcache cert"
}

package() {
  install -dm755 ${pkgdir}/var/lib/${_pkgname}/{custom/conf,conf,data/{attachments,avatars,sessions,tmp},repo}
  install -dm755 ${pkgdir}/var/log/gitea
  install -Dm755 "${srcdir}/src/${_gourl}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/src/${_gourl}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/src/${_gourl}/${_pkgname}/scripts/systemd/gitea.service" "${pkgdir}/usr/lib/systemd/system/gitea.service"
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/gitea.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/gitea.conf"
  install -Dm644 "${srcdir}/app.ini" "${pkgdir}/var/lib/${_pkgname}/custom/conf/app.ini"
  cp -r ${srcdir}/src/${_gourl}/${_pkgname}/{conf,templates,public} ${pkgdir}/var/lib/${_pkgname}
  cp -r ${srcdir}/src/${_gourl}/${_pkgname}/options/* ${pkgdir}/var/lib/${_pkgname}/conf
}
