# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pear-desktop
pkgver=3.11.0
pkgrel=1
_nodeversion=22
_electronversion=38
pkgdesc="Extension for music player"
arch=('x86_64')
url="https://github.com/pear-devs/pear-desktop"
license=('MIT')
depends=(
  "electron${_electronversion}"
  'libsecret'
)
makedepends=(
  'nvm'
  'pnpm'
)
conflicts=('youtube-music')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('fb2e06ae019214ad62e0aaee7545d11f6ff42c79084ec4fe0dad7d9f534cbeec'
            'bf77b9390f6657d6b58613600cc76178da9ffa97cce55b8d0ba50b4c2ab7f996'
            'facdb724c14b4d2a95d8ccba525ad70f399c5a511ebb2e9b6f05878cdc8e92a9')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvmrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "$pkgname-$pkgver"
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/$pkgname.sh"
}

build() {
  cd "$pkgname-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  _ensure_local_nvm
  pnpm install --frozen-lockfile
  pnpm clean
  pnpm build
  pnpm electron-builder --linux dir \
    ${dist} -c.electronDist=${electronDist} -c.electronVersion=${electronVer}
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 pack/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/$pkgname/"
  cp -r pack/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 license -t "$pkgdir/usr/share/licenses/$pkgname/"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 "assets/generated/icons/png/${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
}
