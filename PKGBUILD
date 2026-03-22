# Maintainer: Andreas Wendleder <gonsolo@gmail.com>
pkgname=sourcery
pkgver=2.3.0
pkgrel=2
pkgdesc="Meta-programming for Swift, stop writing boilerplate code."
arch=('x86_64')
url="https://github.com/krzysztofzablocki/Sourcery"
license=('MIT')
depends=('swift-bin')
makedepends=('git')
source=("git+https://github.com/krzysztofzablocki/Sourcery.git#tag=$pkgver")
sha256sums=('SKIP')
options=(!buildflags !makeflags !debug !strip)

build() {
  cd Sourcery
  
  # Arch's default CFLAGS, LDFLAGS, and parallel MAKEFLAGS often crash 
  # the Swift Package Manager build databases (llbuild / SQLite).
  # We clear the environment flags and strictly limit parallelism to bypass the crash!
  unset CFLAGS CXXFLAGS LDFLAGS
  
  swift build -c release --disable-sandbox --jobs 2
}

package() {
  cd Sourcery
  install -Dm755 .build/release/sourcery "$pkgdir/usr/bin/sourcery"
}
