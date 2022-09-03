# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Hekuran https://github.com/narukeh
# Contributor: selurvedu

# A legally obtained copy of the Super Mario 64 ROM should be included
# The US version should have a sha1sum of 9bef1128717f958171a4afac3ed78ee2bb4e86ce

_region=us
_pkgname=sm64ex
pkgname=$_pkgname-redrawn-git
pkgver=r513.58
pkgrel=4
pkgdesc='Super Mario 64 PC port (sm64ex fork) with the redrawn texture pack and HD Mario'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/sm64pc/sm64ex'
license=('reverse-engineered and unlicensed')
depends=('sdl2')
makedepends=('audiofile' 'git' 'python')
provides=($_pkgname)
conflicts=($_pkgname)

source=(
  'git+https://github.com/sm64pc/sm64ex.git'
  'git+https://github.com/TechieAndroid/sm64redrawn'
  'https://www.sm64pc.info/forum/download/file.php?id=3' # HD Mario
  "$_pkgname.desktop"
  "$_pkgname.svg"
  "$_pkgname.sh"
  "http://localhost/baserom.$_region.z64"
)

sha512sums=(
  'SKIP'
  'SKIP'
  '1fbe98f4ea4439b5fb5eff5d985df5815cf4b30333004cb64133b6fb6bb2b6afd8b3154c6df79d73ce07eb573779bcdb3e282ebda3f356f6cc347206da816f7d'
  '2e8979c01b314d7acce55f246390ff6667700b97da1831c058b16551e7c506886e4c87397266be5f53848016567eb1743cd4b14ff7d186fa2544e3a76d735755'
  'af383cb853eb13376bc9697986756b29c15c3c22f8e7da2fec0516f26e12613e209af6f0470eab483bbcf462778af7f01d412c67f5277691e9823dc5bd885a80'
  '7e6cbbac98800a714fc2074027b54aacdbd4bd2ea4f01f09b0fd764b775c2feef6021c1d36ce88703ca1b750cfd381695e7eaafa90d15f5d60b7bfbdfd21fe69'
  'SKIP'
)

pkgver() {
  cd sm64redrawn
  redrawn_version=$(git rev-list --count HEAD)
  cd ../$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$redrawn_version"
}

prepare() {
  find actors -type f -exec cp '{}' $_pkgname/'{}' \; # HD Mario
  cd $_pkgname
  cp ../baserom.$_region.z64 . # Copy the ROM
}

build() {
  cd $_pkgname
  make VERSION=$_region BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXTERNAL_DATA=1 ${MAKEFLAGS:--j$(nproc)}
}

package() {
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 $_pkgname/build/${_region}_pc/sm64.${_region}.* "$pkgdir/usr/share/$_pkgname/$_pkgname"
  install -Dm644 $_pkgname/build/${_region}_pc/res/base.zip "$pkgdir/usr/share/$_pkgname/res/base.zip"
  cp -r --no-preserve=owner sm64redrawn/gfx "$pkgdir/usr/share/$_pkgname/res/" # sm64redrawn
}
