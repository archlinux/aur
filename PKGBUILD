# Maintainer: Allen Zhong <pdev@zhoal.pw>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=tikv-pd
pkgver=8.5.1
pkgrel=1
pkgdesc='Manage and schedule the TiKV cluster.'
depends=('glibc')
makedepends=('go' 'make' 'git' 'unzip')
arch=('x86_64')
url='https://github.com/tikv/pd'
license=('Apache')
provides=('pd-server')
backup=(etc/pd/pd.toml)
install=pd.install
source=(pd-${pkgver}.tar.gz::https://github.com/tikv/pd/archive/v${pkgver}.tar.gz
        pd.service
        pd-sysusers.conf
        pd-tmpfiles.conf
        pd.toml)
sha256sums=('0154182203522ceeeff502ff2aa4a55b8f9ab59738dfbc528f71bfcaeda8c1b0'
            'b03d12f2f8d6eb2e9d654d6258ca39000225cdf1418840f7e35081631bc4d924'
            '5edd250ba9e70a4f8d27581ed658f0fbfeca58ca62429dec12bb5fffc0919b67'
            '15633aaa2d7726375112a1b5af88105878f09c176a542cde6d0e5f0c4eee4495'
            '44de9aed72b8bc9156db354dcddfe0624f2fe4fc91e903fe64892913cae93e0f')

_gopkgname='github.com/tikv/pd'

prepare() {
  export GOPATH="$srcdir/build"
  rm -rf "$GOPATH/src/$_gopkgname"
  mkdir -p `dirname "$GOPATH/src/$_gopkgname"`
  mv -Tv "$srcdir/pd-${pkgver}" "$GOPATH/src/$_gopkgname"

  # patch Makefile
  sed -i 's/go build/go build $(GOFLAGS)/g' "$GOPATH/src/$_gopkgname/Makefile"
  sed -i 's/CGO_ENABLED=0/CGO_ENABLED=1/g' "$GOPATH/src/$_gopkgname/Makefile"
  sed -i 's/BUILD_CGO_ENABLED := 0/BUILD_CGO_ENABLED := 1/g' "$GOPATH/src/$_gopkgname/Makefile"
  sed -i '/shell git /d' "$GOPATH/src/$_gopkgname/Makefile"
  sed -i '/PDReleaseVersion/d' "$GOPATH/src/$_gopkgname/Makefile"
  sed -i '/describe-dashboard.sh git-hash/d' "$GOPATH/src/$_gopkgname/Makefile"
}

build() {
  export GOPATH="$srcdir/build"
  export PATH=$GOPATH/bin:$PATH
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd $GOPATH/src/$_gopkgname

  _LDFLAGS="-X $_gopkgname/pkg/versioninfo.PDReleaseVersion=$pkgver -X $_gopkgname/pkg/versioninfo.PDGitBranch=release -X $_gopkgname/pkg/versioninfo.PDGitHash=v$pkgver -X $_gopkgname/pkg/versioninfo.PDGitBranch=release -X github.com/pingcap/tidb-dashboard/pkg/utils/version.PDVersion=$pkgver -X github.com/pingcap/tidb-dashboard/pkg/utils/version.BuildGitHash=v$pkgver"

  LDFLAGS=$_LDFLAGS make build tools
}

package() {
  # Install binary
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/pd-server" "$pkgdir/usr/bin/pd-server"
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/pd-ctl" "$pkgdir/usr/bin/pd-ctl"
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/pd-tso-bench" "$pkgdir/usr/bin/pd-tso-bench"
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/pd-recover" "$pkgdir/usr/bin/pd-recover"
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/pd-heartbeat-bench" "$pkgdir/usr/bin/pd-heartbeat-bench"
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/regions-dump" "$pkgdir/usr/bin/pd-regions-dump"
  install -Dm755 "$srcdir/build/src/$_gopkgname/bin/stores-dump" "$pkgdir/usr/bin/pd-stores-dump"

  # Install systemd service
  install -Dm644 "$srcdir/pd.service" "$pkgdir/usr/lib/systemd/system/pd.service"
  # Install sysusers
  install -Dm644 "$srcdir/pd-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/pd.conf"
  # Install tmpfiles
  install -Dm644 "$srcdir/pd-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/pd.conf"
  # Install default pd config
  install -Dm644 pd.toml "$pkgdir/etc/pd/pd.toml"
}

# vim: ft=sh syn=sh et
