# Maintainer: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributer: Dawid Weglarz <dawid.weglarz95@gmail.com>
# Contributer: candroid_man <candroid_man@protonmail.com>
# Contributer: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>

pkgname=notesnook
pkgver=2.4.4
pkgrel=1
_electronversion=21
pkgdesc="Take private notes, capture ideas, make lists & sync them anywhere"
arch=('x86_64')
url="https://notesnook.com/"
license=('GPLv3')
options=(!strip)
provides=(${pkgname})
conflicts=(${pkgname})
depends=("electron$_electronversion" 'gtk3' 'libxss' 'libnotify' 'libappindicator-gtk3')
makedepends=('nvm' 'git' 'yarn')
source=(notesnook::git+https://github.com/streetwriters/notesnook.git
        ${pkgname}.desktop)
sha512sums=('SKIP'
            '3b321b067f3123884bd8bd15cfcaea3d9d5745f82c8ee60ece7a6606f39f0113310544f8e93244cc620f3ee97fa47cc8b62496387d553a6b6c69c9deaf48382b')

prepare() {
  source /usr/share/nvm/init-nvm.sh && nvm install lts/gallium
}

build() {
  cd notesnook
  git checkout tags/v${pkgver}
  source /usr/share/nvm/init-nvm.sh && nvm use lts/gallium --silent
  electronDist=/usr/lib/electron$_electronversion
  electronVer=$(electron$_electronversion --version | tail -c +2)
  export npm_config_build_from_source=true
  export npm_config_cache="$srcdir/npm_cache"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1

  # Build @notesnook/web
  npm install
  npm run build:web

  # Prepare files to pack with electron
  cd apps/web/desktop
  npm install
  rm -rf ./build && cp -r ../build ./
  npm run build

  # Build with electron
  npx electron-builder --linux --x64 --dir -c.electronDist=$electronDist -c.electronVersion=$electronVer --publish=never
}

package() {
  cd notesnook/apps/web/desktop
  install -d "${pkgdir}"/{opt/${pkgname},usr/bin}

  # Copy electron build
  cp -va dist/linux-unpacked/. -t "${pkgdir}/opt/${pkgname}"

  # Icons
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -vDm644 assets/icons/${i}x${i}.png "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png
  done

  # Symlink
  ln -s /opt/${pkgname}/${pkgname} "${pkgdir}/usr/bin"

  # Desktop file
  install -vDm644 "${srcdir}"/${pkgname}.desktop -t "${pkgdir}"/usr/share/applications
}
