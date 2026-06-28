# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pear-desktop-git
_app_id=com.github.th-ch.youtube-music
pkgver=3.12.0.r1.g0bf89fc
pkgrel=2
_nodeversion=24
_electronversion=42
pkgdesc="YouTube Music Desktop App - including custom plugins"
arch=('x86_64')
url="https://github.com/pear-devs/pear-desktop"
license=('MIT')
depends=(
  "electron${_electronversion}"
  'libsecret'
)
makedepends=(
  'git'
  'imagemagick'
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
            'dd4bcc23a6c9b76223b35f035b85dd38db409633ab596d46a0c6f7517ecfe7cf')

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
  _ensure_local_nvm
  nvm install "${_nodeversion}"

  cd "${pkgname%-git}"
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install --frozen-lockfile

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

  # Generate icons
    for i in 16 24 32 48 64 128 256 512 1024; do
      magick "assets/icon.png" -resize "${i}x${i}" "assets/${_app_id}_${i}x${i}.png"
    done
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 pack/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/${pkgname%-git}/"
  cp -a pack/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/${pkgname%-git}"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 "assets/${_app_id}_${i}x${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${_app_id}.png"
  done

  install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "$srcdir/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 license -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
