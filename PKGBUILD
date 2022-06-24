# Maintainer:  tx00100xt <tx00100xt@yandex.ru>
# Contributer: tx00100xt <tx00100xt@yandex.ru>

pkgname=serioussam-oddworld
pkginstdir=serioussam
oddworld=SamTFE-OddWorld.tar.xz
pkgver=0.20
_srcname="SE1-TFE-OddWorld-$pkgver"
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
source=("https://github.com/tx00100xt/SE1-TFE-OddWorld/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-OddWorld/SamTFE-OddWorld.tar.xz.partaa"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-OddWorld/SamTFE-OddWorld.tar.xz.partab"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-OddWorld/SamTFE-OddWorld.tar.xz.partac")
noextract=("SamTFE-OddWorld.tar.xz.partaa"
	"SamTFE-OddWorld.tar.xz.partab"
	"SamTFE-OddWorld.tar.xz.partac")
sha256sums=('e1c1738ea7af90155deb9a04f68fa6e7785bac11bb1dcd00d869f5f915fd49b2'
	"cf8887fee144147755a53b095be970974cd3722c7af1b1eff4734f7c3c4d211b"
	"f16e91cc9286888dd24d7e9c02ca6eb74ebb6b3cbe4732c8420652539b541ca9"
	"423e1f37554375b0a1fdce386f08a01410a7272b5f4a93b666ce40a4606846d1")

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Prepare XPLUS archive
  cat "$oddworld".part* > "$oddworld"

  # Install the SSA Modification data.
  mkdir "$srcdir/$_srcname"/{SamTFE,SamTFE/Mods,SamTFE/Mods/OddWorldHD} || return 0
  tar -xJvf "$srcdir/$oddworld" -C "$srcdir/$_srcname/SamTFE/"
  rm -f "$srcdir/$_srcname/SamTFE/Mods/SSA/Bin/libGame.so" || return 0
  rm -f "$srcdir/$_srcname/SamTFE/Mods/SSA/Bin/libEntities.so" || return 0
  chmod -R o=rx "$srcdir/$_srcname/SamTFE/Mods/OddWorldHD"
  chmod -R g=rx "$srcdir/$_srcname/SamTFE/Mods/OddWorldHD"

  # Making building scripts.
  cd "$srcdir/$_srcname/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tfe.sh

  chmod 755 build-linux"$_bits"-tfe.sh
}

build(){
  # Building Serious Sam Odd World.
  cd "$srcdir/$_srcname/Sources/"
  ./build-linux"$_bits"-tfe.sh

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGame.so" "$srcdir/$_srcname/SamTFE/Mods/OddWorldHD/Bin" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntities.so"  "$srcdir/$_srcname/SamTFE/Mods/OddWorldHD/Bin" || return 1

  # Removing Serious Sam Odd World tmp stuff.
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
