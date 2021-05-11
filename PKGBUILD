pkgname=watchman-bin
pkgver=2021.05.10.00
pkgrel=2
pkgdesc="An inotify-based file watching and job triggering command line utility"
url="https://facebook.github.io/watchman/"
arch=(x86_64)
license=(Apache)
depends=(openssl gcc-libs)
makedepends=(patchelf python)
provides=("watchman=$pkgver")
conflicts=(watchman)
# https://github.com/facebook/watchman/releases
source=("https://github.com/facebook/watchman/releases/download/v$pkgver/watchman-v$pkgver-linux.zip")
sha256sums=('dd286b57b2f3c837aeea0ff67b646f247cd8e4c13c2199f321964a1cc7359355')

prepare() {
  cd watchman-v$pkgver-linux

  python <<END
from pathlib import Path

data = Path("bin/watchman").read_bytes()

badpath  = b"/usr/local/var/run/watchman\\x00"
goodpath = b"/run/watchman\\x00"

goodpath = goodpath.ljust(len(badpath), b"\\x00")
data = data.replace(badpath, goodpath)

Path("bin/watchman").write_bytes(data)
END

  patchelf \
    --replace-needed /usr/local/lib/libgflags.so.2.2 libgflags.so.2.2 \
    --replace-needed /usr/local/lib/libglog.so.0 libglog.so.0 \
    bin/* lib/*

  patchelf --set-rpath /usr/lib/watchman bin/* lib/*
}

package() {
  cd watchman-v$pkgver-linux

  install -Dt "$pkgdir/usr/bin" bin/*
  install -Dt "$pkgdir/usr/lib/watchman" lib/*

  install -Dm644 /dev/stdin "$pkgdir"/usr/lib/tmpfiles.d/watchman.conf <<END
d /run/watchman 1777 root root
END

  echo '{}' | install -Dm644 /dev/stdin "$pkgdir"/etc/watchman.json.default
}

# vim:set sw=2 et:
