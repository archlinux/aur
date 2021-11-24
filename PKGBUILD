# Maintainer: Takashi Inoue <inoue(at)pitan.org>
pkgname=mackerel-agent-git
pkgver=0.72.4
pkgrel=1
pkgdesc="A revolutionary new kind of application performance management"
arch=('i686' 'x86_64')
url="https://github.com/mackerelio/mackerel-agent"
license=('Apache')
conflicts=('mackerel-agent')
makedepends=('go' 'git')
backup=('etc/mackerel-agent/mackerel-agent.conf')
source=("$pkgname"::'git+https://github.com/mackerelio/mackerel-agent.git'
        'file://mackerel-agent.service')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//' | sed 's/\+.*$$//'
}

build() {
  cd "$srcdir/$pkgname"

  export GOPATH="$srcdir/go"
  export PATH="${PATH}:${GOPATH}/bin"
  mkdir "$GOPATH"
  make clean
  make build
}

check() {
  cd "$srcdir/$pkgname"
  # Disable test because it requires "eth0" interface.
  # make test
}

package() {
  install -Dm755 "$srcdir/$pkgname/build/mackerel-agent" "$pkgdir/usr/bin/mackerel-agent"
  install -Dm644 "$srcdir/$pkgname/mackerel-agent.sample.conf" "$pkgdir/etc/mackerel-agent/mackerel-agent.conf"
  sed -i "s/^# pidfile/pidfile/" "$pkgdir/etc/mackerel-agent/mackerel-agent.conf"
  sed -i "s/^# root/root/" "$pkgdir/etc/mackerel-agent/mackerel-agent.conf"
  sed -i "s/^# verbose/verbose/" "$pkgdir/etc/mackerel-agent/mackerel-agent.conf"
  sed -i "s/^# apikey/apikey/" "$pkgdir/etc/mackerel-agent/mackerel-agent.conf"
  install -Dm644 "$srcdir/mackerel-agent.service" "$pkgdir/usr/lib/systemd/system/mackerel-agent.service"

  mkdir -p "$pkgdir/var/lib/mackerel-agent"
}

sha1sums=('SKIP'
          '0f31c458aabc5ce69a5f7ba42ae89ae4ab9df967')
