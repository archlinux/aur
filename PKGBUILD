# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=youtube-music-git
pkgver=3.11.0.r50.gbcb61a9
pkgrel=1
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
  'git'
  'nvm'
  'pnpm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/ytmd-devs/ytmd.git'
        "${pkgname%-git}.sh"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.png")
sha256sums=('SKIP'
            'e00aee0592b3b759fc055815c75326063348bcdf6e05b7632396592b05614637'
            '534337968b3443ff2911a951f8ec6a777cad22a270826dfbe61b0caf2741c654'
            '340f4645d69c399a612fb06123b3405113e9e5cc34c965b20a5c8c94c653e7ae')

pkgver() {
  cd ytmd
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
  cd ytmd
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/${pkgname%-git}.sh"
}

build() {
  cd ytmd
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
  cd ytmd
  install -Dm644 pack/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/${pkgname%-git}/"
  cp -r pack/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/${pkgname%-git}"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/${pkgname%-git}.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 license -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
