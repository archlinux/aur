pkgname=watchman-bin
pkgver=2021.04.19.00
pkgrel=2
pkgdesc="An inotify-based file watching and job triggering command line utility"
url="https://facebook.github.io/watchman/"
arch=(x86_64)
license=(Apache)
depends=(openssl google-glog gflags)
makedepends=(patchelf python)
provides=("watchman=$pkgver")
conflicts=(watchman)
# https://github.com/facebook/watchman/releases
source=("https://github.com/facebook/watchman/releases/download/v$pkgver/watchman-v$pkgver-linux.zip")
sha256sums=('048dc4136bddc8251b802287018e9f83b6e783d43770a851bb2ad63527f67fa7')

prepare() {
  python <<END
from pathlib import Path

data = Path("watchman-v$pkgver-linux/bin/watchman").read_bytes()

badpath  = b"/usr/local/var/run/watchman\\x00"
goodpath = b"/run/watchman\\x00"

goodpath = goodpath.ljust(len(badpath), b"\\x00")
data = data.replace(badpath, goodpath)

Path("watchman").write_bytes(data)
END

  patchelf \
    --replace-needed /usr/local/lib/libgflags.so.2.2 libgflags.so.2.2 \
    --replace-needed /usr/local/lib/libglog.so.0 libglog.so.0 \
    watchman
}

package() {
  install -Dt "$pkgdir/usr/bin" watchman
  install -Dm644 /dev/stdin "$pkgdir"/usr/lib/tmpfiles.d/watchman.conf <<END
d /run/watchman 1777 root root
END
  echo '{}' | install -Dm644 /dev/stdin "$pkgdir"/etc/watchman.json.default
}

# vim:set sw=2 et:
