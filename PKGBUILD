# Maintainer: Jason Melton <jason.melton@gmail.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com>
# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Benjamin Dirks <asaru[at]wtnet[dot]de>

pkgname=worldofpadman-beta
pkgver=1.5.4
pkgrel=1
pkgdesc="Cartoon-style multiplayer first-person shooter"
arch=(i686 x86_64)
url="http://www.worldofpadman.com/"
license=('GPL' 'custom')
depends=('curl' 'libogg' 'libvorbis' 'mesa' 'openal' 'sdl')
makedepends=('unzip')
conflicts=('worldofpadman')
source=(
	wop-1.5-unified.zip::http://sourceforge.net/projects/worldofpadman/files/v1.5/wop-1.5-unified.zip/download
  wop-1.5.x-to-1.5.4-beta-patch.zip::http://sourceforge.net/projects/worldofpadman/files/v1.5/wop-1.5.x-to-1.5.4-beta-patch.zip
    )

_gamedir="/usr/share/$pkgname"

build() {

  cd "$srcdir"

  ## Binaries
  if [ "$CARCH" == i686 ] ; then
      install -D -m755 wop.i386 "$pkgdir/$_gamedir/wop.bin" || return 1
      install -D -m755 wopded.i386 "$pkgdir/$_gamedir/wopded.bin" || return 1
  fi
 
  if [ "$CARCH" == x86_64 ]  ; then
      install -D -m755 wop.x86_64 "$pkgdir/$_gamedir/wop.bin" || return 1
      install -D -m755 wopded.x86_64 "$pkgdir/$_gamedir/wopded.bin" || return 1
  fi

  cat >wop.sh <<EOF
#!/bin/bash
cd $_gamedir && exec ./wop.bin "\$@"
EOF
  cat >wopded.sh <<EOF
#!/bin/bash
cd $_gamedir && exec ./wopded.bin "\$@"
EOF

  install -D -m755 wop.sh "$pkgdir/usr/bin/wop" || return 1
  install -D -m755 wopded.sh "$pkgdir/usr/bin/wopded" || return 1
  
  # Data
  # Using "read", so can handle filenames containing spaces
  find wop -type f | while read _f ; do
    install -D -m644 "$_f" "${pkgdir}/$_gamedir/$_f" || return 1
  done
  # Return from the function, since install's return just exits the loop
  # See http://fvue.nl/wiki/Bash:_Error_handling
  [ $? -gt 0 ] && return 1

  # Desktop
  #install -D -m644 ${srcdir}/wop.png            ${pkgdir}/usr/share/pixmaps/$pkgname.png || return 1
  #install -D -m644 ${srcdir}/$pkgname.desktop   ${pkgdir}/usr/share/applications/$pkgname.desktop || return 1

  # Docs
  cd "$srcdir/XTRAS" || return 1
  # Using "read", so can handle filenames containing spaces
  find . -type f | while read _f ; do
    install -D -m644 "$_f" "${pkgdir}/usr/share/doc/$pkgname/$_f" || return 1
  done
  # Return from the function, since install's return just exits the loop
  # See http://fvue.nl/wiki/Bash:_Error_handling
  [ $? -gt 0 ] && return 1

  # License
  install -D -m644 copyright_en.txt "${pkgdir}/usr/share/licenses/$pkgname/COPYING" || return 1
}

md5sums=('8871affc2a36f23aa22044454c834923'
         '9ff94e1b93ef8e3b4894f5872c535336')
