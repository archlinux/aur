# Maintainer: Allen Zhong <allen@moe.cat>

_pkgname=hockeypuck
pkgname=${_pkgname}-git
pkgver=2.1.0.r98.gfc18405
pkgrel=1
pkgdesc='An OpenPGP public keyserver.'
arch=('x86_64')
url="https://hockeypuck.io"
license=('GPL')
depends=('postgresql')
makedepends=('go' 'git')
backup=("etc/${_pkgname}/${_pkgname}.conf")
source=("${_pkgname}::git+https://github.com/hockeypuck/hockeypuck.git"
        sysusers.conf
        tmpfiles.conf
        logrotate
        service)
sha512sums=('SKIP'
            '6c6761cd37b4b5117c4d7bbb10d77615ca2f08211180fb96f0b5005449b2be4249648f8770f6c161eaaf385f1dd587b97f87bb9655515920a8f25ad8375ad54c'
            '65c18650a9f27c325057e460fb138552e4957207158f1b737b44e4b3fd35093fb43cd039375680ab84d1a1e92003585b2c18e7d00c3e6f7e14c9792cd5cffb26'
            '981581e83f078d96c5c500a2a47de416015a314a4a562f994762c0c19263cc97ed2ba71b05fba0e2a09c866877f21209a2c0233638ed3b4e3e1e5f8d0a97ef4c'
            'a506ef0ade63483efb6d12c1be01b07bba013f7e2e39e26947f91b3c4bb94a9a12c9ec8fb5fc7aee72fd5bab0330d79a72a3970142fb9a8b0a540f7cc098270f')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  sed -i 's/var\/lib\/hockeypuck\/www/usr\/share\/webapps\/hockeypuck/g' contrib/config/hockeypuck.conf.postgres
}

build() {
  cd "${_pkgname}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$(pwd)"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make build
}

package() {
  cd "${_pkgname}"
  install -Dm755 bin/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
  install -Dm755 bin/${_pkgname}-dump "${pkgdir}"/usr/bin/${_pkgname}-dump
  install -Dm755 bin/${_pkgname}-load "${pkgdir}"/usr/bin/${_pkgname}-load
  install -Dm755 bin/${_pkgname}-pbuild "${pkgdir}"/usr/bin/${_pkgname}-pbuild

  install -d "${pkgdir}"/usr/share/webapps
  cp -r contrib/webroot "${pkgdir}"/usr/share/webapps/${_pkgname}
  install -d "${pkgdir}"/usr/share/${_pkgname}
  cp -r contrib/templates "${pkgdir}"/usr/share/${_pkgname}/templates

  install -Dm644 "${srcdir}"/logrotate "${pkgdir}"/etc/logrotate.d/"${_pkgname}"
  install -Dm644 "${srcdir}"/service "${pkgdir}"/usr/lib/systemd/system/"${_pkgname}".service
  install -Dm644 "${srcdir}"/sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/"${_pkgname}".conf
  install -Dm644 "${srcdir}"/tmpfiles.conf "${pkgdir}"/usr/lib/tmpfiles.d/"${_pkgname}".conf
  install -Dm644 contrib/config/hockeypuck.conf.postgres "${pkgdir}"/etc/${_pkgname}/hockeypuck.conf
}
