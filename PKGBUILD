# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=popcorntime-git
pkgver=0.3.10+6288+be800aa9
_nodever=6.14.3
_nwjsver=0.18.6
pkgrel=4
pkgdesc='BitTorrent client with integrated media player'
arch=(i686 x86_64)
url=https://popcorntime.sh
license=(GPL3)
depends=(alsa-lib gconf gtk2 nss ttf-font libxtst libnotify)
makedepends=(git)
provides=(popcorntime)
conflicts=(popcorntime popcorntime-ce)
options=(!strip)
source=(git+https://github.com/popcorn-official/popcorn-desktop#branch=development)
source_i686=(https://nodejs.org/dist/v$_nodever/node-v$_nodever-linux-x86.tar.xz
             https://dl.nwjs.io/v$_nwjsver/nwjs-sdk-v$_nwjsver-linux-ia32.tar.gz
             https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$_nwjsver/$_nwjsver-linux-ia32.zip)
source_x86_64=(https://nodejs.org/dist/v$_nodever/node-v$_nodever-linux-x64.tar.xz
               https://dl.nwjs.io/v$_nwjsver/nwjs-sdk-v$_nwjsver-linux-x64.tar.gz
               https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$_nwjsver/$_nwjsver-linux-x64.zip)
sha512sums=(SKIP)
sha512sums_i686=(609b2e149ac59082a520719f95e703b6b45b8ce21897fe4f4fa4571c6030a6945f1324582b9a708a8e2b42947fae40584e29d6b3214c210a70c2869f4fd8d6f4
                 458da696d702afa450cde3371b0ca87ac99a323a27ad9e304eb4a06af008f1a7d20cfeb11e4005716da1506ec28fe222679ad228f856f844ed516b7d2e7cea88
                 5435d42244a6dc8b5f11a556fe45991ff64058de8ec55c63f18a837b9bc7a2bb9ec1eac08c2876225b83c22e6478a71599eb30d517cc6261c948b4b579a36573)
sha512sums_x86_64=(
            c727809867ea727e6fbdbd0ed7fcc6ce1a755f38625b1296bdf54a7fd38e5d9b5f8c5c48e7208ed5cdaaa910a36eb5d19b2f95ee3c5ee35e717e76dcc6de6b40
            863a99a04f547ef9ca6030ed98954ffaee4009c995d8b99be23d0895e09786fd4debb5946d38cf625c87d567738b8271848500391740fd99de6678818741a615
            669fae5f220d1508187c29c05d4af46033df29ad053dfecd95dd776df36095b1fff9aee9b2f4271908bf899e57ae75357059af46175353385b1b0561ee15ab72)

pkgver() {
  cd popcorn-desktop
  echo $(git tag)+$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)
}

prepare() {
  msg2 'Using upstream NW.js instead of downstream...'
  sed -i s#get.popcorntime.sh/repo/nw#dl.nwjs.io# popcorn-desktop/gulpfile.js
}

[ "$CARCH" = i686 ] && _arch=x86 _platform=linux32 _nwjsffmpegarch=ia32
[ "$CARCH" = x86_64 ] && _arch=x64 _platform=linux64 _nwjsffmpegarch=x64

build() {
  msg2 'Using temporary Node.js toolchain...'
  PATH=$PWD/node-v$_nodever-linux-$_arch/bin:$PWD/popcorn-desktop/node_modules/.bin:$PATH
  npm_config_cache=$PWD/npm_cache
  cd popcorn-desktop
  npm install
  _cache=cache/$_nwjsver-sdk/$_platform
  mkdir -p $_cache
  cp -a ../nwjs-sdk-v$_nwjsver-linux-$_nwjsffmpegarch/* $_cache
  gulp build
}

package() {
  install -Dm 644 ../popcorntime.desktop "$pkgdir"/usr/share/applications/popcorntime.desktop
  cd popcorn-desktop/build/Popcorn-Time/$_platform
  install -Dm 644 src/app/images/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/popcorntime.png
  install -d "$pkgdir"/usr/{share/popcorntime,bin}
  cp -a . "$pkgdir"/usr/share/popcorntime
  cd "$pkgdir"/usr/share/popcorntime
  find . -type f -exec chmod 644 {} +
  chmod +x Popcorn-Time
  ln -s /usr/share/popcorntime/Popcorn-Time "$pkgdir"/usr/bin/popcorntime
  msg2 'Installing custom open-source NW.js FFmpeg version...'
  install -Dm 644 "$srcdir"/libffmpeg.so -t lib
}
