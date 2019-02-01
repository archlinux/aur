# Maintainer: Jordan Knott <jordan at jordanthedev dot com>
# Contributor: Jordan Knott <jordan at jordanthedev dot com>
pkgname=chrono
pkgver=1.0.1
pkgrel=2
pkgdesc='A time tracking tool made with love'
arch=('x86_64')
url="https://github.com/gochrono/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
conflicts=("chrono-git")
source=("${pkgname}::git+${url}.git#tag=v${pkgver//_/-}")
md5sums=('SKIP')

build() {
  cd $pkgname

  PACKAGE="github.com/gochrono/chrono"
  EXTLDFLAGS=${LDFLAGS}
  LDFLAGS="-X ${PACKAGE}/commands.commit=`git rev-parse --short HEAD`
  -X ${PACKAGE}/commands.version=${pkgver}"

  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags ${EXTLDFLAGS} ${LDFLAGS}" \
    -o $pkgname .
}

package() {
  cd $pkgname
  install -Dm755 $pkgname -t "$pkgdir"/usr/bin/
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
