# Contributor: fordprefect <fordprefect@dukun.de>

pkgname=netcat-cpi-git
pkgver=20140424
pkgrel=4
pkgdesc="netcats 'cycles per instruction' album as a kernel module"
arch=('i686' 'x86_64')
url="http://netcat.co"
license=('unknown')
makedepends=('git' 'linux-headers')
optdepends=('vorbis-tools: contains a convenient player (ogg123)')
install="cpi.install"
source=("git+https://github.com/usrbinnc/netcat-cpi-kernel-module.git"
        "cpi.install")
md5sums=("SKIP"
        "967d79015184d7d58963870ff6b8b1a1")

build() {
    cd "$srcdir/netcat-cpi-kernel-module"
    make
} 

# credit: function taken from bbswitch-git aur package
package() {
  _PACKAGES=`pacman -Qsq linux`
  _KERNELS=`pacman -Ql $_packages | grep /modules.alias.bin | sed 's/.*\/lib\/modules\/\(.*\)\/modules.alias.bin/\1/g'`

   # Find all extramodules directories
  _EXTRAMODULES=`find /usr/lib/modules -name version | sed 's|\/usr\/lib\/modules\/||; s|\/version||'`

  # Loop through all detected kernels
  for _kernver in $_KERNELS; do

    # Loop through all detected extramodules directories
    for _moduledirs in $_EXTRAMODULES; do
      # Check which extramodules directory corresponds with the built module
      if [ `cat "/usr/lib/modules/${_moduledirs}/version"` = $_kernver ]; then
        mkdir -p "${pkgdir}/usr/lib/modules/${_moduledirs}/"
        install -m644 "$srcdir/netcat-cpi-kernel-module/netcat.ko" "${pkgdir}/usr/lib/modules/${_moduledirs}/"
        gzip "${pkgdir}/usr/lib/modules/${_moduledirs}/netcat.ko"
      fi
    done
  done
}
