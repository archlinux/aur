# Maintainer:  Alexander <t.x00100x.t@yandex.ru>
# Contributer: Alexander <t.x00100x.t@yandex.ru>

pkgname=serioussam-sequel
pkginstdir=serioussamse
sequiel=SamTSE-Sequel.tar.xz
pkgver=1.1.0
_srcname="SE1-TSE-Sequel-$pkgver-beta"
pkgrel=1
pkgdesc="Serious Sam Classic Sequel native Linux."
arch=('i686' 'x86_64')
url="https://github.com/tx00100xt/SE1-TSE-Sequel"
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
source=("https://github.com/tx00100xt/SE1-TSE-Sequel/archive/refs/tags/v$pkgver-beta.tar.gz"
	"https://github.com/tx00100xt/SE1-ParametricParticles/archive/refs/tags/v1.2.1.tar.gz"
	"https://archive.org/download/sam-tse-sequel/SamTSE-Sequel.tar.xz")
noextract=("SamTSE-Sequel.tar.xz")
sha256sums=('0777dee5e06a1e5f168f1d2cabb685b306ce3b90d1b176bb108d5b559d9f07b7'
	'aee90078dedb8d1ad1a74f79fb841f2503249917ee3037e746fd033ba178cc73'
	'084285f53454d2331a5527c3485169ba3c6c4bd6f9d50d8eaf94e13a21afee26')

if [[ $CARCH = "i686" ]]; then
  _bits="32"
else
  _bits="64"
fi

prepare(){
  # Install the Sequel Modification data.
  mkdir "$srcdir/$_srcname"/{SamTSE,SamTSE/Mods,SamTSE/Mods/TheSequel} || return 0
  tar -xJvf "$srcdir/$sequiel" -C "$srcdir/$_srcname/SamTSE/"

  chmod -R o=rx "$srcdir/$_srcname/SamTSE/Mods/TheSequel"
  chmod -R g=rx "$srcdir/$_srcname/SamTSE/Mods/TheSequel"

  # Making building scripts.
  cd "$srcdir/$_srcname/Sources/"
  sed -i 's/cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo/cmake -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh
  sed 's/cmake -DCMAKE_BUILD_TYPE=Release/cmake -DTFE=FALSE -DCMAKE_BUILD_TYPE=Release/g' build-linux"$_bits".sh > build-linux"$_bits"-tse.sh

  chmod 755 build-linux"$_bits"-tse.sh
}

build(){
  # Building Serious Sam TheSequel.
  cd "$srcdir/SE1-ParametricParticles-1.2.1/Sources/"
  mkdir build && cd build
  cmake ..
  make -j4

  # Building Serious Sam TheSequel.
  cd "$srcdir/$_srcname/Sources/"
  ./build-linux"$_bits"-tse.sh

  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libGameMP.so" "$srcdir/$_srcname/SamTSE/Mods/TheSequel/Bin" || return 1
  mv "$srcdir/SE1-ParametricParticles-1.2.1/Sources/build/Debug/libParametricParticlesMP.so"  "$srcdir/$_srcname/SamTSE/Mods/TheSequel/Bin" || return 1
  mv "$srcdir/$_srcname/Sources/cmake-build/Debug/libEntitiesMP.so"  "$srcdir/$_srcname/SamTSE/Mods/TheSequel/Bin" || return 1

  # Removing Serious Sam TheSequel tmp stuff.
  cd "$srcdir/$_srcname/"
  rm -fr "Sources"
  rm -fr "Tools.Win32"

  rm -f  "$srcdir/$_srcname"/{*.sh,*.old,*.md}
  rm -fr "$srcdir/$_srcname"/{Images,x32,x64}
}

package(){
  # Making sure directories exist.
  install -d $pkgdir/usr/lib/{serioussamse,serioussamse/Mods,serioussamse/Mods/TheSequel}
  install -d $pkgdir/usr/share/{serioussamse,serioussamse/Mods}

  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/TheSequel/Bin/libGameMP.so $pkgdir/usr/lib/serioussamse/Mods/TheSequel
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/TheSequel/Bin/libEntitiesMP.so  $pkgdir/usr/lib/serioussamse/Mods/TheSequel
  install -D -m0755 $srcdir/$_srcname/SamTSE/Mods/TheSequel/Bin/libParametricParticlesMP.so  $pkgdir/usr/lib/serioussamse/Mods/TheSequel

  rm -fr "$srcdir/$_srcname/SamTSE/Mods/TheSequel/Bin"

  # Making sure directories exist.
  install -d $pkgdir/usr/share/licenses

  # Install license.
  install -D -m 644 $srcdir/$_srcname/LICENSE \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE
  rm -f  "$srcdir/$_srcname/LICENSE" || return 1

  # Install data.
  mv "$srcdir/$_srcname/SamTSE/Mods" "$pkgdir/usr/share/$pkginstdir/"
}
