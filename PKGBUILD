# Contributor: solarbaron
pkgname=feishin-git
pkgver=0.14.0.r7.g636c227
pkgdesc='Modern music player with support for navidrome servers.'
pkgrel=1
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
optdepends=('mpv: Alternative audio backend')
makedepends=('pnpm')
url='https://github.com/jeffvli/feishin'
provides=("${pkgname%-git}")
conflicts=("feishin" "feishin-bin")
source=("$pkgname::git+$url" "feishin.desktop")
sha512sums=('SKIP'
            '28ea38f1440adc5414ac82c6d319164870c38a1c41dd2216bc78b9ed3368cb1d150191f3b7435b749d56a7c15f0342d0846b226f8111ed9b89eb25580cbd6705')

pkgver() {
    cd "${srcdir}/${pkgbase}"
    (
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
  cd $pkgname
  export npm_config_cache="$(mktemp -d)"
  pnpm install --force
  pnpm run package
  rm -rf "$npm_config_cache"
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  cp -r "$pkgname/dist/linux-unpacked/"* "$pkgdir/usr/share/$pkgname"
  install -Dm644 "$pkgdir/usr/share/feishin-git/resources/assets/icons/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  ln -s /usr/share/feishin-git/feishin "${pkgdir}/usr/bin/feishin"
  install -Dm644 feishin.desktop "$pkgdir/usr/share/applications/"
}

