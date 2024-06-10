# Contributor: solarbaron
pkgname=feishin-git
pkgver=0.7.1.r10.gb30fadd
pkgdesc='Modern music player with support for navidrome servers.'
pkgrel=1
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
optdepends=('mpv: Alternative audio backend')
makedepends=('npm')
url='https://github.com/jeffvli/feishin'
provides=("${pkgname%-git}")
conflicts=("feishin" "feishin-bin")
source=("$pkgname::git+$url" "feishin.desktop")
sha512sums=('SKIP'
            '9ad2246032d0b2bb30d16eb947861c5bf3b966ef2dc5b744baa1b82953d8be85662679a233c0bbd72dd83909384923fb06e16a001ad29f0708975f2c582c696a')

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
  npm install --force
  npm run package
  rm -rf "$npm_config_cache"
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

