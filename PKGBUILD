# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=goveralls
pkgver=0.0.11
pkgrel=1
pkgdesc="Go integration for Coveralls continuous code coverage tracking system"
arch=('x86_64')
url="https://github.com/mattn/goveralls"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'LICENSE'
)
sha512sums=('67d67b925bd614842c3db4488129ec41a1f365f82ae968c6cf408b8cc26526009bf5ab6c613bf47db88e0956835e89ff1d046773f1d20f19534696e0ea494dd7'
            '51d275907f33e8c1c492e44eae206ecef6ef48f5c46052b9d27ff2dc3f233636fd18c309be9eb9fc682aaf40483d6da1ad9abdd259902a52c1dc006b5b51e400')
b2sums=('a90e0f6bbe60134de941b2df3a15d47f9ccdb91f206f4ae0a48c2bf8422ee320b4b337959e56609cce4b235ec1d8acfdb94286e8fd9b149098199b03f32c93d1'
        '972b43a6f765660b915ca4ceb3641db77e4e5abf5df2e8f757f1b801db4c4dfb4520cbc9cf686e86bbacaa2c007c6138da0ac1084d138a7a9c2e54bb1ffdcfea')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod vendor
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build .
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}
