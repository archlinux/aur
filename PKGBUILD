# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=cmtp-responder-git
pkgver=r244.a10d015c37
pkgrel=1
pkgdesc="Media Transfer Protocol daemon (responder) written in C, with minimal dependencies"
arch=('x86_64')
url="https://github.com/cmtp-responder/cmtp-responder"
license=('Apache')
source=("git+$url")
sha256sums=('SKIP')
depends=('glib2' 'systemd-libs')
makedepends=('cmake')
conflicts=('cmtp-responder')
provides=("cmtp-responder")

pkgver() {
  cd cmtp-responder
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse --short=10 HEAD)
}

prepare() {
  if [ -d build ]
  then
    msg2 "Build dir already exist; doing an incremental build"
    msg2 "If you want to do a clean build, please delete $(realpath build)"
    return
  fi

  cmake \
    -DBUILD_DESCRIPTORS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S cmtp-responder -B build
}

build() {
  make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install

  install -dm755 "$pkgdir"/usr/lib/udev/rules.d/
  install -m644 cmtp-responder/packaging/99-mtp-responder.rules "$pkgdir"/usr/lib/udev/rules.d/

  install -dm755 "$pkgdir"/usr/lib/systemd/system/
  install -m644 \
    cmtp-responder/mtp-responder.service \
    cmtp-responder/mtp-responder.socket \
    "$pkgdir"/usr/lib/systemd/system/
}
