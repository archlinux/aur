# Maintainer: Kevin Schoon <kevinschoon@pm.me>
# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>
_pkgname=pomo
pkgname=${_pkgname}-git
pkgver=0.9.1.r0.g4fdce01
pkgrel=1
pkgdesc='Pomodoro CLI with todo tasks'
url='https://github.com/Felixoid/pomo'
arch=(x86_64 aarch64)
license=('MIT')
source=("$pkgname::git+${url}.git")
sha512sums=('SKIP')
makedepends=('git' 'go')
conflicts=('pomo')
provides=('pomo')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    \   printf 'r%s.%s' "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make VERSION=${pkgver} build
}

check() {
  cd "${srcdir}/${pkgname}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}"
  gzip -f -k man/pomo.1
  install -Dm 755 bin/pomo "$pkgdir/usr/bin/pomo"
  install -Dm 644 man/pomo.1.gz "$pkgdir/usr/share/man/man1/pomo.1.gz"
}
