# Maintainer: Mesmer <ldepaula at gmail dot com>
pkgname=youtube-music-git
pkgver=r898.a47c906
pkgver(){
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
pkgrel=1
pkgdesc="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
arch=('x86_64')
url="https://th-ch.github.io/youtube-music"
license=('MIT')
depends=('gtk3' 'libsecret' 'nss')
optdepends=('libnotify: desktop notifications'
            'libappindicator-gtk3: tray icon')
provides=("${pkgname}")
conflicts=("youtube-music-bin")
source=("$pkgname::git+https://github.com/th-ch/youtube-music.git")
md5sums=("SKIP")

build(){

  cd $srcdir/$pkgname
  yarn
  yarn build:linux  tar.xz
  version=$(cat package.json |grep version| cut -d'"' -f4)
  bsdtar xfv dist/youtube-music-$version.tar.xz 

}

package(){
  version=$(cat $srcdir/$pkgname/package.json |grep version| cut -d'"' -f4)
  
  install -d "$pkgdir/opt/Youtube Music/"
  install -d "$pkgdir/usr/bin/"
  cp $srcdir/$pkgname/youtube-music-$version/* "$pkgdir/opt/Youtube Music/" -r
  ln -s  "$pkgdir/opt/Youtube Music/youtube-music" $pkgdir/usr/bin/youtube-music
  install -Dm644 $srcdir/$pkgname/license -t "$pkgdir/$pkgname/usr/share/licenses/$pkgname"
}

