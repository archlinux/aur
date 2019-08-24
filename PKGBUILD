# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)

pkgname=reddio-git
pkgver() {
  cd "${pkgname%-git}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r134.66c12ce
pkgrel=3

pkgdesc='A command-line interface for Reddit written in POSIX sh'
arch=('any')
url='https://gitlab.com/aaronNG/reddio'
license=('custom:MIT')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=('curl' 'jq')
optdepends=('gnu-netcat: authenticate with your Reddit account credentials'
            'openbsd-netcat: authenticate with your Reddit account credentials')
makedepends=('git')

changelog=ISSUES
source=("git+$url" 'archlinux.patch')
sha256sums=('SKIP' 'd56a36a70ea279778a60e8b827c80166189584dce54bdeeccb8f33a047419157')

prepare() {
  cd "${pkgname%-git}"
  # Bash's printf statement may fail when using `.` as decimal point under
  # certain locales, so for the time being we set `LC_ALL` to `C`.
  # Also, Arch packages are never ever installed to `/usr/local/`.
  patch -Np1 <../archlinux.patch
}

package() {
  cd "${pkgname%-git}"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 README.md ISSUES example.png -t"$pkgdir/usr/share/doc/${pkgname%-git}/"
  install -Dm644 LICENSE -t"$pkgdir/usr/share/licenses/${pkgname%-git}/"
}

# vim: ts=2 sw=2 et ft=PKGBUILD:
