# Maintainer: Kris McCleary <kris27mc@gmail.com>

pkgname=minecraft-linux
pkgver=20170726.r126.387248b
pkgrel=1
pkgdesc="Minecraft launcher for Linux"
arch=('x86_64')
url="https://kris27mc.github.io"
license=('BSD')
groups=()
depends=('lib32-zlib' 'lib32-ncurses' 'libglvnd' 'gts' 'lib32-libglvnd' 'lib32-libxext' 'lib32-libx11' 'lib32-libpng' 'lib32-util-linux' 'lib32-glibc')
makedepends=('wget' 'cmake' 'gcc-multilib')
optdepends=()
source=("git+https://github.com/kris27mc/minecraft-linux.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/minecraft-linux"

  printf "%s.r%s.%s" \
   "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" \
   "$(git rev-list --count HEAD)" \
   "$(git rev-parse --short HEAD)"
         }

build() {
  cd "$srcdir/minecraft-linux"
  #Determines necessary libs
  if grep -qi "amd" /proc/cpuinfo;  then
    /usr/bin/cp -r libs/AMD/* libs
    printf "Using compatibility libs"
    sleep 2
  fi

  #Compiles minecraftlauncher
  cmake .
  make
        }

check() {
  #Checks for complete build
  cd "$srcdir/minecraft-linux"
  if [ ! -e "minecraftlauncher" ]; then
    echo "Error: minecraftlauncher missing. Build failed"
    exit
  fi
        }

package(){
  cd "$srcdir/minecraft-linux"

  #Creates necessary directories
  install -dm755 "$pkgdir/usr/share/applications/"
  install -dm755 "$pkgdir/usr/share/minecraft-linux"
  install -dm755 "$pkgdir/usr/share/licenses/minecraft-linux"
  install -dm755 "$pkgdir/usr/share/minecraft-linux/assets"

  #Moves files to directory
  install -Dm755 "minecraftlauncher" "$pkgdir/usr/share/minecraft-linux"
  install -Dm755 "minecraftlauncher.desktop" "$pkgdir/usr/share/applications"
  install -Dm755 "minecraftlauncher.png" "$pkgdir/usr/share/minecraft-linux"
  install -Dm755 "LICENSE" "$pkgdir/usr/share/licenses/minecraft-linux"
  cp -r "libs" "$pkgdir/usr/share/minecraft-linux"
  chmod -R 755 "$pkgdir/usr/share/minecraft-linux/libs"
  install -Dm755 "extract.sh" "$pkgdir/usr/share/minecraft-linux"

  #Extracts apk
  cd "$srcdir/"
  wget "https://kris27mc.github.io/files/minecraft.apk"
  install -Dm755 "minecraft.apk" "$pkgdir/usr/share/minecraft-linux"
  cd "$pkgdir/usr/share/minecraft-linux"
  ./extract.sh minecraft.apk
          }
