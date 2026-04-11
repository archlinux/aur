# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pear-desktop-git
_app_id=com.github.th_ch.youtube_music
pkgver=3.11.0.r393.g8bd86e8
pkgrel=1
_nodeversion=24
_electronversion=41
pkgdesc="Extension for music player"
arch=('x86_64')
url="https://github.com/pear-devs/pear-desktop"
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
conflicts=("${pkgname%-git}" 'youtube-music')
install="${pkgname%-git}.install"
source=('git+https://github.com/pear-devs/pear-desktop.git'
        "${pkgname%-git}.sh"
        "${_app_id}.desktop")
sha256sums=('SKIP'
            'bf77b9390f6657d6b58613600cc76178da9ffa97cce55b8d0ba50b4c2ab7f996'
            '19a3c15cb705d56c205bdcd3d473545226b641952ed87677afd5b6c70a5573b4')

pkgver() {
  cd "${pkgname%-git}"
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
  cd "${pkgname%-git}"
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/${pkgname%-git}.sh"
}

build() {
  cd "${pkgname%-git}"
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
  cd "${pkgname%-git}"
  install -Dm644 pack/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/${pkgname%-git}/"
  cp -a pack/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/${pkgname%-git}"

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.png"
  install -Dm644 license -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
