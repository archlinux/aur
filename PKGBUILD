# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=serioussam-alpha
pkginstdir=serioussam
ssa=SeriousSamAlphaRemake_v1.5.tar.xz
pkgver=1.5
_srcname="SeriousSamAlphaRemake-$pkgver"
pkgrel=4
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
	"d5eef988652bf0f157f58c4faf92911b1c71a948229a035e7a237f973b39db5b"
	"c412a76659b87892d4bb879d53f774ba72b1e6905901a1e042a72821a6a412c1"
	"331a0d2fd0cc6dce4a3eda3c2a898043ca4bc55fa8ab7fc2094f7f1f1df8853e"
	"0e3749e6c0492a3cdd5ff3f9f55e6141fb415090c32922d7073f6c5eb265d479")

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
  rm -f "$srcdir/$_srcname/SamTFE/Mods/SSA/Bin/libGame.so" || return 0
  rm -f "$srcdir/$_srcname/SamTFE/Mods/SSA/Bin/libEntities.so" || return 0
  rm -f "$srcdir/$_srcname/SamTFE/Mods/SSA/Data/Translations/engine.txt" || return 0
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
  install -d $pkgdir/usr/lib/{serioussam,serioussam/Mods,serioussam/Mods/SSA}
  install -d $pkgdir/usr/share/{serioussam,serioussam/Mods}

  install -D -m0755 $srcdir/$_srcname/SamTFE/Mods/SSA/Bin/libGame.so $pkgdir/usr/lib/serioussam/Mods/SSA
  install -D -m0755 $srcdir/$_srcname/SamTFE/Mods/SSA/Bin/libEntities.so  $pkgdir/usr/lib/serioussam/Mods/SSA

  rm -fr "$srcdir/$_srcname/SamTFE/Mods/SSA/Bin"

  # Making sure directories exist.
  install -d $pkgdir/usr/share/licenses

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -f  "$srcdir/$_srcname/LICENSE" || return 1

  # Install data.
  mv "$srcdir/$_srcname/SamTFE/Mods" "$pkgdir/usr/share/$pkginstdir/"
}
