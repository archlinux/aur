# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=serioussam-hno
pkginstdir=serioussamse
hno=HeroNumberOne.tar.xz
hno_eng=HNO-Data-messages-eng.tar.xz
pkgver=1.0.1
_srcname="SE1-TSE-HNO-$pkgver"
pkgrel=4
pkgdesc="Serious Sam Classic HNO native Linux."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SE1-TSE-HNO"
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
source=("https://github.com/tx00100xt/SE1-TSE-HNO/archive/refs/tags/v$pkgver.tar.gz"
	"https://archive.org/download/hero-number-one/HeroNumberOne.tar.xz"
	"https://archive.org/download/hno-data-messages-eng/HNO-Data-messages-eng.tar.xz")
noextract=("HeroNumberOne.tar.xz")
sha256sums=('793925ac19e54b25fd56c8739730c1099c54de458d5fc74db18a079c7acb3963'
	'cb75f7f79e9f1f3ae1285ed036f3f3e9d3c1323cb448ed87f316e59390f748f9'
	'316f68a61cdba7d1dc71b3847dcd1d789f93077275fd2d0911b832dda72b101c')

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){


  # Install the HNO Modification data.
  mkdir "$srcdir/$_srcname"/{SamTSE,SamTSE/Mods,SamTSE/Mods/HNO} || return 0
  tar -xJvf "$srcdir/$hno" -C "$srcdir/$_srcname/SamTSE/"
  tar -xJvf "$srcdir/$hno_eng" -C "$srcdir/$_srcname/SamTSE/"

  chmod -R o=rx "$srcdir/$_srcname/SamTSE/Mods/HNO"
  chmod -R g=rx "$srcdir/$_srcname/SamTSE/Mods/HNO"

  # Making building scripts.
  cd "$srcdir/$_srcname/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=FALSE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tse.sh

  chmod 755 build-linux"$_bits"-tse.sh
}

build(){
  # Building Serious Sam HNO.
  cd "$srcdir/$_srcname/Sources/"
  ./build-linux"$_bits"-tse.sh

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGameMP.so" "$srcdir/$_srcname/SamTSE/Mods/HNO/Bin" || return 1
  cp -f "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntitiesMP.so"  "$srcdir/$_srcname/SamTSE/Mods/HNO/Bin/libEntitiesExtMP.so" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntitiesMP.so"  "$srcdir/$_srcname/SamTSE/Mods/HNO/Bin" || return 1

  # Removing Serious Sam Odd World tmp stuff.
  cd "$srcdir/$_srcname/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old,*.md}
  rm -fr "$srcdir/$_srcname"/{Images,x32,x64}
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/lib/{serioussamse,serioussamse/Mods,serioussamse/Mods/HNO}
  install -d $pkgdir/usr/share/{serioussamse,serioussamse/Mods}

  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/HNO/Bin/libGameMP.so $pkgdir/usr/lib/serioussamse/Mods/HNO
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/HNO/Bin/libEntitiesMP.so  $pkgdir/usr/lib/serioussamse/Mods/HNO
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/HNO/Bin/libEntitiesExtMP.so  $pkgdir/usr/lib/serioussamse/Mods/HNO

  rm -fr "$srcdir/$_srcname/SamTSE/Mods/HNO/Bin"

  # Making sure directories exist.
  install -d $pkgdir/usr/share/licenses

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -f  "$srcdir/$_srcname/LICENSE" || return 1

  # Install data.
  mv "$srcdir/$_srcname/SamTSE/Mods" "$pkgdir/usr/share/$pkginstdir/"
}
