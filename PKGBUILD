# Maintainer: Luke Bubar <luke@coldmail.xyz>

pkgname=opence-bin
_pkgname=opence
pkgver=244
_commit=6ec42856d73e258e5a8c7e9cd19161f46d89d0e4 # the commit tagged build-$pkgver
pkgrel=1
pkgdesc='Halo: Combat Evolved ported from the Xbox decompilation (needs your own Xbox disc image)'
arch=('x86_64')
url='https://github.com/OpenCommunityEdition/OpenCE'
# The port is AGPL-3.0-or-later (CC0 before its relicensing); the rest are the libraries built into it, whose license
# files come with the release.
license=('AGPL-3.0-or-later' 'Apache-2.0' 'BSD-3-Clause' 'BSD-4-Clause' 'ISC' 'MIT' 'OFL-1.1' 'Zlib')
# The game is 32-bit x86 code (its data has 32-bit pointers, as on the Xbox).
# The release brings its own SDL3, which loads the rest when it starts.
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-libxext' 'lib32-mesa'
         'hicolor-icon-theme')
optdepends=('lib32-pipewire: sound through PipeWire (one of the sound libraries is needed for sound)'
            'lib32-libpulse: sound through PulseAudio'
            'lib32-alsa-lib: sound through ALSA'
            'lib32-wayland: a native Wayland window instead of XWayland (with lib32-libxkbcommon)'
            'lib32-libxkbcommon: a native Wayland window instead of XWayland (with lib32-wayland)'
            'lib32-libdecor: window borders on GNOME under Wayland'
            'zenity: the disc image picker at the first start, where there is no desktop portal'
            'xdg-utils: invite links that open the game'
            'lib32-nvidia-utils: graphics on NVIDIA cards')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Upstream's files as they are: its crash reports name addresses in this build.
options=('!strip' '!debug')
install="$pkgname.install"
# Upstream keeps only its last five releases: once five newer builds are out,
# this release and its tag are gone and pkgver must be bumped (update.sh).
_raw="https://raw.githubusercontent.com/OpenCommunityEdition/OpenCE/$_commit"
source=("halo-linux-release-$pkgver.zip::$url/releases/download/build-$pkgver/halo-linux-release.zip"
        "LINUX-$pkgver.md::$_raw/port/linux/README.md"
        "opence-icon-256-$pkgver.png::$_raw/port/assets/icon/opence-icon-256.png"
        "opence-icon-512-$pkgver.png::$_raw/port/assets/icon/opence-icon.png"
        'opence.sh'
        'opence.desktop')
sha256sums=('592d32efbd9d06c88484837f7a602518616e8cc72849492bf821e30687534326'
            '3406e0ed5ef6c5e9373b0a67cbb8b46161386ad76d72d23ca87ba6bdd024cf3a'
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

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" ./*-LICENSE.txt ./*-COPYING.txt ./*-OFL.txt
}
