# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=slicer-git
pkgdesc="A tool to automate the boring process of APK recon (git)"
pkgver=1.4.r0.g50589ac
pkgrel=1
arch=('x86_64')
url="https://github.com/mzfr/slicer"
license=('GPL3')
makedepends=('git' 'go')
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
provides=("${pkgname%-git}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "${pkgname%-git}" .
}

package() {
  cd "${pkgname%-git}"
  install -Dm 755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
  install -Dm 644 readme.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
