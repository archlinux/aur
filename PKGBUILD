# Maintainer: Allen Zhong <allen@moe.cat>

_pkgname=hockeypuck
pkgname=${_pkgname}-git
pkgver=2.1.0.r82.gc6011b7
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
        service)
sha512sums=('SKIP'
            '6c6761cd37b4b5117c4d7bbb10d77615ca2f08211180fb96f0b5005449b2be4249648f8770f6c161eaaf385f1dd587b97f87bb9655515920a8f25ad8375ad54c'
            '65c18650a9f27c325057e460fb138552e4957207158f1b737b44e4b3fd35093fb43cd039375680ab84d1a1e92003585b2c18e7d00c3e6f7e14c9792cd5cffb26'
            '4d589263029942dc953cf3f7af5822ecba1b9371adb8a81ecbf01a9293a7bff2781e1ccdf8e9be601241d5cc7cd97ca4f13b7b4ae5273a8cf73b15fef61c0657')

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

  install -Dm644 "${srcdir}"/service "${pkgdir}"/usr/lib/systemd/system/"${_pkgname}".service
  install -Dm644 "${srcdir}"/sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/"${_pkgname}".conf
  install -Dm644 "${srcdir}"/tmpfiles.conf "${pkgdir}"/usr/lib/tmpfiles.d/"${_pkgname}".conf
  install -Dm644 contrib/config/hockeypuck.conf.postgres "${pkgdir}"/etc/${_pkgname}/hockeypuck.conf
}
