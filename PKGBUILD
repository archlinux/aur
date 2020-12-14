# Maintainer: Manuel Reimer <manuel.reimer@gmx.de>

pkgname=arduino-esp8266-core-git
pkgver=20201205
pkgrel=1
pkgdesc="Arduino ESP8266 core based on esp-quick-toolchain"
arch=('x86_64')
url="https://github.com/earlephilhower/esp-quick-toolchain"
license=('GPL2', 'LGPL2') # and probably others...
depends=('python' 'source-highlight' 'flex' 'libmpc')
makedepends=('git')
options=(!strip !emptydirs !buildflags staticlibs)
conflicts=('arduino-esp8266-core')
provides=('arduino-esp8266-core')
source=("git+https://github.com/earlephilhower/esp-quick-toolchain.git")
md5sums=('SKIP')

pkgver() {
  # Multiple GIT repositories are involved --> no specific pkgver
  date +%Y%m%d
}

prepare() {
  cd "$srcdir/esp-quick-toolchain"

  # Prepare a custom "bin" directory for esp-quick-toolchain which expects
  # a build toolchain with "architecture prefixes" even when not crossbuilding
  mkdir -p "bin"
  ln -sf "/usr/bin/g++" "bin/x86_64-linux-gnu-g++"
  ln -sf "/usr/bin/gcc" "bin/x86_64-linux-gnu-gcc"
  ln -sf "/usr/bin/strip" "bin/x86_64-linux-gnu-strip"

  # Request esp-quick-toolchain to do its downloads
  make GCC=10.2 GHUSER=earlephilhower GHTOKEN=none download
}

build() {
  cd "$srcdir/esp-quick-toolchain"

  # Include our custom "bin" directory into the PATH variable
  export PATH=$PATH:$PWD/bin

  # Cleanup prior building to prevent duplicates on rebuild
  rm -f *.tar.gz *.tar.gz.json

  # Compile toolchain. Clear "LINUX_BFLGS" to allow dynamic linking
  make GCC=10.2 GHUSER=earlephilhower GHTOKEN=none LINUX_BFLGS=" "

  # "make install" does actually compile additional parts of the toolchain
  make GCC=10.2 GHUSER=earlephilhower GHTOKEN=none LINUX_BFLGS=" " install

  # Insert a custom name to distinguish from official builds
  sed -ri "s/^(name=).*/\1Arch Linux ESP8266 Boards/" arduino/platform.txt
}

package() {
  cd "$srcdir/esp-quick-toolchain"

  # Prepare target directory for our system-global Arduino core
  _targetdir="$pkgdir/usr/share/arduino/hardware/archlinux-esp8266/esp8266"
  mkdir -p "$_targetdir"

  # Start off with the Arduino stuff already prepared by "make install"
  cp -r arduino/* "$_targetdir"

  # Some cleanup
  find "$_targetdir" -name '*.o' -delete
  find "$_targetdir" -type d -name '.git*' -prune -exec rm -r '{}' \;

  # Extract missing tools into the "tools" directory
  _tools="$_targetdir/tools"
  tar --no-same-owner -xf "x86_64-linux-gnu.esptool-"*".tar.gz" -C "$_tools"
  tar --no-same-owner -xf "x86_64-linux-gnu.mklittlefs-"*".tar.gz" -C "$_tools"
  tar --no-same-owner -xf "x86_64-linux-gnu.mkspiffs-"*".tar.gz" -C "$_tools"

  # The toolchain expects a "python3/python3" in the tools directory
  mkdir "$_tools/python3"
  ln -s "/usr/bin/python3" "$_tools/python3/"
}
