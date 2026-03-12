# Maintainer: aig <aigmx@posteo.de>

pkgname=avahi2dns-git
pkgver=r39.fb49c4b
pkgrel=1
pkgdesc="Avahi DNS Resolver"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/LouisBrunner/avahi2dns"
license=('MIT')
makedepends=('git' 'go')
optdepends=('systemd: for use as a system service')
provides=("avahi2dns")
conflicts=("avahi2dns")
options=(!strip !debug)
source=('git+https://github.com/LouisBrunner/avahi2dns#branch=main'
        '01-avahi2dns.service.patch'
        'avahi2dns.sysusers')
sha256sums=('SKIP'
            '17023b614ef325a6e0c2909f4cbc1a5c7e2e3bbf386c0f98f78e0e2c58fae055'
            '7cfc71c3373b1046af469e4857f0061eb62416f2bb38805ebf5bab5fb21c9a1d')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  # Git, tags available
  # printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd "$srcdir/${pkgname%-git}"
  patch -p1 -i "$srcdir/01-avahi2dns.service.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  go build \
    -trimpath \
    -buildmode=pie \
    -modcacherw \
    -ldflags "-s -w" \
    -o ${pkgname%-git} .
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm 755 -t "$pkgdir/usr/bin/" avahi2dns
  install -Dm 644 -t "$pkgdir/usr/lib/systemd/system/" systemd/avahi2dns.service
  install -Dm 644 "$srcdir/avahi2dns.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname%-git}.conf" 
}
