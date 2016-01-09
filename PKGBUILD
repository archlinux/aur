# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=zero-ballistics
pkgver=2.0
pkgrel=10
_pgname=zb_20
pkgdesc='A unique blend of multiplayer first person shooter and tank combat game'
arch=('i686' 'x86_64')
url='http://www.zeroballistics.com/'
license=('GPL')
depends=('libgl' 'openscenegraph-2.8' 'raknet-3.261' 'cegui-0.5' 'loki-lib' 'freealut' 'tinyxml' 'ode-011' 'libvorbis' 'boost' 'sdl')
source=(http://downloads.sourceforge.net/project/zeroballistics/models/blender_models.zip
http://www.zeroballistics.com/public/readme.html
launcher.sh
launcher-ded.sh
zero-ballistics.desktop
boost.patch
multiple_fixes.patch)
md5sums=('85ceb55c221468d2ce5a1d50cc98fd0a'
         'd9490617a757ad6c3253d995ba84be57'
         '3c3be3b2599c2b5b9ae7b68d8bd48234'
         '24fcd633a625eee14bc84934be6ac5b3'
         '95c9a541679510597a737b63cbd72c4f'
         '2ac9d41d161b85a6a614f482e8415f54'
         '93589787bb795af199e7540fff515616')

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$pkgname/.svn" ]]; then
    (cd "$pkgname" && svn up)
  else
    svn co "https://zeroballistics.svn.sourceforge.net/svnroot/zeroballistics/tags/v2.0" --config-dir ./ "$pkgname"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$pkgname-build"
  cp -r "$srcdir/$pkgname" "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build"

  patch -Np1 -i $srcdir/boost.patch
  
  find . -name CMakeLists.txt -exec sed -i 's/RakNet/raknet/g' '{}' \;
  find . -name CMakeLists.txt -exec sed -i 's|/usr/local/include/CEGUI|/usr/include/CEGUI|g' '{}' \;
  cd ..
  patch -p1 -i $srcdir/multiple_fixes.patch
  cd $pkgname-build

  cd code/
  cmake .
  make

}

package() {
  cd $srcdir/$pkgname-build/code/games/tank

  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r 'config_client.xml' \
  'config_common.xml'\
  'config_server.xml'\
  'ranking.pub'\
  "$pkgdir/opt/$pkgname"

  cp -r "$srcdir/$pkgname-build/data" "$pkgdir/opt/$pkgname"

  #models
  cp -r "$srcdir/data" "$pkgdir/opt/$pkgname"

  #game crashes when connecting without write rights
  find "$pkgdir/opt/$pkgname/data/" -type f -exec chmod 666 {} \;
  find "$pkgdir/opt/$pkgname/data/" -type d -exec chmod 777 {} \;

  install -Dm 755 'tank' "$pkgdir/opt/$pkgname"
  install -Dm 755 'server_ded' "$pkgdir/opt/$pkgname"
  
  cd "$srcdir"
  install -Dm 755 'launcher.sh' "$pkgdir/usr/bin/zero-ballistics"
  install -Dm 755 'launcher-ded.sh' "$pkgdir/usr/bin/zero-ballistics-ded"
  install -Dm 644 'readme.html' "$pkgdir/usr/share/doc/zero-ballistics/README.html"
  install -Dm 644 'zero-ballistics.desktop' "$pkgdir/usr/share/applications/zero-ballistics.desktop"

}

#category: games
# vim:set ts=2 sw=2 et:
