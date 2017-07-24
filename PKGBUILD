# Maintainer: Kris McCleary <kris27mc@gmail.com>

pkgname=minecraft-linux
pkgver=20170724.r116.7eb21ad
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
cd minecraft-linux

printf "%s.r%s.%s" \
 "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" \
 "$(git rev-list --count HEAD)" \
 "$(git rev-parse --short HEAD)"
         }

build() {
cd minecraft-linux

rm install.sh
#Determines necessary libs
if grep -qi "amd" /proc/cpuinfo;  then
  cp -r libs/AMD/* libs/
  printf "Using compatibility libs"
  sleep 3
fi

#Compiles minecraftlauncher
cmake .
make

#Moves compiled files to new dir
if [ ! -e "meme" ]; then
  sudo mkdir "meme"
fi
sudo cp -t meme "minecraftlauncher" "extract.sh" "LICENSE" "minecraftlauncher.desktop" "minecraftlauncher.png"
sudo cp -r libs "meme/libs"
cd meme

#Acquires apk
printf "\nWhich method would you like to use to acquire an APK?\n"
printf "1) Google-Play-API (currently broken)\n"
printf "2) Hosted download (ONLY USE IF YOU OWN MINECRAFT!)\n"
printf "3) Local file\n"
printf "\nEnter your selection: "
read answer
#Google-Play-API
if [[ "$answer" == "1" ]]; then
  git clone https://github.com/MCMrARM/Google-Play-API.git
  cd Google-Play-API
  cmake .
  make
  ./gplaydl -tos -a com.mojang.minecraftpe
  sudo cp *.apk /meme
  cd ..
  sudo rm -R Google-Play-API
fi

#Hosted apk
if [[ "$answer" == "2" ]]; then
  sudo wget https://kris27mc.github.io/files/minecraft.apk
fi

#Local file
if [[ "$answer" == "3" ]]; then
  printf "Please enter the full path to your apk.\n"
  printf "Path to APK: "
  read -e pathtoapk
  if grep "minecraft.apk" <<< echo "$pathtoapk"; then
    sudo cp "$pathtoapk" meme/minecraft-new.apk
  else
    sudo cp "$pathtoapk" meme
  fi
fi

#Extracts apk into assets
if [[ "$answer" == "1" || "$answer" == "3" ]]; then
    if [ ! -e "oldapks"]; then
      sudo mkdir oldapks
    fi
    if [ -f "minecraft.apk" ]; then
      sudo mv minecraft.apk oldapks
    fi
    sudo mv *.apk minecraft.apk
fi

sudo ./extract.sh minecraft.apk
sudo chmod -R 777 meme
        }

check() {
#Checks for complete build
cd minecraft-linux
if [ ! -e "minecraftlauncher" ]; then
  echo "Error: minecraftlauncher missing. Build failed"
  exit
fi
        }

package(){
cd minecraft-linux
install meme -d "$pkgdir/usr/share/minecraftlauncher"
cd meme
install -Dm644 "minecraftlauncher.desktop" "$pkgdir/usr/share/applications/minecraftlauncher.desktop"
install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
