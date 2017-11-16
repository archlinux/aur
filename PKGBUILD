# Maintainer: Steffo <me@steffo.eu>
# Contributor: liberodark

# Sources used:
# The original spiral-knights AUR package <https://aur.archlinux.org/packages/spiral-knights/>
# "Tutorial: How to play Spiral Knights natively on Linux with your Steam account." on r/spiral_knights <https://www.reddit.com/r/spiral_knights/comments/bxby51/tutorial_how_to_play_spiral_knights_natively_on/>
# "Improve In-Game Performance" guide on Steam <https://steamcommunity.com/sharedfiles/filedetails/?id=1847575647>

# Package information
pkgname="spiral-knights-steam"
pkgver=1
pkgrel=1
pkgdesc="Spiral Knights Linux client with Steam support"
arch=("x86_64")
url="https://store.steampowered.com/app/99900/Spiral_Knights/"
license=("unknown")

# Dependencies
depends=(
  "xdg-utils"
  "bin32-jre"
  "steam"
)
conflicts=(
  
)

# Source files
source_x86_64=(
  "https://github.com/liberodark/Spiral-Knights/releases/download/1.0.0/spiral.tar.gz"
)
source=(
  # Desktop files
  "spiral-knights.desktop"
  "spiral-knights.png"
  # Steam files
  "steam_appid.txt"
  "libsteam_api.so"
  # Optimization files
  "extra.txt"
  # Compatibility files
  "spiral32"
)

# Source files checksums
sha512sums=(
  # spiral-knights.desktop
  "b45f60b9a257d0a1aa4593bdb73b9454b467eef6f588225d5d7188be5a06db2254ba61b6e4ef8f7f61f65dc5949f9c2836623bdce905204b9b93d0e253395248"
  # spiral-knights.png
  "08d5165d510755ea84ebe189803dbf66e50efd0c5b35d92b48a164f593544bce85b2852e24a41d218c733116e93994e315cafa677b8dc62d2d163a35687c52d8"
  # steam_appid.txt
  "35b91557cb0c4521833bb181ad344e64364e524597d91c0533df4c974254039ca6f63d45936c75fdc3383d91b901fab5639d1c62c3729c357f186ca43ef32a73"
  # libsteam_api.so
  "99924737fc91a2634cf301a4a1d5b4f2885f813ef80988af5a537d34f2a893f8f7efd5d30b30ae0b70de6a717fa6d239af4253c299a898641c8215491d5ffc93"
  # extra.txt
  "72b523346ebe40b603245eeeada75002d1889c32f9d738c18d556a710f5cdb97e393317957097c14dd06a3d099b1183a443b072a13c6b43e7a02202e19a33e7d"
  # spiral32
  "4d392dbe03b0e3822a87b2a45de57383957d68f0512e201d3a1e3f44362594fec9e4e8031c422653472218fa23a8ffb6189cd6c8beb7e8ad4c7056b6ab1bcf36"
)
sha512sums_x86_64=(
  '818b8f4ff61b2cbd98ffcd9962771fd383860285d31f54e6b057c3244e056ac986e930324c0e0afe924017658badfdde423062e291161b79803811ef226e832e'
)
        
package() {
  # Enter the source directory
  cd $srcdir
  # Extract the sources tar
  tar --extract -f spiral.tar.gz
  # Create the /opt/spiral-knights-steam directory and optionally parent directories
  mkdir --parents "$pkgdir/opt/spiral-knights-steam"
  # Create the /opt/spiral-knights-steam/native directory
  mkdir "$pkgdir/opt/spiral-knights-steam/native"
  # Copy the contents of the source tar to the installation directory
  cp -r "spiral/." "$pkgdir/opt/spiral-knights-steam/"
  # Copy the client modifications to the installation directory
  cp "$srcdir/spiral32" "$pkgdir/opt/spiral-knights-steam/spiral32"
  cp "$srcdir/steam_appid.txt" "$pkgdir/opt/spiral-knights-steam/steam_appid.txt"
  cp "$srcdir/libsteam_api.so" "$pkgdir/opt/spiral-knights-steam/native/libsteam_api.so"  # This goes in the native/ directory
  cp "$srcdir/extra.txt" "$pkgdir/opt/spiral-knights-steam/extra.txt"
  # Change permissions for the spiral-knights-steam directory so that the installer will be able to update itself
  chmod 667 -R "$pkgdir/opt/spiral-knights-steam"  # FIXME: seems like a security risk, but I don't currently have the knowledge to fix it
  # Install the .desktop files
  install -D --mode=644 "$srcdir/spiral-knights.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D --mode=644 "$srcdir/spiral-knights.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
