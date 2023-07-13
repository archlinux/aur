# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=serioussam-xplus
pkginstdir=serioussam
xplus_tfe=SamTFE-XPLUS.tar.xz
xplus_tse=SamTSE-XPLUS.tar.xz
pkgver=1.10.5
_srcname="SeriousSamClassic-$pkgver"
pkgrel=3
pkgdesc="Serious Sam Classic native Linux XPLUS Modification."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SeriousSamClassic"
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
source=("https://github.com/tx00100xt/SeriousSamClassic/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partaa"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partab"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partac"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partaa"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partab"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partac"
    "0001-remove_SE1_10b_depend.patch"
    "0003-Fix-load-some-incorrect-custom-maps.patch")
noextract=("SamTFE-XPLUS.tar.xz.partaa"
	"SamTFE-XPLUS.tar.xz.partab"
	"SamTFE-XPLUS.tar.xz.partac"
	"SamTSE-XPLUS.tar.xz.partaa"
	"SamTSE-XPLUS.tar.xz.partab"
	"SamTSE-XPLUS.tar.xz.partac")
sha256sums=('ecd850cabd144b29bcec97de4ad8a1ffc14144432744de9bf39fe1d00385daf6'
            '01b2e2d4dbdb65b2f1e174fbd6606d70806e97b6a45047ed6c58e7b801f6a879'
            'f8f35bcc54ed888b72b8660319ad089b7243b9e8d83aefabdb8f0111fcb0b728'
            '3da6b8588115cf31cb67e15f527dc8b6a83da16fe35ac8c7b78ed9522e0211a4'
            '28a90da56de5d6591a2e65154778030ba28b375d29556fd7e1db085d2c00b877'
            '93fe183a2f0a35989b3d1678dddb1c5976cda94747d4186c6f36af4ccf144443'
            '8282f527b54e9d8fe009640b7634560f3b4bf0fc9b72cdc2f865f1c226339d35'
            '244101d02598010e4c45e57f26e0842d4cff058e3cde5e59062b9d36b5ffaca0'
            '36b0c4da5133ef5dcdcfd21767c84f7b3e9711413549b565957a734e549ee300')
if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Prepare patch
  cat 0001-remove_SE1_10b_depend.patch > "$srcdir/$_srcname/0001-remove_SE1_10b_depend.patch"
  cat 0003-Fix-load-some-incorrect-custom-maps.patch > "$srcdir/$_srcname/0003-Fix-load-some-incorrect-custom-maps.patch"

  # Prepare XPLUS archive
  cat "$xplus_tfe".part* > "$xplus_tfe"
  cat "$xplus_tse".part* > "$xplus_tse"

  # Install the XPLUS Modification data.
  tar -xJvf "$srcdir/$xplus_tfe" -C "$srcdir/$_srcname/SamTFE/"
  tar -xJvf "$srcdir/$xplus_tse" -C "$srcdir/$_srcname/SamTSE/"
  chmod -R o=rx "$srcdir/$_srcname/SamTFE/Mods/XPLUS"
  chmod -R o=rx "$srcdir/$_srcname/SamTSE/Mods/XPLUS"
  chmod -R g=rx "$srcdir/$_srcname/SamTFE/Mods/XPLUS"
  chmod -R g=rx "$srcdir/$_srcname/SamTSE/Mods/XPLUS"

  # Making building TFE scripts.
  cd "$srcdir/$_srcname/SamTFE/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DXPLUS=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tfe.sh
  # sed -i 's/Threaded version" FALSE/Threaded version" TRUE/g' CMakeLists.txt
  chmod 755 build-linux"$_bits"-tfe.sh

  # Making building TSE scripts.
  cd "$srcdir/$_srcname/SamTSE/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DCMAKE_BUILD_TYPE=Release -DXPLUS=TRUE/g' build-linux"$_bits".sh
  # sed -i 's/Threaded version" FALSE/Threaded version" TRUE/g' CMakeLists.txt
  chmod 755 build-linux"$_bits".sh

  cd "$srcdir/$_srcname"
  # apply patch
  patch -p1 < 0001-remove_SE1_10b_depend.patch || return 1
  patch -p1 < 0003-Fix-load-some-incorrect-custom-maps.patch || return 1
}

build(){

  # Building Serious Sam Classic The First Encounter XPLUS Modification.
  cd "$srcdir/$_srcname/SamTFE/Sources/"
  ./build-linux"$_bits"-tfe.sh

  # Building Serious Sam Classic The Second Encounter XPLUS Modification.
  cd "$srcdir/$_srcname/SamTSE/Sources/"
  ./build-linux"$_bits".sh

  # Removed Serious Sam Classic tmp stuff.
  cd "$srcdir/$_srcname/SamTFE/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  cd "$srcdir/$_srcname/SamTSE/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old,*.patch}
  rm -fr "$srcdir/$_srcname/Images"
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/share/{licenses}
  install -d $pkgdir/usr/share/{serioussam,serioussam/Mods}
  install -d $pkgdir/usr/share/{serioussamse,serioussamse/Mods}
  install -d $pkgdir/usr/lib/{serioussam,serioussam/Mods,serioussam/Mods/XPLUS}
  install -d $pkgdir/usr/lib/{serioussamse,serioussamse/Mods,serioussamse/Mods/XPLUS}

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -D -m0755 $srcdir/$_srcname/SamTFE/Mods/XPLUS/Bin/libGame.so $pkgdir/usr/lib/serioussam/Mods/XPLUS
  install -D -m0755 $srcdir/$_srcname/SamTFE/Mods/XPLUS/Bin/libEntities.so $pkgdir/usr/lib/serioussam/Mods/XPLUS
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/XPLUS/Bin/libGameMP.so $pkgdir/usr/lib/serioussamse/Mods/XPLUS
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/XPLUS/Bin/libEntitiesMP.so $pkgdir/usr/lib/serioussamse/Mods/XPLUS

  rm -fr "$srcdir/$_srcname/SamTFE/Bin"
  rm -fr "$srcdir/$_srcname/SamTSE/Bin"
  rm -fr "$srcdir/$_srcname/SamTFE/Mods/XPLUS/Bin"
  rm -fr "$srcdir/$_srcname/SamTSE/Mods/XPLUS/Bin"

  # Install data.
  mv "$srcdir/$_srcname/SamTFE/Mods/XPLUS"  $pkgdir/usr/share/serioussam/Mods
  mv "$srcdir/$_srcname/SamTSE/Mods/XPLUS"  $pkgdir/usr/share/serioussamse/Mods

}
