# Maintainer: SanskritFritz (gmail)
# Contributor: Jason Melton <jason.melton@gmail.com>
# Contributor: Tiago Pierezan Camargo <tcamargo@gmail.com
# Contributor: Paul Bredbury <brebs@sent.com>
# Contributor: Benjamin Dirks <asaru[at]wtnet[dot]de>

pkgname=worldofpadman
pkgver=1.6
pkgrel=4
pkgdesc="Cartoon-style multiplayer first-person shooter"
arch=('i686' 'x86_64')
url="http://www.worldofpadman.com/"
license=('GPL' 'custom')
depends=('curl' 'libogg' 'libvorbis' 'mesa' 'openal' 'sdl')
makedepends=('unzip')
source=(${pkgname}.desktop
  wop-1.5-unified.zip::http://downloads.sourceforge.net/project/worldofpadman/wop-1.5-unified.zip
  wop-1.5.x-to-1.6-patch-unified.zip::http://downloads.sourceforge.net/project/worldofpadman/wop-1.5.x-to-1.6-patch-unified.zip)

_gamedir="/usr/share/$pkgname"

package() {
  cd "$srcdir"

  ## Binaries
  if [ "$CARCH" == i686 ] ; then
    install -D -m755 wop.i386 "$pkgdir/$_gamedir/wop.bin" 
    install -D -m755 wopded.i386 "$pkgdir/$_gamedir/wopded.bin" 
    install -D -m755 renderer_opengl1_i386.so ${pkgdir}/${_gamedir}/renderer_opengl1_i386.so
  fi
 
  if [ "$CARCH" == x86_64 ]  ; then
    install -D -m755 wop.x86_64 "$pkgdir/$_gamedir/wop.bin" 
    install -D -m755 wopded.x86_64 "$pkgdir/$_gamedir/wopded.bin"
    install -D -m755 renderer_opengl1_x86_64.so ${pkgdir}/${_gamedir}/renderer_opengl1_x86_64.so
  fi

  cat >wop.sh <<EOF
#!/bin/bash
cd $_gamedir && exec ./wop.bin "\$@"
EOF
  cat >wopded.sh <<EOF
#!/bin/bash
cd $_gamedir && exec ./wopded.bin "\$@"
EOF

  install -D -m755 wop.sh "$pkgdir/usr/bin/wop"
  install -D -m755 wopded.sh "$pkgdir/usr/bin/wopded"
  
  # Data
  # Using "read", so can handle filenames containing spaces
  find wop -type f | while read _f ; do
    install -D -m644 "$_f" "${pkgdir}/$_gamedir/$_f"
  done
  # Return from the function, since install's return just exits the loop
  # See http://fvue.nl/wiki/Bash:_Error_handling
  [ $? -gt 0 ] && return 1

  # Desktop
  install -D -m644 ${srcdir}/XTRAS/icon.svg     ${pkgdir}/usr/share/pixmaps/$pkgname.svg
  install -D -m644 ${srcdir}/$pkgname.desktop   ${pkgdir}/usr/share/applications/$pkgname.desktop 

  # Docs
  cd "$srcdir/XTRAS"
  # Using "read", so can handle filenames containing spaces
  find . -type f | while read _f ; do
    install -D -m644 "$_f" "${pkgdir}/usr/share/doc/$pkgname/$_f"
  done
  # Return from the function, since install's return just exits the loop
  # See http://fvue.nl/wiki/Bash:_Error_handling
  [ $? -gt 0 ] && return 1

  # License
  install -D -m644 copyright_en.txt "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}

md5sums=('30a9fe2dfa9362a2ef9266fd37e9461c'
         '8871affc2a36f23aa22044454c834923'
         '86ab95804ec6b1f0c81078f083c0fcda')
