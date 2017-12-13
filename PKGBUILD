# Maintainer: flurb
# Previously pyamsoft <pyam(dot)soft(at)gmail(dot)com>

# This build can be installed alongside dolphin-emu
# Run using dolphin-emu-faster-melee
# Make sure to set CPUS_DESIRED for faster compilation

# Uses a modified version of https://github.com/FasterMelee/FasterMelee-installer (thank you!)

pkgname=dolphin-emu-faster-melee
pkgver=5.8.7
pkgrel=1
pkgdesc='The FasterMelee NetPlay build of the Dolphin Emulator'
arch=('x86_64')
url='http://fastermelee.net'
license=('GPL')
makedepends=('cmake' 'wget')
depends=('bluez-libs' 'curl' 'enet' 'ffmpeg' 'glu' 'libao' 'libevdev' 'libsystemd' 'libusb' 'libxext' 'mbedtls' 'mesa' 'miniupnpc' 'openal' 'portaudio' 'soundtouch' 'xdg-utils' 'wxgtk3')
optdepends=('pulseaudio: PulseAudio backend')
options=('!emptydirs')

COMMITHASH="6ababb9222fb8bb9723ae137e1263a27196fcd47"

source=("https://github.com/FasterMelee/Ishiiruka/archive/$COMMITHASH.tar.gz"
        "https://github.com/FasterMelee/FasterMelee-installer/raw/master/config/$pkgver-fmconfig.tar.gz")

sha256sums=('02a645a4cc91d0e5c3ff64e2c849c31fe439d9a8ca30e9b072d8899066ac4b66'
            'b2ba6b74bbc6df5ffb86fb696cb3d1198c6a9b18862b3e2ace9ad1dd211032c3')

CPUS_DESIRED=3

prepare() {
  cd "$srcdir"
  
  echo "Extracting..."
  tar -xzf "$pkgver-fmconfig.tar.gz" && rm "$pkgver-fmconfig.tar.gz"	
  echo "Extracting..."
  tar -xzf "$COMMITHASH.tar.gz" && rm "$COMMITHASH.tar.gz"
  mv "Ishiiruka-$COMMITHASH" Ishiiruka
  cd Ishiiruka

  # --- Temporary patch for updated glibc
  echo "Patching xlocale.h requirement..."
  sed -i "s|#define wxUSE_XLOCALE 1|#define wxUSE_XLOCALE 0|g" Externals/wxWidgets3/wx/wxcocoa.h
  sed -i "s|#define wxUSE_XLOCALE 1|#define wxUSE_XLOCALE 0|g" Externals/wxWidgets3/wx/wxgtk.h
  # ---

  # --- Patch tarball to display correct hash to other netplay clients
  echo "Patching tarball..."
  sed -i "s|\${GIT_EXECUTABLE} rev-parse HEAD|echo $COMMITHASH|g" CMakeLists.txt
  # --set scm_rev_str everywhere to actual commit hash when downloaded
  sed -i "s|\${GIT_EXECUTABLE} describe --always --long --dirty|echo FM v$pkgver BETA|g" CMakeLists.txt
  # ensures compatibility w/ netplay
  sed -i "s|\${GIT_EXECUTABLE} rev-parse --abbrev-ref HEAD|echo HEAD|g" CMakeLists.txt
  # ---
  
  # --- move necessary config files into the build folder
  echo "Adding FM config files..."
  mkdir build && cd build
  mv ../../Binaries .
  mv ../Data/dolphin-emu.png Binaries/
  # ---
}

build() {
 
  cd "$srcdir"
  
  if [ ! -d "$srcdir/bin" ]; then # ...then we need to compile !
    # --- Attempts to determine the number of cores in the CPU. ---
    # Source: https://gist.github.com/jj1bdx/5746298
    # Linux and similar...
    CPUS=$(getconf _NPROCESSORS_ONLN 2>/dev/null)
    # FreeBSD and similar...
    [ -z "$CPUS" ] && CPUS=$(getconf NPROCESSORS_ONLN)
    # Solaris and similar...
    [ -z "$CPUS" ] && CPUS=$(ksh93 -c 'getconf NPROCESSORS_ONLN')
    # Give up...
    [ -z "$CPUS" ] && CPUS=1

    # --- for -j flag (# of cores utilized)

    echo ""
    echo "CPU Threads detected: $CPUS"
    if [ "$CPUS_DESIRED" -ge 1 ] 2> /dev/null && [ "$CPUS_DESIRED" -le $((CPUS + 1)) ] 2> /dev/null; then
	    CPUS=$CPUS_DESIRED 
    else
	    CPUS=1
    fi
    echo "Using $CPUS thread(s)!"
    
    # --- cmake and compile
    cd Ishiiruka/build
    echo "cmaking..."
    cmake .. -DLINUX_LOCAL_DEV=true \
             -DDISTRIBUTOR='aur.archlinux.org'
    echo "Compiling..."
    make -j $CPUS

    echo "Cleaning up..."
    cd ../..
    mv Ishiiruka/build/Binaries bin/
    rm -rf Ishiiruka
  fi
}

package() {
  cd "$srcdir"


	echo 'SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="0337", MODE="0666"' > 51-gcadapter.rules
  install -Dm 644 "${srcdir}"/51-gcadapter.rules -t "${pkgdir}"/usr/lib/dev/rules.d/

  install -d "${pkgdir}"/usr/share/
  cp -r "${srcdir}"/bin "${pkgdir}"/usr/share/dolphin-emu-faster-melee/
  
  echo "#!/bin/sh
/usr/share/dolphin-emu-faster-melee/dolphin-emu \"\$@\"" > dolphin-emu-faster-melee
  install -Dm 755 "${srcdir}"/dolphin-emu-faster-melee -t "${pkgdir}"/usr/bin/

}

# vim: ts=2 sw=2 et:
