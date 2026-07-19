# Maintainer: Anatoliy Ivanov <maintainers@folea.dev>
pkgname=folea-git
pkgver=r51.g41576c3
pkgrel=1
pkgdesc='Development build of the keyboard-driven Typst note reader'
arch=('x86_64')
url='https://github.com/ivanovanatoliy/folea'
license=('Apache-2.0')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libnotify' 'libsecret')
makedepends=('git' 'nodejs-lts-jod' 'npm')
provides=('folea')
conflicts=('folea')
options=('!strip')
source=('folea::git+https://github.com/ivanovanatoliy/folea.git#branch=develop'
        'folea.desktop'
        'folea.sh')
sha256sums=('SKIP'
            '8b71db57faab405bcf721d4e6185c5d82c056201896a14b1c9ca23c1bc8d8336'
            '14835d67b937df5874fdf05878bed07ed03bea2c1436b5837753966f2a2820d1')

pkgver() {
  cd folea
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd folea
  export CSC_IDENTITY_AUTO_DISCOVERY=false
  export FOLEA_SOURCE_BRANCH=develop
  local appver
  appver="$(node scripts/prepare-development-build.mjs)"
  npm ci
  npm version "$appver" --no-git-tag-version --allow-same-version
  npm run build
  npx electron-builder --dir --linux --x64 --publish never
}

package() {
  install -d "$pkgdir/opt/folea"
  cp -a "$srcdir/folea/dist/linux-unpacked/." "$pkgdir/opt/folea/"
  chmod 4755 "$pkgdir/opt/folea/chrome-sandbox"
  install -Dm755 "$srcdir/folea.sh" "$pkgdir/usr/bin/folea"
  install -Dm644 "$srcdir/folea.desktop" "$pkgdir/usr/share/applications/folea.desktop"
  install -Dm644 "$srcdir/folea/assets/logo/app-icon-dark.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/folea.svg"
}
