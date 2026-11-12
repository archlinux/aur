# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Tracks the linux-install branch (Linux support + installer) until
# upstream merges https://github.com/malebuffy/AndroidAutoMaker/pull/8.
pkgname=android-auto-maker-git
pkgver=1.1.15.r5.ga43dc7d
pkgrel=1
pkgdesc="Turn an APK or XAPK into a package Android Auto offers as a parked game (local web converter)"
arch=('any')
url="https://github.com/malebuffy/AndroidAutoMaker"
license=('GPL-3.0-only')
depends=('nodejs' 'java-runtime>=11' 'unzip' 'curl')
makedepends=('git' 'npm')
optdepends=('android-tools: Install on phone button via USB (adb)'
            'xdg-utils: open the web UI from the desktop entry'
            'android-sdk-build-tools: zipalign, apksigner and aapt (or run android-auto-maker-setup)')
provides=('android-auto-maker')
conflicts=('android-auto-maker')
install=android-auto-maker.install
source=("$pkgname::git+https://github.com/9M2PJU/AndroidAutoMaker.git#branch=linux-install"
        'android-auto-maker.install'
        'android-auto-maker.service'
        'android-auto-maker.desktop'
        'android-auto-maker-setup')
sha256sums=('SKIP'
            '6bee366657a6171d6f355bef0575f8574155efcb1da8485e22ce2d3f15a6a366'
            'f49c3befd3ddf8dcb9239e72086857f560b66bb91dec2dad968efc37402d032d'
            'd3a7ca021230453b8dbc043392aef6c99a47083586364f95a28e9447e0f58879'
            '311f18872082a4a87e115dd4f4f24bb75acb555bdc0e9a7289f6cf7cc08ec626')

pkgver() {
  cd "$pkgname"
  printf "1.1.15.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export npm_config_cache="$srcdir/npm-cache"
  npm ci --omit=dev --no-audit --no-fund
}

package() {
  cd "$pkgname"
  install -d "$pkgdir/opt/android-auto-maker"
  tar -C . --exclude=.git --exclude=work --exclude=node_modules \
    --exclude=tools/keys --exclude=tools/framework --exclude=.sdk \
    --exclude=tools/zipalign --exclude=tools/zipalign.exe \
    --exclude=tools/apksigner.jar --exclude=tools/lib64 \
    --exclude='*.keystore' --exclude='*.p12' -cf - . \
    | tar -xf - -C "$pkgdir/opt/android-auto-maker"
  cp -a node_modules "$pkgdir/opt/android-auto-maker/"

  install -d "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec /usr/bin/node /opt/android-auto-maker/server.js "$@"\n' \
    > "$pkgdir/usr/bin/android-auto-maker"
  chmod 755 "$pkgdir/usr/bin/android-auto-maker"
  install -Dm755 "$srcdir/android-auto-maker-setup" "$pkgdir/usr/bin/android-auto-maker-setup"
  install -Dm644 "$srcdir/android-auto-maker.service" \
    "$pkgdir/usr/lib/systemd/user/android-auto-maker.service"
  install -Dm644 "$srcdir/android-auto-maker.desktop" \
    "$pkgdir/usr/share/applications/android-auto-maker.desktop"
}
