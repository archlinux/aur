# Maintainer: Luke Bubar <luke@coldmail.xyz>

pkgname=gulchce-bin
_pkgname=gulchce
pkgver=105
_commit=c1d20723ce47b719bcdb355c6e47cb894722f324 # the commit tagged build-$pkgver
pkgrel=1
pkgdesc='OpenCE fork with experimental features such as Halo MCC custom maps (needs your own Xbox disc image)'
arch=('x86_64')
url='https://github.com/chestahh/GulchCE'

# The port is CC0; the rest are the libraries built into it, whose license
# files come with the release.
license=('CC0-1.0' 'Apache-2.0' 'BSD-3-Clause' 'BSD-4-Clause' 'ISC' 'MIT' 'OFL-1.1' 'Zlib')
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
        "LICENSE-$pkgver.md::$_raw/LICENSE.md"
        "LINUX-$pkgver.md::$_raw/port/linux/README.md"
        "MCC-$pkgver.md::$_raw/docs/mcc_maps.md"
        "icon-256-$pkgver.png::$_raw/port/assets/icon/opence-icon-256.png"
        "icon-512-$pkgver.png::$_raw/port/assets/icon/opence-icon.png"
        'gulchce.sh'
        'gulchce.desktop')
sha256sums=('0cf9fc6a009268caf8a99bc2ecb35b10d8d19fbe0052ac7c9a624496c00822a7'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499'
            '9b7caed04a1fec5546f9003bd4adfd46f526748bc938a9a9571a70de67ae1553'
            '4a44b5e576837480d988de0e0c27ccf319235d443ba5d6d92291790a17b0cc99'
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

  install -Dm644 "LICENSE-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./*-LICENSE.txt ./*-COPYING.txt ./*-OFL.txt
}
