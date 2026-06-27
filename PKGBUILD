# Maintainer: DBeidachazi
pkgname=lhdc-v5-helper
pkgver=0.1.0
pkgrel=2
pkgdesc="QEMU aarch64 stdio helper for Savitech LHDC v5 encoder libraries"
arch=('x86_64')
url="https://github.com/DBeidachazi/lhdc-v5-helper"
license=('MIT')
options=('!strip')
depends=('qemu-user' 'aarch64-linux-gnu-glibc' 'aarch64-linux-gnu-gcc')
makedepends=('aarch64-linux-gnu-gcc')
install="$pkgname.install"
source=(
  'lhdc-helper-stdio.c'
  'android-libc-shim.c'
  'android-libc-shim.map'
  'android-libm-shim.c'
  'android-libm-shim.map'
  'android-log-stub.c'
  'run-helper-stdio.sh'
  'lhdc-v5-install-lib'
  'liblhdcv5.so::https://raw.githubusercontent.com/DBeidachazi/lhdc-v5-helper/master/liblhdcv5.so'
  'README.md'
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' '0fd2f572cc730c3e5d14ad2c73b9c0883dff4ca155c3dda1da386f7efc9e8856' 'SKIP')

build() {
  aarch64-linux-gnu-gcc -shared -fPIC android-log-stub.c \
    -o liblog.so

  aarch64-linux-gnu-gcc -shared -fPIC android-libc-shim.c \
    -o libc.so \
    -Wl,--version-script=android-libc-shim.map \
    -ldl

  aarch64-linux-gnu-gcc -shared -fPIC android-libm-shim.c \
    -o libm.so \
    -Wl,--version-script=android-libm-shim.map \
    -ldl -lm

  aarch64-linux-gnu-gcc lhdc-helper-stdio.c \
    -o lhdc-helper-stdio \
    -ldl
}

package() {
  install -Dm755 lhdc-helper-stdio \
    "$pkgdir/usr/lib/lhdc-v5-helper/bin/lhdc-helper-stdio"

  install -Dm755 run-helper-stdio.sh \
    "$pkgdir/usr/lib/lhdc-v5-helper/run-helper-stdio.sh"
  install -Dm755 lhdc-v5-install-lib \
    "$pkgdir/usr/bin/lhdc-v5-install-lib"

  install -Dm755 liblog.so \
    "$pkgdir/usr/lib/lhdc-v5-helper/lib/liblog.so"
  install -Dm755 libc.so \
    "$pkgdir/usr/lib/lhdc-v5-helper/lib/libc.so"
  install -Dm755 libm.so \
    "$pkgdir/usr/lib/lhdc-v5-helper/lib/libm.so"
  install -Dm644 liblhdcv5.so \
    "$pkgdir/usr/lib/lhdc-v5-helper/lib/liblhdcv5.so"

  ln -s /usr/aarch64-linux-gnu/lib/libdl.so.2 \
    "$pkgdir/usr/lib/lhdc-v5-helper/lib/libdl.so"
  ln -s /usr/aarch64-linux-gnu/lib/libstdc++.so.6 \
    "$pkgdir/usr/lib/lhdc-v5-helper/lib/libstdc++.so"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
