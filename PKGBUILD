# Maintainer:  tx00100xt <tx00100xt@yandex.ru>
# Contributer: tx00100xt <tx00100xt@yandex.ru>

pkgname=serioussam-pefe2q
pkginstdir=serioussam
pefe2q=SamTFE-ParseError.tar.xz
pkgver=1.0
_srcname="SE1-ParseError-$pkgver"
pkgrel=1
pkgdesc="Serious Sam Classic Odd World native Linux."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SE1-TFE-OddWorld"
license=('GPL2')

if pacman -Qq serioussam >/dev/null 2>&1; then
  depends=('sdl2' 'python' 'bash' 'serioussam')
elif pacman -Qq serioussam-vk >/dev/null 2>&1; then
  depends=('sdl2' 'python' 'bash' 'serioussam-vk')
else
  echo "This package requires either "serioussam" or "serioussam-vk", but neither is installed."
  echo "Compilation aborted."
  return 1
fi

makedepends=('cmake' 'make' 'sed')
source=("https://github.com/tx00100xt/SE1-ParseError/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-ParseError/SamTFE-ParseError.tar.xz.partaa"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-ParseError/SamTFE-ParseError.tar.xz.partab"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-ParseError/SamTFE-ParseError.tar.xz.partac"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-ParseError/SamTFE-ParseError.tar.xz.partad"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-ParseError/SamTFE-ParseError.tar.xz.partae")
noextract=("SamTFE-ParseError.tar.xz.partaa"
	"SamTFE-ParseError.tar.xz.partab"
	"SamTFE-ParseError.tar.xz.partac"
	"SamTFE-ParseError.tar.xz.partad"
	"SamTFE-ParseError.tar.xz.partae")
sha256sums=('37107b628ef3a0e34ce71ca95919350c145d0a23b7adfe84b0a7c02ee1bc76a5'
	"2c526f04b95397df34c72710104ae953036790f3a18ea819efa89a1bafe11c0e"
	"68669299cbb8260569f6058d8c293162c5b6d9e3281525d910ce4ed0d26061bf"
	"f9631058d2a3db76440ed22e7acbe231288a4f2d5c56a69073c8f212c9602244"
	"64e43b7bf3d5a79f164beea14d53e726719bef01b6683b8c6173a5da5c46c2cd"
	"718312ec829c04a5e78c928280da6365c2d013f6a31f14c4e5083cde4fe14b05")

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Prepare PEFE2Q archive
  cat "$pefe2q".part* > "$pefe2q"

  # Install the PEFE2Q Modification data.
  mkdir "$srcdir/$_srcname"/{SamTFE,SamTFE/Mods,SamTFE/Mods/PEFE2,SamTFE/Mods/PEFE2HD} || return 0
  tar -xJvf "$srcdir/$pefe2q" -C "$srcdir/$_srcname/SamTFE/"
  rm -f "$srcdir/$_srcname/SamTFE/Mods/PEFE2/Bin/libGame.so" || return 0
  rm -f "$srcdir/$_srcname/SamTFE/Mods/PEFE2/Bin/libEntities.so" || return 0
  rm -f "$srcdir/$_srcname/SamTFE/Mods/PEFE2HD/Bin/libGame.so" || return 0
  rm -f "$srcdir/$_srcname/SamTFE/Mods/PEFE2HD/Bin/libEntities.so" || return 0
  chmod -R o=rx "$srcdir/$_srcname/SamTFE/Mods/PEFE2"
  chmod -R g=rx "$srcdir/$_srcname/SamTFE/Mods/PEFE2"
  chmod -R o=rx "$srcdir/$_srcname/SamTFE/Mods/PEFE2HD"
  chmod -R g=rx "$srcdir/$_srcname/SamTFE/Mods/PEFE2HD"
}

build(){
  # Building PEFE2 Modification.
  cd "$srcdir/$_srcname/Sources/"
  cp -vfr EntitiesMP/PlayerWeapons_old.es EntitiesMP/PlayerWeapons.es || return 1
  rm -fr cmake-build
  mkdir cmake-build
  cd cmake-build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
  make -j4

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGameMP.so" "$srcdir/$_srcname/SamTFE/Mods/PEFE2/Bin/libGame.so" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntitiesMP.so"  "$srcdir/$_srcname/SamTFE/Mods/PEFE2/Bin/libEntities.so" || return 1

  # Building PEFE2HD Modification.
  cd "$srcdir/$_srcname/Sources/"
  cp -vfr EntitiesMP/PlayerWeaponsHD.es EntitiesMP/PlayerWeapons.es || return 1
  rm -fr cmake-build
  mkdir cmake-build
  cd cmake-build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
  make -j4

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGameMP.so" "$srcdir/$_srcname/SamTFE/Mods/PEFE2HD/Bin/libGame.so" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntitiesMP.so"  "$srcdir/$_srcname/SamTFE/Mods/PEFE2HD/Bin/libEntities.so" || return 1

  # Removing Serious Sam PEFE2Q tmp stuff.
  cd "$srcdir/$_srcname/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old,*.md}
  rm -fr "$srcdir/$_srcname"/{Images,x32,x64}
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/share/licenses

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -f  "$srcdir/$_srcname/LICENSE" || return 1
  rm -f  "$srcdir/$_srcname/.gitattributes" || return 1
  rm -f  "$srcdir/$_srcname/.gitignore" || return 1

  # Install data.
  mv "$srcdir/$_srcname" "$pkgdir/usr/share/$pkginstdir"
}
