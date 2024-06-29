# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Hint: don't forget to run `makepkg --printsrcinfo > .SRCINFO`

pkgname=openconnect-systemd-credentials-git
_pkgname=${pkgname%-git}
pkgver=r3.58e8885
pkgrel=1
pkgdesc="OpenConnect VPN client Systemd Credentials integration helpers."
arch=('any')
url="https://github.com/s3rj1k/openconnect-systemd-credentials"
license=('MIT')
depends=('openconnect' 'systemd' 'polkit')
makedepends=('git' 'gcc' 'go')
source=("git+https://github.com/s3rj1k/openconnect-systemd-credentials.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make clean build
  make -C go-oc-otp build
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 "oc-password.so" "$pkgdir/usr/lib/oc-password.so"
  install -D -m755 "go-oc-otp/oc-otp" "$pkgdir/usr/bin/oc-otp"
  install -D -m644 "polkit-1/rules.d/50-systemd-credentials.rules" "$pkgdir/usr/share/polkit-1/rules.d/50-systemd-credentials.rules"
}
