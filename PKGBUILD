# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=watchman-bin
pkgver=2025.07.28.00
pkgrel=1
pkgdesc="An inotify-based file watching and job triggering command line utility"
url="https://facebook.github.io/watchman/"
arch=(x86_64)
license=(MIT)
depends=(
  gcc-libs
  glibc
  openssl
)
makedepends=(
  patchelf
  python
)
provides=("watchman=$pkgver")
conflicts=(watchman)
options=(!strip)
install=watchman.install

# https://github.com/facebook/watchman/releases
source=(
  "https://github.com/facebook/watchman/releases/download/v$pkgver/watchman-v$pkgver-linux.zip"
  "watchman-v$pkgver-LICENSE::https://github.com/facebook/watchman/raw/v$pkgver/LICENSE"
)
b2sums=('6884b545a9ed750a51af47fa9479d1e254f6748c11c9af2f063b8070fbcfb63d99c0d17b1b6ae079cea4d253e83b0d60f65d8a55d1083ee653fdf17ee2b2c192'
        'b9c1c046dc0cd3c6bbf977f3e6d3f448a5fa26ac4d27aa3e2bf1c1a2f6bf97484a79f76c19bf5d5b3cf92400f951015a5036dfd8e183a2fdb0634ce992b12469')

prepare() {
  cd watchman-v$pkgver-linux

  python <<END
from pathlib import Path

data = Path("bin/watchman").read_bytes()

# Bad and good path must have same length
badpath  = b"/usr/local/var/run/watchman\\x00"
goodpath = b"/run/./././././././watchman\\x00"

assert len(badpath) == len(goodpath)
data = data.replace(badpath, goodpath)

Path("bin/watchman").write_bytes(data)
END

  patchelf \
    --replace-needed {/usr/local/lib/,}libevent-2.1.so.7 \
    --replace-needed {/usr/local/lib/,}libgflags.so.2.2 \
    --replace-needed {/usr/local/lib/,}libglog.so.0 \
    --replace-needed {/usr/local/lib/,}liblzma.so.5 \
    --replace-needed {/usr/local/lib/,}libsnappy.so.1 \
    --replace-needed {/usr/local/lib/,}libunwind.so.8 \
    --replace-needed {/usr/local/lib/,}libxxhash.so.0 \
    bin/* lib/*

  patchelf --set-rpath /usr/lib/watchman bin/* lib/*
}

package() {
  cd watchman-v$pkgver-linux

  install -Dt "$pkgdir/usr/bin" bin/*
  install -Dt "$pkgdir/usr/lib/watchman" lib/*

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/watchman.conf" <<END
d /run/watchman 1777 root root
END

  echo '{}' | install -Dm644 /dev/stdin "$pkgdir/etc/watchman.json.default"

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/watchman.socket" <<END
[Unit]
Description=File watching service socket
Documentation=$url

[Socket]
ListenStream=/run/watchman/%u-state/sock
SocketMode=0600
DirectoryMode=0700

[Install]
WantedBy=sockets.target
END

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/watchman.service" <<END
[Unit]
Description=File watching service
Documentation=$url
Requires=watchman.socket

[Service]
ExecStart=/usr/bin/watchman --foreground --inetd --logfile=-
StandardInput=socket
StandardOutput=journal
StandardError=inherit

[Install]
WantedBy=default.target
END

  install -Dm644 ../watchman-v$pkgver-LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sw=2 sts=-1 et:
