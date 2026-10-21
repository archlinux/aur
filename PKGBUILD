# Maintainer: Luke Bubar <luke@coldmail.xyz>

pkgname=gulchce-bin
_pkgname=gulchce
pkgver=250
_commit=d03bf4ed07d2a23b378d051470a0c93a4f927131 # the commit tagged build-$pkgver
pkgrel=1
pkgdesc='OpenCE fork with experimental features such as Halo MCC custom maps (needs your own Xbox disc image)'
arch=('x86_64')
url='https://github.com/chestahh/GulchCE'

license=('AGPL-3.0-or-later' 'Apache-2.0' 'BSD-3-Clause' 'BSD-4-Clause' 'ISC' 'MIT' 'OFL-1.1' 'Zlib')
# The game is 32-bit x86 code (its data has 32-bit pointers, as on the Xbox).
# The release brings its own SDL3, which loads the rest when it starts.
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-libxext' 'lib32-mesa'
         'hicolor-icon-theme')
optdepends=('lib32-nvidia-utils: graphics on NVIDIA cards'
            'lib32-pipewire: sound through PipeWire (one of the sound libraries is needed for sound)'
            'lib32-libpulse: sound through PulseAudio'
            'lib32-alsa-lib: sound through ALSA'
            'lib32-wayland: a native Wayland window instead of XWayland (with lib32-libxkbcommon)'
            'lib32-libxkbcommon: a native Wayland window instead of XWayland (with lib32-wayland)'
            'lib32-libdecor: window borders on GNOME under Wayland'
            'zenity: the disc image picker at the first start, where there is no desktop portal'
            'xdg-utils: invite links that open the game')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Upstream's files as they are: its crash reports name addresses in this build.
options=('!strip' '!debug')
install="$pkgname.install"
_raw="https://raw.githubusercontent.com/chestahh/GulchCE/$_commit"
source=("halo-linux-release-$pkgver.zip::$url/releases/download/build-$pkgver/halo-linux-release.zip"
        "LINUX-$pkgver.md::$_raw/port/linux/README.md"
        "MCC-$pkgver.md::$_raw/docs/mcc_maps.md"
        "icon-256-$pkgver.png::$_raw/port/assets/icon/opence-icon-256.png"
        "icon-512-$pkgver.png::$_raw/port/assets/icon/opence-icon.png"
        'gulchce.sh'
        'gulchce.desktop')
sha256sums=('c2a2be5e20057027dac003377c36bf965e03fd31e71624eed662e6dc938058f3'
            '17ecdef39cbae86cc338c72b1e211eb41ca6c9003547bf01388bb114aaa611ac'
            '0e81a8057669cee756a7d3f060c1b57b7ab884171103c8bbf411bc57522f75d1'
            '800572a2fdb7ad2521522b2a0a11d31f13f8dd9183a4314ff0849209f8732509'
            '4bfa804c3d8ee9d382cf05d5446d2fc6b01b40d2a047b1b76d897c96f9a8c74d'
            '38858896b99ec6870cef42a0fbf70ec8e9818591e21a079552172301d6412f4b'
            'f370c4c20dc62d183e96e97081f2b7af182577e28d65c5e70e6fda5a439a8e83')

package() {
  install -Dm755 halo "$pkgdir/usr/lib/$_pkgname/halo"
  install -Dm755 libSDL3.so.0 "$pkgdir/usr/lib/$_pkgname/libSDL3.so.0"
  install -Dm644 brokers.txt "$pkgdir/usr/lib/$_pkgname/brokers.txt"
  install -Dm755 gulchce.sh "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 gulchce.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "icon-256-$pkgver.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  install -Dm644 "icon-512-$pkgver.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  # The controls, the settings and multiplayer; installing MCC maps
  install -Dm644 "LINUX-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/LINUX.md"
  install -Dm644 "MCC-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/MCC.md"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./*-LICENSE.txt ./*-COPYING.txt ./*-OFL.txt
}
