# Maintainer: PinkD <443657547@qq.com>

_pkgbase=ping_exporter
pkgname=prometheus-ping-exporter
pkgver=1.0.1
pkgrel=1
pkgdesc='A simple server that scrapes go-ping stats and exports them via HTTP for Prometheus consumption'
arch=('x86_64')
url="https://github.com/czerwonk/${_pkgbase}"
license=('MIT')
makedepends=('go' 'git')
source=("$_pkgbase"::"git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')
backup=("etc/$_pkgbase/config.yml" "etc/conf.d/$pkgname")

prepare(){
  mkdir -p "$srcdir/gopath"
  export GOPATH="$srcdir/gopath"
  cd "$srcdir/$_pkgbase"
  # add env to pass args to command line
  sed -i -e "s/ExecStart=\/usr\/bin\/$_pkgbase/EnvironmentFile=-\/etc\/conf.d\/$pkgname\nExecStart=\/usr\/bin\/$pkgname \$PING_EXPORTER_ARGS/g" dist/$_pkgbase.service
  mkdir -p build/
}

build() {
  cd "$srcdir/$_pkgbase"
  local _goldflags="-w -s"
  go build \
    -trimpath -mod=readonly -modcacherw \
    -o "build/$_pkgbase" \
    -ldflags "$_goldflags" \
    .
}

package() {
  # install ping_exporter
  install -Dm755 "$srcdir/$_pkgbase/build/$_pkgbase" "$pkgdir/usr/bin/$pkgname"

  # install config
  install -Dm644 "$srcdir/$_pkgbase/dist/$_pkgbase.yaml" "$pkgdir/etc/$_pkgbase/config.yml"

  # install conf.d
  install -Dm644 "$startdir/$_pkgbase.conf.d" "$pkgdir/etc/conf.d/$pkgname"

  # install systemd units
  install -Dm644 "$srcdir/$_pkgbase/dist/$_pkgbase.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  # install sys user
  install -Dm644 "$startdir/$_pkgbase.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # install license
  install -Dm644 "$srcdir/$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install README.md
  install -Dm644 "$srcdir/$_pkgbase/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

