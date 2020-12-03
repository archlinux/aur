pkgname=watchman-bin
pkgver=2020.11.30.00
pkgrel=1
pkgdesc="An inotify-based file watching and job triggering command line utility"
url="https://facebook.github.io/watchman/"
arch=(x86_64)
license=(Apache)
depends=(openssl google-glog gflags)
makedepends=(patchelf python)
provides=("watchman=$pkgver")
conflicts=(watchman)
source=("https://github.com/facebook/watchman/releases/download/v$pkgver/watchman-v$pkgver-linux.zip")
sha256sums=('d55f5e085e09c63b26c3c7ca1ddb26eff2d787df4bab452a0729bf9aeffc22ff')

prepare() {
  python <watchman-v$pkgver-linux/bin/watchman >watchman.hex \
    -c 'import codecs; open(1, "wb").write(codecs.encode(open(0, "rb").read(), "hex"))'

  # /usr/local/var/run/watchman -> /run/watchman
  local  badpath=2f7573722f6c6f63616c2f7661722f72756e2f77617463686d616e00
  local goodpath=2f72756e2f77617463686d616e000000000000000000000000000000
  sed -i "s/$badpath/$goodpath/g" watchman.hex

  python <watchman.hex >watchman \
    -c 'import codecs; open(1, "wb").write(codecs.decode(open(0, "rb").read(), "hex"))'

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
}

# vim:set sw=2 et:
