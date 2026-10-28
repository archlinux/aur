# Maintainer: agony <27015 at riseup dot net>

pkgname=centrifugo-git
pkgver=r1997.696272d
pkgrel=1
pkgdesc='Scalable real-time messaging server (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/centrifugal/centrifugo'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=('centrifugo')
conflicts=('centrifugo')
install=centrifugo.install
source=("centrifugo::git+${url}.git"
        'centrifugo.service'
        'centrifugo.sysusers'
        'centrifugo.tmpfiles')
sha256sums=('SKIP'
            'f61eeb35bfa248be947b0da434bf82815d2a0396f10933e4aadac06a73462f9c'
            'dd656417db47b6dd5260a8a6b1f82005c80b6555ac65dd375a95e3aa5168e728'
            '3a4a5123db7293dc103187f406a168214ced95bda0c4f6c0f06508cf262a9718')

pkgver() {
  cd centrifugo
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd centrifugo
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd centrifugo
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  local version
  version=$(git describe --tags | sed 's/^v//')
  go build -v -ldflags="-linkmode=external -X github.com/centrifugal/centrifugo/v6/internal/build.Version=${version}" -o centrifugo .
}

check() {
  cd centrifugo
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  local packages
  mapfile -t packages < <(bash misc/scripts/test_packages.sh unit)
  go test "${packages[@]}"
}

package() {
  install -dm755 "${pkgdir}/etc/centrifugo"
  install -Dm644 centrifugo.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 centrifugo.sysusers "${pkgdir}/usr/lib/sysusers.d/centrifugo.conf"
  install -Dm644 centrifugo.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/centrifugo.conf"
  install -Dm755 centrifugo/centrifugo -t "${pkgdir}/usr/bin"
}
