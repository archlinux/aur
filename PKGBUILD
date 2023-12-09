# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: wcyat <wcyat at wcyat dot me>
pkgname=electronmail
pkgver=5.2.2
pkgrel=1
_electronversion=27
pkgdesc="Unofficial ProtonMail Desktop App"
arch=('x86_64')
url="https://github.com/vladimiry/ElectronMail"
license=('GPL3')
depends=("electron${_electronversion}" 'libsecret')
makedepends=('git' 'libxcrypt-compat' 'npm' 'pnpm' 'yarn')
optdepends=('org.freedesktop.secrets: password storage backend')
_commit=c5f76ecf5285cfd0c5b23c8e667fba68281e754a  # tags/v5.2.2^0
source=("git+https://github.com/vladimiry/ElectronMail.git#commit=${_commit}"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('SKIP'
            'fa9159a243673390d1f36108b01af2ab9819fdec192ad7ffd405bbf7ab49f10b'
            'eefff93811dbca372fd32c670d20c646c6bec127e82e00bf67b3335cea19a6ba')

pkgver() {
  cd ElectronMail
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd ElectronMail
}

build() {
  cd ElectronMail
  export PNPM_HOME="$srcdir/pnpm-home"
  export npm_config_cache="$srcdir/npm_cache"
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  pnpm install --frozen-lockfile
  pnpm app:dist
  npm exec --package=electron-builder -- electron-builder --linux pacman \
    -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd ElectronMail
  install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/$pkgname/"
  cp -r dist/linux-unpacked/resources/app.asar.unpacked -t "$pkgdir/usr/lib/$pkgname/"

  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 app/assets/icons/png/${i}x${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
