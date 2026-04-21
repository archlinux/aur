# Maintainer: Xarth <g@lzzz.ink>

pkgname=dailyflow-git
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="A simple web interface for daily Markdown journals"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/Xarth-Mai/DailyFlow'
license=('MPL2')
depends=()
makedepends=('git' 'go')
provides=('dailyflow')
conflicts=('dailyflow')
backup=('etc/dailyflow/config.conf')
install=dailyflow.install
source=('dailyflow::git+https://github.com/Xarth-Mai/DailyFlow.git' 'dailyflow.service')
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/dailyflow"
  local ver
  ver="$(git describe --long --tags --abbrev=7 2>/dev/null)" || ver=""
  if [[ -n "$ver" ]]; then
    ver="${ver#v}"
    ver="${ver//-/.}"
    printf '%s\n' "$ver"
  else
    printf '0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/dailyflow"
  export CGO_ENABLED=0
  go build -trimpath -buildvcs=false -o dailyflow .
}

package() {
  cd "$srcdir/dailyflow"

  install -Dm755 dailyflow "$pkgdir/usr/bin/dailyflow"
  install -Dm644 "$srcdir/dailyflow.service" "$pkgdir/usr/lib/systemd/system/dailyflow.service"
  install -Dm600 /dev/null "$pkgdir/etc/dailyflow/config.conf"
}
