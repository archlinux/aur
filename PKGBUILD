# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=popcorntime-git
_pkgname=popcorntime
_gitname=popcorn-desktop
pkgver=0.3.10+6288+be800aa9
pkgrel=3
pkgdesc='Stream movies and TV shows from torrents'
arch=(i686 x86_64)
url=https://popcorntime.sh
license=(GPL3)
depends=(alsa-lib gconf gtk2 nss ttf-font libxtst libnotify)
makedepends=(git wget)
provides=(popcorntime)
conflicts=(popcorntime popcorntime-ce)
options=(!strip)
source=(git+https://github.com/popcorn-official/$_gitname#branch=development
        $_pkgname.desktop)
sha512sums=(SKIP
            5a5ddbe76a8290a3a2789b7241865e91f8bb954273c49a39854226da6d34eb5dfbc3a18691da77853e1e72affa528355bacab4b0efd44b079d5bc7c2471b8cc7)

pkgver() {
  cd $_gitname
  echo $(git tag)+$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)
}

[ "$CARCH" = i686 ] && _arch=x86 _platform=linux32 _nwjsffmpegarch=ia32
[ "$CARCH" = x86_64 ] && _arch=x64 _platform=linux64 _nwjsffmpegarch=x64
_nwjsver=0.18.6 _nwjsffmpeg=$_nwjsver-linux-$_nwjsffmpegarch

prepare() {
  msg2 'Using upstream NW.js instead of downstream...'
  sed -i s#get.popcorntime.sh/repo/nw#dl.nwjs.io# $_gitname/gulpfile.js
  msg2 'Using custom open-source NW.js FFmpeg version...'
  [ -f $_nwjsffmpeg.zip ] || wget https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$_nwjsver/$_nwjsffmpeg.zip
}

build() {
  msg2 'Using temporary Node.js toolchain...'
  _nodever=6.14.3
  _node=node-v$_nodever-linux-$_arch
  [ -f $_node.tar.xz ] || wget https://nodejs.org/dist/v$_nodever/$_node.tar.xz
  tar xfp $_node.tar.xz
  PATH=$PWD/$_node/bin:$PWD/$_gitname/node_modules/.bin:$PATH
  npm_config_cache=$PWD/npm_cache
  cd $_gitname
  npm install
  gulp build
}

package() {
  install -Dm 644 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  cd $_gitname/build/Popcorn-Time/$_platform
  install -Dm 644 src/app/images/icon.png $pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png
  install -d $pkgdir/usr/{share/$_pkgname,bin}
  unzip -o $srcdir/$_nwjsffmpeg.zip -d lib
  cp -a . $pkgdir/usr/share/$_pkgname
  cd $pkgdir/usr/share/$_pkgname
  find . -type f -exec chmod 644 {} +
  chmod +x Popcorn-Time
  ln -s /usr/share/$_pkgname/Popcorn-Time $pkgdir/usr/bin/$_pkgname
}
