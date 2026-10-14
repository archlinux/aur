# Maintainer: Luke Bubar <luke@coldmail.xyz>

pkgname=opence-bin
_pkgname=opence
pkgver=201
_commit=b1ef7f7e7aff00f0efdca4d575f7d9196d0b1590 # the commit tagged build-$pkgver
pkgrel=1
pkgdesc='Halo: Combat Evolved ported from the Xbox decompilation (needs your own Xbox disc image)'
arch=('x86_64')
url='https://github.com/OpenCommunityEdition/OpenCE'
# The port is CC0; the rest are the libraries built into it, whose license
# files come with the release.
license=('CC0-1.0' 'Apache-2.0' 'BSD-3-Clause' 'BSD-4-Clause' 'ISC' 'MIT' 'OFL-1.1' 'Zlib')
# The game is 32-bit x86 code (its data has 32-bit pointers, as on the Xbox).
# The release brings its own SDL3, which loads the rest when it starts.
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-libxext' 'lib32-opengl-driver'
         'hicolor-icon-theme')
optdepends=('lib32-pipewire: sound through PipeWire (one of the sound libraries is needed for sound)'
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
# Upstream keeps only its last five releases: once five newer builds are out,
# this release and its tag are gone and pkgver must be bumped (update.sh).
_raw="https://raw.githubusercontent.com/OpenCommunityEdition/OpenCE/$_commit"
source=("halo-linux-release-$pkgver.zip::$url/releases/download/build-$pkgver/halo-linux-release.zip"
        "LICENSE-$pkgver.md::$_raw/LICENSE.md"
        "LINUX-$pkgver.md::$_raw/port/linux/README.md"
        "opence-icon-256-$pkgver.png::$_raw/port/assets/icon/opence-icon-256.png"
        "opence-icon-512-$pkgver.png::$_raw/port/assets/icon/opence-icon.png"
        'opence.sh'
        'opence.desktop')
sha256sums=('947c588d6149515b85fdca2d0dc33e0add54c7bf752ccf15d7ebcaee4a686ff0'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499'
            'c34ee4c08576a20552aa0b3cfeb091c9f3eaf3dafb2a9f11c0bcd3d7744a439d'
            '800572a2fdb7ad2521522b2a0a11d31f13f8dd9183a4314ff0849209f8732509'
            '4bfa804c3d8ee9d382cf05d5446d2fc6b01b40d2a047b1b76d897c96f9a8c74d'
            '1f0340a31cecf5f42e86979a333b6cf2faba3805a58553861fe9aaf76de9461a'
            '26607fe993f5bdd29403c2c2731d18924a96ee0701115eba0d6ac88e9c819ecf')

package() {
  install -Dm755 halo "$pkgdir/usr/lib/$_pkgname/halo"
  install -Dm755 libSDL3.so.0 "$pkgdir/usr/lib/$_pkgname/libSDL3.so.0"
  install -Dm644 brokers.txt "$pkgdir/usr/lib/$_pkgname/brokers.txt"
  install -Dm755 opence.sh "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 opence.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "opence-icon-256-$pkgver.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  install -Dm644 "opence-icon-512-$pkgver.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"

  # The controls, the settings and multiplayer
  install -Dm644 "LINUX-$pkgver.md" "$pkgdir/usr/share/doc/$_pkgname/LINUX.md"

  install -Dm644 "LICENSE-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./*-LICENSE.txt ./*-COPYING.txt ./*-OFL.txt
}
