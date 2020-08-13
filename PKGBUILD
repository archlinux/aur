# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: CrocoDuck <crocoduck dot oducks at gmail dot com>
# Contributor: Simon Thorpe <simon@hivetechnology.com.au>

pkgname=pianoteq-standard-trial-bin
pkgver=6.7.3
pkgrel=1
pkgdesc="Virtual piano instrument using physical modelling synthesis. Both standalone and plugin versions."
arch=('i686' 'x86_64')
url="https://www.pianoteq.com/home"
license=('custom')
groups=('lv2-plugins' 'pro-audio')
depends=('alsa-lib' 'freetype2' 'libxext')
makedepends=('gendesk' 'wget' 'p7zip')
optdepends=('jack: JACK support for stand-alone application')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" 'pianoteq-standard-bin')
source=('https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
sha256sums=('94ee64cf6688a49d74f0bf70d811e7466abac103feeab17496a89f828afcc6d3')

# Define the target archive filename:
_downfname="pianoteq_linux_trial_v${pkgver//./}.7z"
# Define its checksum:
_downsha256sum='9c74c0aa8b0e26a0b4567470dbfc55a59eb2d36bef6aee8281f36682237f007b'

prepare() {
  # Download archive, if neccessary
  if [[ ! -e "${srcdir}/${_downfname}" ]]; then
    # The archive download link needs to be retrieved. Retrieve download page source:
    wget -q -O downpage.html https://www.pianoteq.com/try?file="$_downfname"

    # Now, isolate the final string of the download link from the source:
    downstr=$(cat downpage.html | grep "<form action" | grep style | grep -o -P '(?<=action=").*(?=" method)')

    # All ingredients are ready! Finalize the download url and download:
    downurl="https://www.pianoteq.com/"$downstr""
    wget --content-disposition -O "${srcdir}/${_downfname}" "$downurl"
  fi

  # Check integrity:
  echo $_downsha256sum "${srcdir}/${_downfname}" | sha256sum -c || { echo 'Checksum failed!'; exit 1; }

  # Extract:
  7z x -y "${srcdir}/${_downfname}"

  # Generate Desktop Entry:
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='Pianoteq 6' --exec='Pianoteq\ 6' --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package() {
  # Define architecture specific file directory:
  if [[ "$CARCH" == i686 ]]; then
    archdir=i386
  else
    archdir=amd64
  fi

  # Install program files:
  install -Dm 755 "$srcdir/Pianoteq 6/$archdir/Pianoteq 6" "$pkgdir/usr/bin/Pianoteq 6"
  install -Dm 755 "$srcdir/Pianoteq 6/$archdir/Pianoteq 6.so" "$pkgdir/usr/lib/vst/Pianoteq 6.so"
  cd "$srcdir/Pianoteq 6/$archdir/Pianoteq 6.lv2"
  for i in *; do
    install -D "$i" "$pkgdir/usr/lib/lv2/Pianoteq 6.lv2/$i"
  done
  cd $srcdir

  # Install desktop launcher:
  install -Dm 644 "$srcdir/pianoteq_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"

  # Install the license:
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 Pianoteq\ 6/*Licence* "$pkgdir/usr/share/licenses/$pkgname/"

  # Install the Documentation:
  install -D "Pianoteq 6/README_LINUX.txt" "$pkgdir/usr/share/doc/${pkgname%-*}/README_LINUX.txt"
  cd "$srcdir/Pianoteq 6/Documentation"
  for i in *; do
    install -D "$i" "$pkgdir/usr/share/doc/${pkgname%-*}/$i"
  done
}
