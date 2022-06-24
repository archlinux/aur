# Maintainer:  tx00100xt <tx00100xt@yandex.ru>
# Contributer: tx00100xt <tx00100xt@yandex.ru>

pkgname=serioussam-alpha
pkginstdir=serioussam
ssa=SeriousSamAlphaRemake_v1.5.tar.xz
pkgver=1.5
_srcname="SeriousSamAlphaRemake-$pkgver"
pkgrel=1
pkgdesc="Serious Sam Classic Alpha Reamake native Linux."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SeriousSamAlphaRemake"
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
source=("https://github.com/tx00100xt/SeriousSamAlphaRemake/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-SSA/SeriousSamAlphaRemake_v1.5.tar.xz.partaa"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-SSA/SeriousSamAlphaRemake_v1.5.tar.xz.partab"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-SSA/SeriousSamAlphaRemake_v1.5.tar.xz.partac"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-SSA/SeriousSamAlphaRemake_v1.5.tar.xz.partad")
noextract=("SeriousSamAlphaRemake_v1.5.tar.xz.partaa"
	"SeriousSamAlphaRemake_v1.5.tar.xz.partab"
	"SeriousSamAlphaRemake_v1.5.tar.xz.partac"
	"SeriousSamAlphaRemake_v1.5.tar.xz.partad")
sha256sums=('df75c5b2810533d1227c7f9aa6533fa9c06f9917cfb12a536a49cb64bc06aaf7'
	"a8a51c8d4dd6c402c0ba440dd9673b2db7131eb0d7f9507517e170120781777b"
	"a83b0a5e76cadc027df50fdc217a1c9bad25a76327c9feb562a53f3516d6edb5"
	"3ae1841b97129a82a55f59c5fa8b0bf316890260615f961fe3c82911035eccb3"
	"f97257f0d82c618dde4b456c8449b8bf4fc1084ff70649a32f34a5f5941202a5")

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Prepare Alpha Reamake archive
  cat "$ssa".part* > "$ssa"

  # Install the SSA Modification data.
  mkdir "$srcdir/$_srcname"/{SamTFE,SamTFE/Mods,SamTFE/Mods/SSA} || return 0
  tar -xJvf "$srcdir/$ssa" -C "$srcdir/$_srcname/SamTFE/"
  rm -f "$srcdir/$_srcname/SamTFE/Mods/SSA/Bin/libGame.so" || return 1
  rm -f "$srcdir/$_srcname/SamTFE/Mods/SSA/Bin/libEntities.so" || return 1
  chmod -R o=rx "$srcdir/$_srcname/SamTFE/Mods/SSA"
  chmod -R g=rx "$srcdir/$_srcname/SamTFE/Mods/SSA"

  # Making building scripts.
  cd "$srcdir/$_srcname/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tfe.sh

  chmod 755 build-linux"$_bits"-tfe.sh
}

build(){
  # Building Serious Sam Alpha Reamake.
  cd "$srcdir/$_srcname/Sources/"
  ./build-linux"$_bits"-tfe.sh

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGame.so" "$srcdir/$_srcname/SamTFE/Mods/SSA/Bin" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntities.so"  "$srcdir/$_srcname/SamTFE/Mods/SSA/Bin" || return 1

  # Building Serious Sam Alpha Reamake tmp stuff.
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

  # Install data.
  mv "$srcdir/$_srcname" "$pkgdir/usr/share/$pkginstdir"
}
