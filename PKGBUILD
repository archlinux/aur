# Maintainer: Simon Thorpe <simon@hivetechnology.com.au>
pkgname=sekaiju
pkgver=4.5
pkgrel=2
pkgdesc="Sequencer for editing MIDI files"
arch=('i686' 'x86_64')
url="http://openmidiproject.sourceforge.jp/Sekaiju_en.html"
license=('LGPL')
depends=('wine')
makedepends=('gendesk' 'imagemagick')
optdepends=('bash-completion: tab completion support')
source=("http://osdn.jp/frs/redir.php?f=%2Fopenmidiproject%2F63237%2FSekaiju4.5.zip")
sha256sums=('f86ac9715b6acb0022272a92d38d98043537dbff60c994c2edd221ca65b145b8')

prepare(){
  convert "$srcdir/Sekaiju4.5/res/SekaijuType.ico" "$srcdir/icon.png"
  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name='Sekaiju' \
    --mimetype='audio/midi' \
    --categories 'Audio;Sequencer;Midi;Music;'
}

package(){
  mkdir -p $pkgdir/usr/share
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/bash-completion/completions
  cp -R $srcdir/Sekaiju4.5 $pkgdir/usr/share/$pkgname
  echo -e '#!/bin/bash\n[[ "$1" == "" ]] && wine /usr/share/sekaiju/Sekaiju.exe\n[[ "$1" != "" ]] && wine /usr/share/sekaiju/Sekaiju.exe "$(winepath -w "$1")"'>$pkgdir/usr/bin/sekaiju
  echo -e '[Language]\nUserInterface=English' >$pkgdir/usr/share/$pkgname/Sekaiju.ini
  chmod +x $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  echo "_$pkgname() { local cur prev words cword split; _init_completion -s || return; _filedir '@(skj|chy|mid|csv|vsq)'; } && complete -F _$pkgname $pkgname" >$pkgdir/usr/share/bash-completion/completions/sekaiju
}