# Maintainer: Winicius Cota <winicius.cota@gmail.com>
# Contributor: Tom Parys <tom.parys@gmail.com>
# Contributor: ZekeSulastin <zekesulastin@gmail.com>
# Contributor: David H. Bronke <whitelynx@gmail.com>
# Contributor: Mr_Robotic_Evil <mr.robotic.evil@googlemail.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: Marius Nestor <marius@softpedia.com>

# Warning: This package is BIG; you'll need at least 9 GiB free in
#   order to build version 1.1.1 (2 GiB for the downloads alone, about 3 GiB for the
#   unpacked game data and source, and 3.3 GiB for the finished package if
#   uncompressed)  'mv' is used over 'cp' in the package phase to save a bit
#   of space, but make sure there is enough room for everything.

# This PKGBUILD is based on fs2_open and fs2_open-data from AUR; the
# maintainers and contributors of those packages have been listed as
# contributors above.

pkgname=bsg-diaspora-sa
pkgver=1.1.1
pkgrel=1
pkgdesc="Diaspora: Shattered Armistice is a single and multiplayer space fighter combat game set in the reimagined Battlestar Galactica universe."
url="http://diaspora.hard-light.net/"
arch=('i686' 'x86_64')
license=('CCPL' 'custom:fs2_open')
depends=('libjpeg' 'libpng' 'libtheora' 'libvorbis' 'lua51' 'mesa' 'openal' 'sdl' 'jansson' 'wxlauncher')
# optdepends=('wxlauncher: a launcher for fs2_open-based games')
install=bsg-diaspora-sa.install
source=('http://diaspora.fs2downloads.com/Diaspora_R1_Linux.tar.lzma'
        'http://diaspora.fs2downloads.com/Diaspora_R1_Patch_1.1.tar.lzma'
        'http://diaspora.fs2downloads.com/Diaspora_R1_Patch_1.1.1.tar.lzma'
        'bsg-diaspora-sa'
        'bsg-diaspora-sa.conf'
        'bsg-diaspora-sa.desktop'
        'bsg-diaspora-sa.png')

md5sums=('22b55ae9bc9366ccbeb1642cd50dc3f8'
      	 '423182f96a97e657da0e27b708b48abf'
      	 'd73890efd3e86b336d96b339e0a59a46'
         '2c8befd5c503d7e494fb8fc87a7c1464'
         'ef9920040cf4c37419c89ca007df3022'
         '50ae3eafa6f50add7f592e32b0c600e8'
         '3ff26bc4a7d14af7b3b8fcb32ff0f367')
# This package is about 3 GiB uncompressed and takes a while to recompress for
# not too much space savings; the following PKGEXT disables compression of the
# package.  Add .xz or similar to the end of PKGEXT to compress the package.
PKGEXT=".pkg.tar"

prepare() {
    local SOURCE="$srcdir/Diaspora_R1_Linux/Diaspora/"

    msg "Removing unneeded files..."
    rm -r $SOURCE/resources $SOURCE/wxlauncher

    # 1.1 patch
    msg "Applying patch 1.1"
    #tar -xf $srcdir/Diaspora_R1_Patch_$pkgver/Patch_Files.$pkgver.tar -C $SOURCE
    tar -xf $srcdir/Patch_Files.1.1.tar -C $SOURCE

    # 1.1.1 patch
    msg "Applying patch 1.1.1"
    tar -xf $srcdir/Patch_Files.1.1.1.tar -C $SOURCE
}

build() {

  local SOURCE="$srcdir/Diaspora_R1_Linux/Diaspora/"

  # (1) Build the game engine (fs2_open)
  msg "Building..."
  cd $SOURCE/fs2_open
	# LDFLAGS="-l:liblua.so.5.1 $LDFLAGS" CXXFLAGS="-I/usr/include/lua5.1 $CXXFLAGS" ./autogen.sh --enable-speech

  env LUA_CFLAGS="$(pkg-config --cflags lua51)" \
      LUA_LIBS="$(pkg-config --libs lua51)"     \
      ./autogen.sh

  make

  # (2) Set up the Diaspora launcher profile (for wxlauncher)
  cd $SOURCE
  sed "s@^folder=.*\$@folder=/opt/$pkgname@;s@pro00099.template.ini@@" pro00099.template.ini > pro00099.ini


  # Grab command-line options from pro00099.ini for our runner script.
  cd $srcdir
  FS2_OPTS="$(sed -n 's@^flags=\(.*\)$@\1@p' $SOURCE/pro00099.ini | tr -d '\r\n')"
  sed -i "s@\\(FS2OPTS=\\).*@\\1\"$FS2_OPTS\"@" $srcdir/bsg-diaspora-sa.conf
}

package() {
  local SOURCE="$srcdir/Diaspora_R1_Linux/Diaspora/"

  cd $SOURCE

  #install -D -m644 -t "$pkgdir/opt/$pkgname/" *.vp *.ini *.png *.bmp data
  install -m644 -d "$pkgdir/opt/$pkgname/"
  mv *.vp *.png *.bmp mod.ini pro00099.ini data "$pkgdir/opt/$pkgname/"

  #install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname/" *.pdf *.txt *.rtf
  install -m644 -d "$pkgdir/usr/share/doc/$pkgname/"
  mv *.pdf *.txt *.rtf "$pkgdir/usr/share/doc/$pkgname/"

  # Fix permissions (since 'mv' won't set them)
  chmod -R 644 "$pkgdir/opt/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"
  find "$pkgdir/opt/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/" -type d -exec chmod 755 '{}' \;

    install -D -m755 $srcdir/bsg-diaspora-sa "$pkgdir/usr/bin/bsg-diaspora-sa"
    install -D -m644 $srcdir/bsg-diaspora-sa.conf "$pkgdir/usr/share/$pkgname/bsg-diaspora-sa.conf"
    install -D -m644 $srcdir/bsg-diaspora-sa.png "${pkgdir}/usr/share/pixmaps/bsg-diaspora-sa.png"
    install -D -m644 $srcdir/bsg-diaspora-sa.desktop "$pkgdir/usr/share/applications/bsg-diaspora-sa.desktop"
    install -D -m644 fs2_open/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 fs2_open/code/fs2_open_3.7.1 "$pkgdir/opt/$pkgname/fs2_open_diaspora"
}