# Maintainer: nroi <nroi@mailbox.org>
pkgname=audiowarden-git
pkgdesc="Skip spotify songs you don't like"
pkgver=0.1.1.r0.g891dd82
pkgrel=1
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/nroi/audiowarden'
license=('MIT')
provides=("audiowarden")
makedepends=('cargo' 'git')
depends=('curl' 'pacman-contrib')

source=('git+https://github.com/nroi/audiowarden.git'
        'audiowarden.service'
)
sha256sums=('SKIP'
            'a8789704183f5bb551807fff056935c047ddf6c0a72eeb0047ee0ceb4777f3cb'
)

build() {
  cd "${pkgname%-git}"
  # To avoid the warning "Package contains reference to $srcdir"
  export CARGO_BUILD_RUSTFLAGS="--remap-path-prefix $HOME=HOME"
  cargo build --release
}

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/audiowarden.service" "${pkgdir}/usr/lib/systemd/user/audiowarden.service"
  install -Dm755 "${pkgname%-git}/target/release/audiowarden" "$pkgdir/usr/bin/audiowarden"
}
