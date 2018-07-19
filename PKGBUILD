# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=popcorntime-git
_pkgname=popcorntime
_gitname=popcorn-desktop
pkgver=0.3.10+6288+be800aa9
pkgrel=1
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
  printf $(git tag)+$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)
}

#prepare() {
#  cd $_gitname
#  msg2 'Using upstream NW.js instead of downstream one...'
#  sed -i s#get.popcorntime.sh/repo/nw#dl.nwjs.io# gulpfile.js
#}

[ "$CARCH" = i686 ] && _arch=x86 _platform=linux32
[ "$CARCH" = x86_64 ] && _arch=x64 _platform=linux64

build() {
  msg2 'Using temporary Node.js toolchain...'
  _nodever=v6.14.3
  _node=node-$_nodever-linux-$_arch
  [ -f $_node.tar.xz ] || wget https://nodejs.org/dist/$_nodever/$_node.tar.xz
  tar xfp node-$_nodever-linux-$_arch.tar.xz
  export PATH=$PWD/$_node/bin:$PWD/$_gitname/node_modules/.bin:$PATH
  export npm_config_cache=$PWD/npm_cache
  cd $_gitname
  npm install
  gulp build
}

package() {
  install -d $pkgdir/usr/{share/$_pkgname,bin}
  install -Dm 644 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  cd $_gitname/build/Popcorn-Time/$_platform
  install -Dm 644 src/app/images/icon.png $pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png
  cp -a . $pkgdir/usr/share/$_pkgname
  cd $pkgdir/usr/share/$_pkgname
  find . -type f -exec chmod -R +r,-x {} +
  chmod +x Popcorn-Time
  ln -s /usr/share/$_pkgname/Popcorn-Time $pkgdir/usr/bin/$_pkgname
}
