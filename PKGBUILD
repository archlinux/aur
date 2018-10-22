# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=tikv-pd
pkgver=2.0.5
pkgrel=1
pkgdesc='Manage and schedule the TiKV cluster.'
makedepends=('go' 'make')
arch=('x86_64')
url='https://github.com/pingcap/pd'
license=('Apache')
provides=('pd-server')
backup=(etc/pd/pd.toml)
source=(pd-${pkgver}.tar.gz::https://github.com/pingcap/pd/archive/v${pkgver}.tar.gz
        pd.service
        pd-sysusers.conf
        pd.toml)
sha256sums=('4f3d267aa0c34828aea8b4797a02041efa32e81cda2c72d51e0b1f5bafab858b'
            '3b540c0cc468816b3be2d8d271f5649c836860c1e2eddfa7c043880bef226917'
            '5edd250ba9e70a4f8d27581ed658f0fbfeca58ca62429dec12bb5fffc0919b67'
            '14d8031f7d5d071e99dd3291c966d246c89a852b9c54a889d83b7c01421a45fc')

_gopkgname='github.com/pingcap/pd'

prepare() {
  export GOPATH="$srcdir/build"
  rm -rf "$GOPATH/src/$_gopkgname"
  mkdir -p `dirname "$GOPATH/src/$_gopkgname"`
  mv -Tv "$srcdir/pd-${pkgver}" "$GOPATH/src/$_gopkgname"
}

build() {
  export GOPATH="$srcdir/build"
  export PATH=$GOPATH/bin:$PATH
  export CGO_ENABLED=0

  cd $GOPATH/src/$_gopkgname

  go build -o bin/pd-server cmd/pd-server/main.go
  go build -o bin/pd-ctl cmd/pd-ctl/main.go
  go build -o bin/pd-tso-bench cmd/pd-tso-bench/main.go
  go build -o bin/pd-recover cmd/pd-recover/main.go

}

package() {
  # Install binary
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/pd-server" "$pkgdir/usr/bin/pd-server"
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/pd-ctl" "$pkgdir/usr/bin/pd-ctl"
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/pd-tso-bench" "$pkgdir/usr/bin/pd-tso-bench"
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/pd-recover" "$pkgdir/usr/bin/pd-recover"
  # Install systemd service
  install -Dm644 "$srcdir/pd.service" "$pkgdir/usr/lib/systemd/system/pd.service"
  # Install sysusers
  install -Dm644 "$srcdir/pd-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/pd.conf"
  # Install default pd config
  install -Dm644 pd.toml "$pkgdir/etc/pd/pd.toml"

  # Remove .git
  find "$pkgdir" -type d -name ".git" -exec rm -r '{}' +
}

# vim: ft=sh syn=sh et
