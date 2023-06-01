# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>>

pkgname=serioussam-vk
pkginstdir=serioussam
xplus_tfe=SamTFE-XPLUS.tar.xz
xplus_tse=SamTSE-XPLUS.tar.xz
pkgver=1.10.4
_srcname="SeriousSamClassic-VK-$pkgver"
pkgrel=7
pkgdesc="Serious Sam Classic native Linux version with Vulkan support and XPLUS Modification."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SeriousSamClassic-VK"
license=('GPL2')
depends=('sdl2' 'python' 'bash' 'vulkan-icd-loader' 'vulkan-validation-layers')
makedepends=('cmake' 'make' 'sed' 'vulkan-headers')
conflicts=('serioussam')
install=serioussam.install
source=("https://github.com/tx00100xt/SeriousSamClassic-VK/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partaa"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partab"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTFE-XPLUS/SamTFE-XPLUS.tar.xz.partac"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partaa"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partab"
	"https://github.com/tx00100xt/serioussam-mods/raw/main/SamTSE-XPLUS/SamTSE-XPLUS.tar.xz.partac"
    "serioussam-tfe.desktop"
    "serioussam-tse.desktop"
    "serioussam.xpm"
    "tfe-vk-last-update.patch"
    "tse-vk-last-update.patch"
    "fix-thunder.patch"
    "fix_sdl2_vk_fullscreen_on_gnome44.patch")
noextract=("SamTFE-XPLUS.tar.xz.partaa"
	"SamTFE-XPLUS.tar.xz.partab"
	"SamTFE-XPLUS.tar.xz.partac"
	"SamTSE-XPLUS.tar.xz.partaa"
	"SamTSE-XPLUS.tar.xz.partab"
	"SamTSE-XPLUS.tar.xz.partac")
sha256sums=('951fea8274cf795c1bdcff708e1dffbef78cd7993585144b565aefba93433e08'
            '01b2e2d4dbdb65b2f1e174fbd6606d70806e97b6a45047ed6c58e7b801f6a879'
            'f8f35bcc54ed888b72b8660319ad089b7243b9e8d83aefabdb8f0111fcb0b728'
            '3da6b8588115cf31cb67e15f527dc8b6a83da16fe35ac8c7b78ed9522e0211a4'
            '28a90da56de5d6591a2e65154778030ba28b375d29556fd7e1db085d2c00b877'
            '93fe183a2f0a35989b3d1678dddb1c5976cda94747d4186c6f36af4ccf144443'
            '8282f527b54e9d8fe009640b7634560f3b4bf0fc9b72cdc2f865f1c226339d35'
            '1e36d7b0d11f68729aa5c79ac9a44157d4af0bf61060040ab92a37d96ca89aba'
            '49680c65d26b264a1d7735c6310fcc5d0ac0e0e56273d3bccf539c0c87d31b2b'
            '1fd56e04072372e1e8dab0bae40da1519d82a28895cbe5661b18561ee9ea47b4'
            '08cb78b2c5a487e8d644971729dd391851ec476b3e92d683d9d4f256b229dbac'
            'a82821d12ebadb5ecade4b0169ff9497b6d00d6b0a9c4a0112a5915be1057542'
            'ad07c6b9d29a0d8a1a276b0c00d07e2d24d8c63c425efa21daa31ec3c1d366df'
            '7962e50f6c1781a3240647b77e72f588c6be772261be0d3753039dd3acc18c7d')
if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Prepare patch
  cat tfe-vk-last-update.patch > "$srcdir/$_srcname/tfe-vk-last-update.patch"
  cat tse-vk-last-update.patch > "$srcdir/$_srcname/tse-vk-last-update.patch"
  cat fix-thunder.patch > "$srcdir/$_srcname/fix-thunder.patch"
  cat fix_sdl2_vk_fullscreen_on_gnome44.patch > "$srcdir/$_srcname/fix_sdl2_vk_fullscreen_on_gnome44.patch"

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
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tfe.sh
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits"xplus.sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=TRUE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits"xplus.sh > build-linux"$_bits"xplus-tfe.sh
  # sed -i 's/Threaded version" FALSE/Threaded version" TRUE/g' CMakeLists.txt
  chmod 755 build-linux"$_bits"-tfe.sh
  chmod 755 build-linux"$_bits"xplus-tfe.sh

  # Making building TSE scripts.
  cd "$srcdir/$_srcname/SamTSE/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits"xplus.sh
  # sed -i 's/Threaded version" FALSE/Threaded version" TRUE/g' CMakeLists.txt
  chmod 755 build-linux"$_bits".sh
  chmod 755 build-linux"$_bits"xplus.sh

  # gcc 11.3 patch && hud score patch
  cd "$srcdir/$_srcname"
  patch -p1 < tfe-vk-last-update.patch || return 1
  patch -p1 < tse-vk-last-update.patch || return 1
  patch -p1 < fix-thunder.patch || return 1
  # gnone44 sdl2 patch
  patch -p1 < fix_sdl2_vk_fullscreen_on_gnome44.patch || return 1
}

build(){
  # Building Serious Sam Classic The First Encounter.
  cd "$srcdir/$_srcname/SamTFE/Sources/"
  ./build-linux"$_bits"-tfe.sh

  # Building Serious Sam Classic The First Encounter XPLUS Modification.
  cd "$srcdir/$_srcname/SamTFE/Sources/"
  ./build-linux"$_bits"xplus-tfe.sh

  # Building Serious Sam Classic The Second Encounter.
  cd "$srcdir/$_srcname/SamTSE/Sources/"
  ./build-linux"$_bits".sh

  # Building Serious Sam Classic The Second Encounter XPLUS Modification.
  cd "$srcdir/$_srcname/SamTSE/Sources/"
  ./build-linux"$_bits"xplus.sh

  # Removed Serious Sam Classic tmp stuff.
  cd "$srcdir/$_srcname/SamTFE/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  cd "$srcdir/$_srcname/SamTSE/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old,*.patch}
  rm -fr "$srcdir/$_srcname/Images"

  mv -f "$srcdir/$_srcname/SamTFE/Bin/SeriousSam" "$srcdir/$_srcname/SamTFE/Bin/serioussam"
  mv -f "$srcdir/$_srcname/SamTFE/Bin/DedicatedServer" "$srcdir/$_srcname/SamTFE/Bin/serioussam-ded"
  mv -f "$srcdir/$_srcname/SamTSE/Bin/SeriousSam" "$srcdir/$_srcname/SamTSE/Bin/serioussamse"
  mv -f "$srcdir/$_srcname/SamTSE/Bin/DedicatedServer" "$srcdir/$_srcname/SamTSE/Bin/serioussamse-ded"

  # fix scripts for AMD cards
  sed -i 's/mdl_bFineQuality = 0;/mdl_bFineQuality = 1;/g' "$srcdir/$_srcname/SamTFE/Scripts/GLSettings/RAM.ini"
  sed -i 's/mdl_bFineQuality = 0;/mdl_bFineQuality = 1;/g' "$srcdir/$_srcname/SamTFE/Scripts/GLSettings/ATI-RPRO.ini"
  sed -i 's/mdl_bFineQuality = 0;/mdl_bFineQuality = 1;/g' "$srcdir/$_srcname/SamTSE/Scripts/GLSettings/RAM.ini"
  sed -i 's/mdl_bFineQuality = 0;/mdl_bFineQuality = 1;/g' "$srcdir/$_srcname/SamTSE/Scripts/GLSettings/ATI-RPRO.ini"
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/share/{applications,pixmaps,licenses}
  install -d $pkgdir/usr/bin/
  install -d $pkgdir/usr/lib/{serioussam,serioussam/Mods,serioussam/Mods/XPLUS}
  install -d $pkgdir/usr/lib/{serioussamse,serioussamse/Mods,serioussamse/Mods/XPLUS}

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/serioussam $pkgdir/usr/bin
  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/serioussam-ded $pkgdir/usr/bin

  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/libEngine.so $pkgdir/usr/lib
  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/libGame.so $pkgdir/usr/lib/serioussam
  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/libEntities.so $pkgdir/usr/lib/serioussam
  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/libShaders.so $pkgdir/usr/lib/serioussam
  install -D -m0755 $srcdir/$_srcname/SamTFE/Bin/libamp11lib.so $pkgdir/usr/lib/serioussam

  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/serioussamse $pkgdir/usr/bin
  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/serioussamse-ded $pkgdir/usr/bin

  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/libEngineMP.so $pkgdir/usr/lib
  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/libGameMP.so $pkgdir/usr/lib/serioussamse
  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/libEntitiesMP.so $pkgdir/usr/lib/serioussamse
  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/libShaders.so $pkgdir/usr/lib/serioussamse
  install -D -m0755 $srcdir/$_srcname/SamTSE/Bin/libamp11lib.so $pkgdir/usr/lib/serioussamse

  install -D -m0755 $srcdir/$_srcname/SamTFE/Mods/XPLUS/Bin/libGame.so $pkgdir/usr/lib/serioussam/Mods/XPLUS
  install -D -m0755 $srcdir/$_srcname/SamTFE/Mods/XPLUS/Bin/libEntities.so $pkgdir/usr/lib/serioussam/Mods/XPLUS
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/XPLUS/Bin/libGameMP.so $pkgdir/usr/lib/serioussamse/Mods/XPLUS
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/XPLUS/Bin/libEntitiesMP.so $pkgdir/usr/lib/serioussamse/Mods/XPLUS

  rm -fr "$srcdir/$_srcname/SamTFE/Bin"
  rm -fr "$srcdir/$_srcname/SamTSE/Bin"
  rm -fr "$srcdir/$_srcname/SamTFE/Mods/XPLUS/Bin"
  rm -fr "$srcdir/$_srcname/SamTSE/Mods/XPLUS/Bin"

  # Install data.
  mv "$srcdir/$_srcname/SamTFE"  $pkgdir/usr/share/serioussam
  mv "$srcdir/$_srcname/SamTSE"  $pkgdir/usr/share/serioussamse

  # Install desktop file.
  install -D -m 644 $srcdir/serioussam-tfe.desktop \
           $pkgdir/usr/share/applications/serioussam-tfe.desktop
  install -D -m 644 $srcdir/serioussam-tse.desktop \
           $pkgdir/usr/share/applications/serioussam-tse.desktop

  # Install icon file.
  install -D -m 644 $srcdir/serioussam.xpm \
           $pkgdir/usr/share/pixmaps/serioussam.xpm

}
