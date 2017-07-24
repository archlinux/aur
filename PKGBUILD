# Maintainer: Kris McCleary <kris27mc@gmail.com>

pkgname=mcpelauncher-linux
pkgver=20170724.r102.ca7b9c7
pkgrel=1
pkgdesc="Minecraft PE launcher for Linux"
arch=('x86_64')
url="https://kris27mc.github.io"
license=('BSD')
groups=()
depends=('lib32-zlib' 'lib32-ncurses' 'gts' 'libglvnd' 'lib32-libglvnd' 'lib32-libxext' 'lib32-libx11' 'lib32-libpng' 'lib32-util-linux' 'lib32-glibc')
makedepends=('wget' 'cmake' 'gcc-multilib')
optdepends=()
source=("git+https://github.com/kris27mc/mcpelauncher-linux.git")

pkgver() {
cd mcpelauncher-linux

printf "%s.r%s.%s" \
 "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" \
 "$(git rev-list --count HEAD)" \
 "$(git rev-parse --short HEAD)"
         }

build() {
  cd mcpelauncher-linux
  if grep -qi "amd" /proc/cpuinfo;  then
  /usr/bin/cp -r libs/AMD/* libs/
  printf "Using compatibility libs"
  sleep 3
fi

#Compiles mcpelauncher
cmake .
make

#Checks for complete build
if [ ! -e "mcpelauncher" ]; then
  echo "Error: mcpelauncher missing. Build failed"
  exit
fi
        }

package(){
  cd mcpelauncher-linux
  #Moves compiled files to new dir
  if [ ! -e "/usr/share/mcpelauncher" ]; then
  sudo mkdir /usr/share/mcpelauncher
fi
  sudo cp -t /usr/share/mcpelauncher mcpelauncher extract.sh LICENSE mcpelauncher.desktop MCPEicon.png
  sudo cp -r libs /usr/share/mcpelauncher/libs
  cd /usr/share/mcpelauncher

  #Acquires apk
  printf "\nWhich method would you like to use to acquire an APK?\n"
  printf "1) Google-Play-API (currently broken)\n"
  printf "2) Hosted download (ONLY USE IF YOU OWN MCPE!)\n"
  printf "3) Local file\n"
  printf "\nEnter your selection: "
  read answer
  echo "$answer"
  #Google-Play-API
  if [[ "$answer" == "1" ]]; then
    git clone https://github.com/MCMrARM/Google-Play-API.git
    cd Google-Play-API
    cmake .
    make
    ./gplaydl -tos -a com.mojang.minecraftpe
    sudo cp *.apk /usr/share/mcpelauncher
    cd /usr/share/mcpelauncher
    sudo rm -R Google-Play-API
  fi

  #Hosted apk
  if [[ "$answer" == "2" ]]; then
    sudo wget https://kris27mc.github.io/files/mcpe.apk
  fi

  #Local file
  if [[ "$answer" == "3" ]]; then
    printf "Please enter the full path to your apk.\n"
    printf "Path to APK: "
    read -e pathtoapk
    if grep "mcpe.apk" <<< echo "$pathtoapk"; then
      sudo cp "$pathtoapk" /usr/share/mcpelauncher/mcpe-new.apk
    else
      sudo cp "$pathtoapk" /usr/share/mcpelauncher
    fi
  fi

  #Extracts apk into assets
  if [[ "$answer" == "1" || "$input" == "3" ]]; then
    if [ -f "mcpe.apk" ]; then
      sudo mkdir oldapks
      sudo mv mcpe.apk oldapks
      sudo mv *.apk mcpe.apk
    fi
  fi

  sudo ./extract.sh mcpe.apk
  sudo chmod -R 777 /usr/share/mcpelauncher

  #Creates desktop launcher
  sudo cp mcpelauncher.desktop /usr/share/applications
  if [[ ! -e "/usr/bin/mcpelauncher" ]]; then
  sudo ln -s /usr/share/mcpelauncher/mcpelauncher /usr/bin/mcpelauncher
  fi

  #printf "\nWould you like to create a shortcut on your desktop? (y/n)\n"
  #read input
  #if [[ $input == "Y" || "$input" == "y" ]]; then
  #  printf "Creating a shortcut..."
  #  cp mcpelauncher.desktop ~/Desktop
  #else
  #  printf "No desktop shortcut created."
  #fi
}
md5sums=('SKIP')
