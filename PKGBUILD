#
# Maintainer: Alexej Magura <sickhadas.code at gmail dot com>
# Contributor: Swen Simon <swsimon at gmail dot com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gmail.com>
#

pkgname=epsxe
_pkgname=ePSXe
pkgver=2.0.5
_plgnver=1.9.95
pkgrel=34
pkgdesc="Enhanced PSX emulator"
url="https://epsxe.com"
arch=('x86_64')
depends=(bash libcurl-compat gtk3 sdl_ttf ncurses openssl-1.0 libxt libcanberra libcurl-compat libxv libcdio libarchive)
makedepends=(unzip tar cmake mesa intltool nasm valgrind)
license=('unknown')
install=${pkgname}.install
options=(!strip)
source=(${pkgname}.desktop
        ${pkgname}.png
        ${pkgname}.sh
        https://www.epsxe.com/files/shaders.zip
        "https://www.epsxe.com/files/${_pkgname}${pkgver//./}linux_x64.zip"
        "https://archive.org/download/archlinux_pkg_ncurses/ncurses-5.9_20141101-1-$CARCH.pkg.tar.xz"
        # 64-bit Plugins
        "pcsxr-$_plgnver.tar.gz::https://github.com/frealgagu/PCSX-Reloaded/archive/$_plgnver.tar.gz"
        Makefile.patch
        pcsxr-fix-undefined-operations.patch
        configure_ac.patch
        peopsxgl_gpu_c.patch
        dfxvideo_cfg_c.patch
        )
conflicts=(bin32-epsxe)
noextract=(shaders.zip ncurses-5.9_20141101-1-$CARCH.pkg.tar.xz)
md5sums=('aeb34e2ca34f968630ca133ea821c61c'
         'eb0c46b8ae1355c589792f6be1835e47'
         '6239ab64858d131acc3d2629d5834701'
         'a863740899adb064b8a28c3fa47d5280'
         '79fefeb4bff26bf1d374befb35b390df'
         'd435d3e9481e5786b9e377abe63ce325'
         'ee0f9dfd003d9a5350aafc8cca0cdeee'
         '65b85557db7af4fbb775ce3256d9784c'
         '96a82dcc66851160f452160a538cd6f8'
         'f84d9eff59ac127eb37be4088c599fe6'
         '5576cd7ddfe7e025f7e64ba532875420'
         '97dba4a28e162cd93882194d3a02bbf1')



prepare()
{
  cd "$srcdir"

  mv "${pkgname}_x64" "$pkgname"

  tar xf ncurses*.tar.xz usr/lib/libncursesw.so.5.9 2> /dev/null
  mv usr/lib/libncursesw.so.5.9 .
  rm -rf usr

  ## process shaders ##
  rm -rf shaders tmp
  mkdir tmp
  unzip -q shaders.zip -d tmp
  mv tmp/shaders "$srcdir"

  cd "$srcdir/PCSX-Reloaded-$_plgnver/pcsxr"
  patch < $srcdir/Makefile.patch
  patch < $srcdir/configure_ac.patch
  cd ..
  patch -Np1 -i "$srcdir"/pcsxr-fix-undefined-operations.patch
  mkdir -p "$srcdir/PCSX-Reloaded-$_plgnver/pcsxr/include"
  patch -Np1 -i "$srcdir"/peopsxgl_gpu_c.patch "$srcdir/PCSX-Reloaded-$_plgnver/pcsxr/plugins/peopsxgl/gpu.c"
  patch -Np1 -i "$srcdir"/dfxvideo_cfg_c.patch "$srcdir/PCSX-Reloaded-$_plgnver/pcsxr/plugins/dfxvideo/cfg.c"

  cd "$srcdir/PCSX-Reloaded-$_plgnver/pcsxr"


  ## Replace ~/.pcsxr with ~/.epsxe
  # # sed -i 's|\.pcsxr/plugins/|.epsxe/config/|' plugins/dfxvideo/cfg.c
  # sed -i 's|\.pcsxr/plugins/cfg/||' gui/Linux.h
  sed -i 's|\.pcsxr|.epsxe|' gui/Linux.h

  ## Fix several implict function definitions (waitpid)
  sed -ri 's|(#include "pad.h")|\1\n#include <sys/wait.h>|' plugins/dfinput/pad.c
  sed -ri 's|(#include "stdafx.h")|\1\n#include <sys/wait.h>|' plugins/dfsound/cfg.c
  sed -ri 's|(#include "cdr.h")|\1\n#include <sys/wait.h>|' plugins/dfcdrom/cdr.c
  sed -ri 's|(#include "sio1.h")|\1\n#include <sys/wait.h>|' plugins/bladesio1/sio1.c
  # sed -ri 's|(#include "stdafx.h")|\1\n#include <sys/wait.h>|' plugins/peopsxgl/gpu.c

  ## Fix implicit function definitions (fork)
  sed -ri 's|(#include "sio1.h")|\1\n#include <unistd.h>|' plugins/bladesio1/sio1.c

  ## Fix incorrect assignment
  # sed -i 's|\*disp=(unsigned long \*)display;\(.*\)|disp\1|' plugins/peopsxgl/gpu.c
  # sed -i 's/pcsxr/epsxe/g' configure.ac

  sed -i 's|/games/psemu\/||g' plugins/peopsxgl/Makefile.am
  sed -i 's|\/psemu\/||g' plugins/peopsxgl/Makefile.am
}

build() {
  cd "${srcdir}/PCSX-Reloaded-$_plgnver/pcsxr"

  export CC="gcc"
  export CXX="g++"
  export CFLAGS+=" -fcommon -I/usr/include/harfbuzz"
  export CXXFLAGS+=" -I/usr/include/harfbuzz"
  export PKG_CONFIG_PATH='/usr/lib/pkgconfig'

  autoreconf -fi
  intltoolize --force

  ./configure \
    --prefix=/opt/epsxe \
    --enable-libcdio \
    --enable-opengl \
    --libdir="/opt/$pkgname/plugins" \
    --datadir="/opt/$pkgname/config" \
    --bindir="/opt/$pkgname/plugins" \
    --datarootdir="/opt/$pkgname/config"
  # make clean
  make # DATADIR="/opt/$pkgname/cfg"
}

package()
{
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -d "$pkgdir"/opt/$pkgname/config \
    "$pkgdir"/opt/$pkgname/plugins \
    "$pkgdir"/opt/$pkgname/shaders

  ## Docs and Shaders

  find docs -name 'e???e_*.txt' -execdir install -m 644 -t "$pkgdir/usr/share/doc/$pkgname" \{\} +
  find shaders -maxdepth 1 -mindepth 1 -type d | xargs -I: cp -r : "$pkgdir/opt/$pkgname/shaders"
  chmod 644 -R "$pkgdir/opt/$pkgname/shaders"
  find "$pkgdir/opt/$pkgname/shaders" -maxdepth 1 -type d | xargs -I: chmod 645 :

  ## Executable and images

  install -Dm 755 "$pkgname" "$pkgdir/opt/$pkgname/$pkgname"

  install -Dm 755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "$srcdir/epsxe.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "$srcdir/epsxe.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  ## NCURSES

  # ln -sf "$HOME/.${pkgname}/${pkgname}rc "$pkgdir/opt/$pkgname/.${pkgname}rc"
  install -m 644 "$srcdir/libncursesw.so.5.9" "$pkgdir/opt/$pkgname/libncursesw.so.5.9"
  cd "$pkgdir/opt/$pkgname"
  ln -sf libncursesw.so.5.9 libncurses.so.5
  ln -sf libncursesw.so.5.9 libtinfo.so.5


  ## CURL
  ln -sf /usr/lib/libcurl-compat.so.4.8.0 "$pkgdir"/opt/epsxe/libcurl.so.4

  ## Plugins
  cd "${srcdir}/PCSX-Reloaded-$_plgnver/pcsxr"
  make DESTDIR="$pkgdir" install
  # cd build

  # make DESTDIR="$pkgdir" install

  # cd "$pkgdir/opt/$pkgname/plugins/"

  ## PeopsSoftX
  ln -sf /opt/"$pkgname"/config/peopsxgl.ui "$pkgdir"/opt/epsxe/config/cfgpeopsxgl.ui
  #
  # install -m 755 -t "$pkgdir/opt/$pkgname/plugins" \
  #   opt/epsxe/plugins/libpeopsxgl.la \
  #   opt/epsxe/plugins/libpeopsxgl.so
  # install -m 755 usr/lib/games/psemu/cfgpeopsxgl "$pkgdir/opt/$pkgname/cfg"
  # install -m 755 usr/lib/games/psemu/cfgpeopsxgl "$pkgdir/opt/$pkgname/"

  chgrp games -R "$pkgdir/opt/epsxe"
  chmod g+rwx -R "$pkgdir/opt/epsxe"

  # cd
  #
  # for plugindir in "$pkgdir/opt/$pkgname/plugins"; do
  #   echo "Installing Peops"
  #   cd "$plugindir"
  #   install -m 755 usr/lib/games/psemu/libpeopsxgl.so "$plugindir"
  #   mv usr/lib/games/psemu/cfgpeopsxgl "$plugindir/../cfg"
  # done
  # cd ..
}
