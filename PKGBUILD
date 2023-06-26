# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: joelvaz0x01 <joelvaz dot whitehat at gmail dot com>
# Contributor: Dawid Weglarz <dawid.weglarz95@gmail.com>
# Contributor: candroid_man <candroid_man@protonmail.com>
# Contributor: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>

pkgname=notesnook
pkgver=2.5.5
pkgrel=2
_electronversion=21
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote"
arch=('any')
url="https://github.com/streetwriters/notesnook"
license=('GPL3')
options=(!strip)
provides=(${pkgname})
conflicts=(${pkgname})
depends=("electron$_electronversion" 'libappindicator-gtk3' 'libnotify' 'libsodium' 'libxss' 'libxtst')
makedepends=('nvm' 'git' 'yarn')
source=("git+$url.git#tag=v$pkgver"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            'f0e084aa6dae51e4f18962f5ca2b83c4150dc26dfad69301f0e8d2d0d0d876b5')

prepare() {
  source /usr/share/nvm/init-nvm.sh && nvm install lts/gallium
}

build() {
  cd notesnook
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
  cd apps/desktop
  npm install
  rm -rf ./build && cp -r ../build ./
  npm run build

  # Build with electron
  npx electron-builder --linux --x64 --dir -c.electronDist=$electronDist -c.electronVersion=$electronVer --publish=never
}

package() {
  cd notesnook/apps/desktop
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
