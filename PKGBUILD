# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=soundnode
pkgname=$_pkgname-youtube-dl
pkgver=7.0.0
pkgrel=1
pkgdesc='Soundcloud for desktop with youtube-dl patch to bypass API rate limit'
url='http://www.soundnodeapp.com'
license=('GPL3')
arch=('armv6h' 'armv7h' 'arm' 'i686' 'x86_64')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nodejs' 'nss' 'youtube-dl')
makedepends=('npm')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")
_install_dir=/usr/lib/$_pkgname

source=(
  "https://github.com/Soundnode/soundnode-app/archive/$pkgver.tar.gz"
  "$_pkgname.desktop"
  'electron-packager-version.patch'
  'youtube-dl.patch'
)

sha512sums=(
  'd9d0512d04ccd3e18895124b8c04c966700e8db95108dcd03097c1209973bcaaa15a1d819590f530a4371ab0ee0591ae1f034a620f07502f75e430969405ad06'
  'b9d090df430b9b756a980523460869fe3da4370cdcc7be3d33c61f05f2e223765c10e3e25e075af9f6a1cfb229a054888844ff87a1fe5bf36563305882b56ac5'
  'eebc09d4e5be363ea17c1d0f270f5cea6ba7bed3dae58ce5b6093916b6e40746f03b545555dc14c98e4d1d151321905b1ae44c238c6c35e036e6ef01f41e7b70'
  '344dbf93e5280f72763a1cc5c3bb5f401ce5e0a741642f0f7b801819844dd89300569e1ea65e404e3984e3c96ef2be2fc2dd78698aec816b0680e9f676424d6c'
)

prepare() {
  cd $_pkgname-app-$pkgver
  patch -p1 < ../electron-packager-version.patch # doesn't build with the latest version of node unless we update electron-packager
  patch -p1 < ../youtube-dl.patch # from https://github.com/Soundnode/soundnode-app/pull/1029
}

build() {
  cd $_pkgname-app-$pkgver
  npm install
  npm run clean
  npm run webpack:prod
  npm run sass:prod
  npm run package:linux
  cd dist/Soundnode/Soundnode-linux-x64
  find resources/app/node_modules -type f -name package.json -exec sed -i "/${srcdir//\//\\/}/d" '{}' \; # remove references to $srcdir from package.json files
}

package() {
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  cd $_pkgname-app-$pkgver
  install -Dm644 app/$_pkgname.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  cd dist/Soundnode/Soundnode-linux-x64
  install -d m755 "$pkgdir/$_install_dir"
  cp -r * "$pkgdir/$_install_dir/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "$_install_dir/Soundnode" "$pkgdir/usr/bin/$_pkgname"
}
