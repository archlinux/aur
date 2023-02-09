# Maintainer: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributer: Dawid Weglarz <dawid.weglarz95@gmail.com>
# Contributer: candroid_man <candroid_man@protonmail.com>
# Contributer: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>

pkgname=notesnook
pkgver=2.4.2
pkgrel=2
pkgdesc="Take private notes, capture ideas, make lists & sync them anywhere"
arch=('x86_64')
url="https://notesnook.com/"
license=('GPLv3')
options=(!strip)
provides=(${pkgname})
conflicts=(${pkgname})
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
makedepends=('nvm' 'git')
source=(git+https://github.com/streetwriters/${pkgname}.git
        ${pkgname}.desktop)
sha512sums=('SKIP'
            '3b321b067f3123884bd8bd15cfcaea3d9d5745f82c8ee60ece7a6606f39f0113310544f8e93244cc620f3ee97fa47cc8b62496387d553a6b6c69c9deaf48382b')

prepare() {
  cd "${srcdir}"/${pkgname}
  git checkout v${pkgver}
  source /usr/share/nvm/init-nvm.sh && nvm install lts/gallium
}

build() {
  source /usr/share/nvm/init-nvm.sh && nvm use lts/gallium --silent

  # Build @notesnook/web
  cd "${srcdir}"/${pkgname}
  npm install
  npm run build:web

  # Prepare files to pack with electron
  cd apps/web/desktop && npm install
  rm -rf ./build && cp -r ../build ./ && npm run build

  # Build with electron
  npx electron-builder --publish=never --config.directories.output=release --config.artifactName=notesnook.tar.xz --linux tar.xz
}

package() {
  cd "${srcdir}"/${pkgname}/apps/web/desktop  
  install -d "${pkgdir}"/{opt,usr/bin}

  # Extract electron build
  tar -xvf release/${pkgname}.tar.xz -C "${pkgdir}"/opt

  # Symlink
  ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin

  # Desktop file
  install -Dm 644 "${srcdir}"/../${pkgname}.desktop -t "${pkgdir}"/usr/share/applications

  # Icons
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm 644 "${srcdir}"/${pkgname}/apps/web/desktop/assets/icons/${i}x${i}.png \
      "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png
  done
}
