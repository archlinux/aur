# Maintainer: Andrew Lin <andrewlin16 at gmail dot com>
# Contributor: Simon Thorpe <simon at hivetechnology dot com dot au>
pkgname=openmpt
pkgver=1.29.11.00
pkgrel=1
pkgdesc="Open-source audio module tracker"
arch=('i686' 'x86_64')
url="https://openmpt.org/"
license=('BSD')
depends=('wine')
makedepends=('gendesk' 'imagemagick')
optdepends=(
  'bash-completion: tab completion support'
  'ccache: for Wine native host support'
)
source_i686=("https://download.openmpt.org/archive/openmpt/$(echo $pkgver | grep -Po '^\d+.\d+')/OpenMPT-$pkgver-portable.zip")
source_x86_64=("https://download.openmpt.org/archive/openmpt/$(echo $pkgver | grep -Po '^\d+.\d+')/OpenMPT-$pkgver-portable-x64.zip")
sha256sums_i686=('0c6ad8c985651a11bd09b3e833b6787d8e28b62aeb324101116c4955316b3f1e')
sha256sums_x86_64=('74f2c52954b5f139c814d4a0da5d5a393ab57c3b3b23260fa7ed71ddab8c01dd')

prepare(){
  convert "$srcdir/OpenMPT-$pkgver/mpt.ico" "$srcdir/icon.png"
  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name='OpenMPT' \
    --mimetype='audio/x-mod;audio/x-s3m;audio/x-xm;audio/x-it;audio/x-mptm' \
    --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package(){
  mkdir -p $pkgdir/usr/share
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/bash-completion/completions
  cp -R $srcdir/OpenMPT-$pkgver $pkgdir/usr/share/openmpt
  # Since OpenMPT 1.29, portable installations are identified by the presence of the "OpenMPT.portable" file.
  # That file is removed here to keep existing installations configured properly.
  rm $pkgdir/usr/share/openmpt/OpenMPT.portable
  echo -e '#!/bin/bash\n[[ "$1" == "" ]] && wine /usr/share/openmpt/OpenMPT.exe\n[[ "$1" != "" ]] && wine /usr/share/openmpt/OpenMPT.exe "$(winepath -w "$1")"' >$pkgdir/usr/bin/openmpt
  chmod +x $pkgdir/usr/bin/openmpt
  install -Dm644 "$srcdir/icon-2.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  
  mkdir -p $pkgdir/usr/share/mime/application
  echo -e '<?xml version="1.0" encoding="utf-8"?><mime-type xmlns="http://www.freedesktop.org/standards/shared-mime-info" type="audio/x-mptm"><glob pattern="*.mptm"/><comment>OpenMPT Module</comment></mime-type>' >"$pkgdir/usr/share/mime/application/x-mptm.xml"
  
  # This list of supported file extensions was taken from the features page of the website. There is probably a more complete list somewhere.
  echo "_openmpt() { local cur prev words cword split; _init_completion -s || return; _filedir '@(669|AMF|AMS|DBM|DIGI|DMF|DSM|FAR|GDM|ICE|ST26|IMF|IT|ITP|J2B|M15|STK|MDL|MED|MO3|MOD|MPTM|MT2|MTM|OKT|PLM|PSM|PTM|S3M|STM|ULT|UMX|WOW|XM)'; } && complete -F _openmpt openmpt" >$pkgdir/usr/share/bash-completion/completions/openmpt
}

# vim:set ts=2 sw=2 et:
