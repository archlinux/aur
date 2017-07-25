# Maintainer: Kris McCleary <kris27mc@gmail.com>

pkgname=minecraft-linux
pkgver=20170724.r117.7c940ea
pkgrel=1
pkgdesc="Minecraft launcher for Linux"
arch=('x86_64')
url="https://kris27mc.github.io"
license=('BSD')
groups=()
depends=('lib32-zlib' 'lib32-ncurses' 'gts' 'libglvnd' 'lib32-libglvnd' 'lib32-libxext' 'lib32-libx11' 'lib32-libpng' 'lib32-util-linux' 'lib32-glibc')
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
    cp -r libs/AMD/* libs
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
  install -dm755 "$pkgdir/usr/share/minecraftlauncher"
  install -dm755 "$pkgdir/usr/share/licenses/minecraftlauncher"

  #Moves files to directory
  install -Dm755 "minecraftlauncher" "$pkgdir/usr/share/minecraftlauncher"
  install -Dm644 "minecraftlauncher.desktop" "$pkgdir/usr/share/minecraftlauncher"
  install -Dm644 "minecraftlauncher.png" "$pkgdir/usr/share/minecraftlauncher"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/minecraftlauncher"
  install -dm755 "libs" "$pkgdir/usr/share/minecraftlauncher"

  #Extracts apk
  cd "$srcdir/"
  wget "https://kris27mc.github.io/files/minecraft.apk"
  #mkdir "$srcdir/assets"
  unzip "minecraft.apk" -d "$srcdir/assets"
  install -dm755 "$srcdir/assets" "$pkgdir/usr/share/minecraftlauncher"
  install -Dm644 "$srcdir/assets/lib/x86/libminecraftpe.so" "$pkgdir/usr/share/minecraftlauncher/libs/libminecraft.so"

          }
