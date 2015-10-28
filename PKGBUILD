# Maintainer: Takashi Inoue <inoue@pitan.org>
pkgname=mackerel-agent-git
pkgver=0.24.0
pkgrel=1
pkgdesc="A revolutionary new kind of application performance management"
arch=('i686' 'x86_64')
url="https://github.com/mackerelio/mackerel-agent"
license=('Apache')
depends=('')
conflicts=('mackerel-agent')
makedepends=('go' 'git')
backup=('etc/mackerel-agent/mackerel-agent.conf')
source=("$pkgname"::'git+https://github.com/mackerelio/mackerel-agent.git'
        'mackerel-agent.service'
        'mackerel-agent.conf')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --abbrev=0 | sed 's/^v//' | sed 's/\+.*$$//'
}

build() {
  cd "$srcdir/$pkgname"

  export GOPATH="$srcdir/go"
  mkdir "$GOPATH"
  go get -d github.com/mackerelio/mackerel-agent
  go build -o build/mackerel-agent \
    -ldflags="\
      -X github.com/mackerelio/mackerel-agent/version.GITCOMMIT=`git rev-parse --short HEAD` \
      -X github.com/mackerelio/mackerel-agent/version.VERSION=`git describe --tags --abbrev=0 | sed 's/^v//' | sed 's/\+.*$$//'` " \
    github.com/mackerelio/mackerel-agent
}

check() {
  cd "$srcdir/$pkgname"
  # Disable test because it requires "eth0" interface.
  # make test
}

package() {
  install -Dm755 "$srcdir/$pkgname/build/mackerel-agent" "$pkgdir/usr/bin/mackerel-agent"
  install -Dm644 "$srcdir/mackerel-agent.conf" "$pkgdir/etc/mackerel-agent/mackerel-agent.conf"
  install -Dm644 "$srcdir/mackerel-agent.service" "$pkgdir/usr/lib/systemd/system/mackerel-agent.service"

  mkdir -p "$pkgdir/var/lib/mackerel-agent"
}

sha1sums=('SKIP'
          '0f31c458aabc5ce69a5f7ba42ae89ae4ab9df967'
          '3fe77f612f4e06908c1bee43fa99f395726d1040')
