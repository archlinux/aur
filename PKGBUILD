# Maintainer: Jean Lucas <jean@4ray.co>
_branch=master
_pkgname=filtron
_team=github.com/asciimoo
pkgname=${_pkgname}-git
pkgver=0+r61+e141a49
pkgrel=1
pkgdesc="Reverse HTTP filtering proxy. This is the current git version from ${_branch} branch."
arch=('i686' 'x86_64')
url=https://${_team}/${_pkgname}
license=(AGPL3)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(glibc)
makedepends=(git go)
install=${_pkgname}.install
source=(git+$url
	"${_pkgname}.service"
        rules.json)
sha512sums=('SKIP'
            '0b7bbe55b3fd89d589e5662699f93d7aaf3c1d77d29be9cc568f8430e4a2491ba4920ca153f4d887a29da1f51670ec06346809cc5d1f373af540e252feccc799'
            '2668deb746ad361ebe32ea46b361f69c0eaf591b7faebb10dd2de11e114645c5fd726d45bb6aebec5b5bcef8dcad51d4b681a5e4b1ec83f918de4929aa237285')

prepare() {
  mkdir -p "${srcdir}/src/${_team}"
  mv -v "${srcdir}/${_pkgname}" "${srcdir}/src/${_team}/${_pkgname}"
}

pkgver() {
  cd "$srcdir/src/${_team}/${_pkgname}"
  printf 0+r%s+%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  export GOPATH="$srcdir"
  cd "$srcdir/src/${_team}/${_pkgname}"
  go get -v -x ${_team}/${_pkgname}
}

package() {
  cd "$srcdir"
  install -D bin/filtron -t "$pkgdir"/usr/bin
  install -Dm 644 ../rules.json -t "$pkgdir"/etc/"${_pkgname}"
  install -Dm 644 ../"${_pkgname}".service -t "$pkgdir"/usr/lib/systemd/system
  
  cd "$srcdir/src/${_team}/${_pkgname}"
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/"${_pkgname}"
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/"${_pkgname}"
}
