# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=popcorntime-git
pkgver=0.3.10+6288+be800aa9
pkgrel=3
pkgdesc='BitTorrent client with integrated media player'
arch=(i686 x86_64)
url=https://popcorntime.sh
license=(GPL3)
depends=(alsa-lib gconf gtk2 nss ttf-font libxtst libnotify)
makedepends=(git wget unzip)
provides=(popcorntime)
conflicts=(popcorntime popcorntime-ce)
options=(!strip)
source=(git+https://github.com/popcorn-official/popcorn-desktop#branch=development)
sha512sums=(SKIP)

pkgver() {
  cd popcorn-desktop
  echo $(git tag)+$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)
}

[ "$CARCH" = i686 ] && _arch=x86 _platform=linux32 _nwjsffmpegarch=ia32
[ "$CARCH" = x86_64 ] && _arch=x64 _platform=linux64 _nwjsffmpegarch=x64
_nwjsver=0.18.6 _nwjsffmpeg=$_nwjsver-linux-$_nwjsffmpegarch

prepare() {
  msg2 'Using upstream NW.js instead of downstream...'
  sed -i s#get.popcorntime.sh/repo/nw#dl.nwjs.io# popcorn-desktop/gulpfile.js
  msg2 'Using custom open-source NW.js FFmpeg version...'
  [ -f $_nwjsffmpeg.zip ] || wget https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$_nwjsver/$_nwjsffmpeg.zip
}

build() {
  msg2 'Using temporary Node.js toolchain...'
  _nodever=6.14.3 _node=node-v$_nodever-linux-$_arch
  [ -f $_node.tar.xz ] || wget https://nodejs.org/dist/v$_nodever/$_node.tar.xz
  tar xfp $_node.tar.xz
  PATH=$PWD/$_node/bin:$PWD/popcorn-desktop/node_modules/.bin:$PATH
  npm_config_cache=$PWD/npm_cache
  cd popcorn-desktop
  npm install
  gulp build
}

package() {
  install -Dm 644 ../popcorntime.desktop "$pkgdir"/usr/share/applications/popcorntime.desktop
  cd popcorn-desktop/build/Popcorn-Time/$_platform
  install -Dm 644 src/app/images/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/popcorntime.png
  install -d "$pkgdir"/usr/{share/popcorntime,bin}
  unzip -o $/$_nwjsffmpeg.zip -d lib
  cp -a . "$pkgdir"/usr/share/popcorntime
  cd "$pkgdir"/usr/share/popcorntime
  find . -type f -exec chmod 644 {} +
  chmod +x Popcorn-Time
  ln -s /usr/share/popcorntime/Popcorn-Time "$pkgdir"/usr/bin/popcorntime
}
