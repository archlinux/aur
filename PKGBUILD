# Contributor: solarbaron
pkgname=feishin-git
pkgver=v0.7.1.r9.gaa89c5e
pkgdesc='Modern music player with support for navidrome servers.'
pkgrel=1
arch=('x86_64' 'aarch64')
license=('GPL3')
optdepends=('mpv: Alternative audio backend')
makedepends=('npm')
url='https://github.com/jeffvli/feishin'
provides=("${pkgname%-git}")
conflicts=("feishin" "feishin-bin")
source=("$pkgname::git+$url" "feishin.desktop")
sha512sums=('SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^uuu_//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
  cd $pkgname 
  npm install --force
  npm run package
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  cp -r "$pkgname/release/build/linux-unpacked/"* "$pkgdir/usr/share/$pkgname"
  install -Dm644 "$pkgdir/usr/share/feishin-git/resources/assets/icons/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  ln -s /usr/share/feishin-git/feishin "${pkgdir}/usr/bin/feishin"
  install -Dm644 feishin.desktop "$pkgdir/usr/share/applications/"
}

