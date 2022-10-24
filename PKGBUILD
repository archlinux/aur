# Maintainer: mattski <redmattski at gmail dot com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Simon Thorpe <simon@hivetechnology.com.au>

pkgname=easyabc
pkgver=305
pkgrel=1
pkgdesc="A graphical music notation editor for the ABC music notation language"
arch=('any')
url="https://github.com/jwdj/EasyABC"
license=('GPL')
#depends=('python-wxpython' 'python-pyparsing' 'python-pygame' 'abcmidi' 'abcm2ps' 'ghostscript')
depends=('python39' 'abcmidi' 'abcm2ps' 'ghostscript')
makedepends=('gendesk' 'git')
provides=($pkgname)
conflicts=($pkgname)
source=("$pkgname::git+https://github.com/jwdj/EasyABC.git")
md5sums=('SKIP')

prepare(){
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name='EasyABC' \
    --mimetype='text/vnd.abc' \
    --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

pkgver(){
  cd $pkgname
  git log --pretty=format: | wc -l
}

package(){
  mkdir -p "$pkgdir"/usr/share
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/opt/easyabc/bin

  install -dm755 "$pkgdir"/opt/easyabc
  cp -dpr --no-preserve=ownership "${pkgname}" $pkgdir/opt/
  echo -e '#!/bin/bash\n/opt/easyabc/bin/python /opt/easyabc/easy_abc.py "$@"' > $pkgdir/usr/bin/easyabc
  chmod +x $pkgdir/usr/bin/easyabc
  install -Dm644 "${pkgname}/img/logo64.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"


  cd "$pkgdir"/opt
  python3.9 -m venv easyabc
  source easyabc/bin/activate
  pip install --upgrade pip
  pip install wxpython==4.1.1 --use-pep517
  pip install pyparsing
  pip install pygame

  ln -s /usr/bin/abc2abc $pkgdir/opt/easyabc/bin/
  ln -s /usr/bin/abc2midi $pkgdir/opt/easyabc/bin/
  ln -s /usr/bin/abcm2ps $pkgdir/opt/easyabc/bin/
}
