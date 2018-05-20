# Maintainer : Christoph Scholz <christoph.scholz@gmail.com>

_pkgname=p2
pkgname=${_pkgname}-git
pkgver=r13.bef55c0
pkgrel=1
epoch=1
pkgdesc="An XEP-0357: Push Notifications app server that relays push messages between the user’s server and Googles Firebase Cloud Messaging"
arch=('any')
url="https://github.com/iNPUTmice/p2"
license=('GPL')
makedepends=('git' 'maven' 'java-environment')
depends=('java-runtime')

backup=(
  'etc/p2.conf'
  )

install="${_pkgname}.install"

source=(
	"${_pkgname}::git://github.com/iNPUTmice/p2.git"
  "p2.install"
	)

sha256sums=(
	'SKIP'
  'd0d2b1f89730badaef34a7158a5dc46dedbe67999611766aac3b61d7c8fb86be'
	)

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  mvn package
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d "${pkgdir}/opt/"
  cp target/p2-0.1.jar "${pkgdir}/opt/"
  install -d "${pkgdir}/etc/"
  cp p2.conf.example "${pkgdir}/etc/p2.conf"
  install -d "${pkgdir}/usr/lib/systemd/system/"
  cp dist/p2.service "${pkgdir}/usr/lib/systemd/system/"
  install -d "${pkgdir}/var/lib/p2/"
}