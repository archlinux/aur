# Maintainer: NanKill <nankill@nankill.xyz>
pkgname=glassy-music-nankill-git
_app_id=glassy-music-nankill-mod
pkgver=3.12.8.beta.r12.gb25146f
pkgrel=1
_nodeversion=24
_electronversion=41
pkgdesc="Glassy Music is extension for music player "
arch=('x86_64')
url="https://github.com/NanKillBro/glassy-music-nankill"
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

source=('git+https://github.com/NanKillBro/glassy-music-nankill.git'
        "${pkgname%-git}.sh"
        "${_app_id}.desktop")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_ensure_local_nvm() {
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  cd "${pkgname%-git}"

  find . -type f -name "*.ts" -exec sed -i "s|process.resourcesPath|'/usr/lib/${pkgname%-git}'|g" {} +
  find . -type f -name "*.js" -exec sed -i "s|process.resourcesPath|'/usr/lib/${pkgname%-git}'|g" {} +

  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install --no-frozen-lockfile --ignore-scripts

  sed -i "s|@ELECTRONVERSION@|${_electronversion}|" "$srcdir/${pkgname%-git}.sh"
}

build() {
  cd "${pkgname%-git}"
  export PNPM_HOME="$srcdir/pnpm-home"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  
  _ensure_local_nvm
  pnpm clean
  
  pnpm build
  
  pnpm electron-builder --linux dir \
    ${dist} -c.electronDist=${electronDist} -c.electronVersion=${electronVer}
}

package() {
  cd "${pkgname%-git}"

  install -Dm644 pack/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/${pkgname%-git}/"
  
  if [ -d "pack/linux-unpacked/resources/app.asar.unpacked" ]; then
    cp -a pack/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/${pkgname%-git}/"
  fi

  if [ -d "pack/linux-unpacked/resources/extensions" ]; then
    cp -a pack/linux-unpacked/resources/extensions "$pkgdir/usr/lib/${pkgname%-git}/"
  elif [ -d "extensions" ]; then
    cp -a extensions "$pkgdir/usr/lib/${pkgname%-git}/"
  fi

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"

  install -Dm644 "$srcdir/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"

  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
