# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=youtube-music
pkgver=3.11.0
pkgrel=2
_nodeversion=22
_electronversion=38
pkgdesc="YouTube Music Desktop App bundled with custom plugins"
arch=('x86_64')
url="https://github.com/ytmd-devs/ytmd"
license=('MIT')
depends=(
  "electron${_electronversion}"
  'libsecret'
)
makedepends=(
  'nvm'
  'pnpm'
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/ytmd-devs/ytmd/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('a015c0d1b1a23c08038b8b33859b8631562d5f568242dbdf7c07a10bbfdf6bfe'
            'e00aee0592b3b759fc055815c75326063348bcdf6e05b7632396592b05614637'
            '534337968b3443ff2911a951f8ec6a777cad22a270826dfbe61b0caf2741c654')

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
  cd "ytmd-$pkgver"
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/$pkgname.sh"
}

build() {
  cd "ytmd-$pkgver"
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
  cd "ytmd-$pkgver"
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
