# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=maddy-git
pkgver=0.1
pkgrel=3
pkgdesc="Fast, cross-platform mail server"
arch=(any)
url="https://github.com/emersion/maddy"
license=('MIT')
makedepends=('git' 'go')
source=("git+https://github.com/emersion/maddy.git"
	"maddy.service")
install="maddy.install"
conflicts=("maddy")
provides=("maddy")
backup=('etc/maddy/maddy.conf')
sha512sums=('SKIP'
	    'e49efa944c4bd4e9241f808dd8449c2448c4801493182a0b9fe10e32600e19d0dc80e358e0f8bc46c35c3d3ee0dc5417d3dcfe4541054e15499b3f9305170092')

pkgver() {
  cd "maddy"
  echo "0.1"
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/maddy"
  export GOPATH="${srcdir}"
  export GO111MODULE=on
  go get -v
}

build() {
  cd "${srcdir}/maddy"
  export GOPATH="${srcdir}"
  export GO111MODULE=on
  go build -v
  cd cmd/maddy
  go build -v
}

package() {
  cd "${srcdir}/maddy"
  install -Dm755 "${srcdir}/maddy/cmd/maddy/maddy" "${pkgdir}/usr/bin/maddy"
  install -Dm644 "${srcdir}/maddy.service" "${pkgdir}/usr/lib/systemd/system/maddy.service"
  install -D "${srcdir}/maddy/LICENSE" "${pkgdir}/usr/share/licenses/maddy/LICENSE"
  mkdir -p "${pkgdir}/var/lib/maddy"
  mkdir -p "${pkgdir}/etc/maddy"
  cp -r "${srcdir}/maddy/maddy.conf" "${pkgdir}/etc/maddy/"
}
