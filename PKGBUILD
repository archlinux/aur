pkgname=zeldaladxhd-bin
pkgver=v1.8.4
pkgrel=2
scriptver=1.0.1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Open source and unofficial Links Awakening DX HD PC port"
arch=('x86_64' 'aarch64')
url="https://github.com/BigheadSMZ/Zelda-LA-DX-HD-Updated"
depends=('zenity' 'yad' 'git' 'sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'openal' 'libgl')
options=('!strip')
license=('GPL')
makedepends=('unzip')
sha256sums=('b9565e4e4dbbb8f5d74c5b227a23d103c55e4e06a1ec8af2ca6ef46db37c9813')
sha256sums_x86_64=('64b193458f9135404f7106a0e74ae3f27b8a118da6cd8f0d9196bc693b5ded5e')
sha256sums_aarch64=('be50a6c670654ef61931110c0f12bab845f80ad05524f23dc50fddef312b16c9')
source=("https://gitlab.com/linuxbombay/zeldaladxhd/-/archive/$scriptver/zeldaladxhd-$scriptver.tar.bz2")
source_x86_64=("https://github.com/BigheadSMZ/Zelda-LA-DX-HD-Updated/releases/download/$pkgver/LADXHD-Patcher-"$pkgver"-Linux-x64.zip")
source_aarch64=("https://github.com/BigheadSMZ/Zelda-LA-DX-HD-Updated/releases/download/$pkgver/LADXHD-Patcher-"$pkgver"-Linux-Arm64.zip")

package() {
   install -dm755 "$pkgdir/usr/bin"
   install -dm755 "$pkgdir/usr/share/games/Zeldaladxhd"
   install -dm755 "$pkgdir/usr/share/applications"
   install -dm755 "$pkgdir/usr/share/pixmaps"

   local patcher_pattern
   case "$CARCH" in
      x86_64) patcher_pattern='*Patcher-*x64*.AppImage' ;;
      aarch64) patcher_pattern='*Patcher-*Arm64*.AppImage' ;;
      *)
         printf 'Unsupported architecture: %s\n' "$CARCH" >&2
         return 1
         ;;
   esac

   shopt -s nullglob nocaseglob globstar
   local appimages=("$srcdir"/**/$patcher_pattern)
   if (( ${#appimages[@]} == 0 )); then
      case "$CARCH" in
         x86_64) appimages=("$srcdir"/**/*Patcher-*x86_64*.AppImage "$srcdir"/**/*Patcher-*amd64*.AppImage) ;;
         aarch64) appimages=("$srcdir"/**/*Patcher-*aarch64*.AppImage "$srcdir"/**/*Patcher-*arm64*.AppImage) ;;
      esac
   fi
   shopt -u nullglob nocaseglob globstar

   if (( ${#appimages[@]} == 0 )); then
      printf 'No %s patcher AppImage found under %s\n' "$CARCH" "$srcdir" >&2
      return 1
   fi

   install -Dm755 "${appimages[0]}" "$pkgdir/usr/share/games/Zeldaladxhd/patcher.AppImage"
   install -Dm755 "$srcdir/zeldaladxhd-$scriptver/zeldaladxhd" "$pkgdir/usr/bin"
   echo "$pkgver" > "$pkgdir/usr/share/games/Zeldaladxhd/version.txt"
   cp -r "$srcdir/zeldaladxhd-$scriptver/zeldaladxhd.svg" "$pkgdir/usr/share/pixmaps"
   install -Dm755 "$srcdir/zeldaladxhd-$scriptver/zeldaladxhd.desktop" "$pkgdir/usr/share/applications"
}
