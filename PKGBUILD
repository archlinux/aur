# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=signal-desktop
_pkgname=Signal-Desktop
pkgver=1.27.3
pkgrel=1
pkgdesc='Electron application that links with Signal on mobile'
arch=(x86_64)
url=https://signal.org
license=(GPL3)
depends=(electron)
makedepends=(yarn git python2 'nodejs>=12' npm python openssl-1.0)
conflicts=(signal)
source=($pkgname-$pkgver.tar.gz::https://github.com/signalapp/Signal-Desktop/archive/v$pkgver.tar.gz
        $pkgname.desktop)
sha512sums=('2b9f2776524313b237f1b5da56a8891959e7100b20dc80c58fa2f8895d809dc9db04d932e09c382bd5c9143d0fd0acab8aa59bf08ef76a397af2bff48c0a2762'
            '394a6db18a7bfc073e7a4e708d8a97716cf292810948a4fd28ec152e2f2318d7fd75457161707fa79cc28b5ac12ea6f66028417078c48dfbd939741263b5496f')

prepare() {
  cd $_pkgname-$pkgver

  # Allow higher node versions
  sed -i 's/"node": "/&>=/' package.json

  yarn install

  # Have SQLCipher statically link from openssl-1.0
  sed "76s/<.*$/-lcrypto'/;144d" -i node_modules/@journeyapps/sqlcipher/deps/sqlite3.gyp
}

build() {
  cd $_pkgname-$pkgver

  # Gruntfile expects Git commit information which we don't have in a tarball download
  # See https://github.com/signalapp/Signal-Desktop/issues/2376
  yarn generate exec:build-protobuf exec:transpile concat copy:deps sass

  yarn build-release --dir
}

package() {
  cd $_pkgname-$pkgver

  install -d "$pkgdir"/usr/{bin,lib/$pkgname}
  cp -a release/linux-unpacked/resources "$pkgdir"/usr/lib/$pkgname
  cat << EOF > "$pkgdir"/usr/bin/signal-desktop
#!/bin/sh

NODE_ENV=production electron /usr/lib/$pkgname/resources/app.asar "\$@"
EOF
  chmod +x "$pkgdir"/usr/bin/$pkgname

  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

  install -Dm 644 ../$pkgname.desktop -t "$pkgdir"/usr/share/applications
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 build/icons/png/${i}* "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
  done
}
