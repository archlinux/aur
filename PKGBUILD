# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/Soldat/soldat
# Upstream: https://github.com/Soldat/soldat

pkgname=('soldat-git')
_branch='develop'
_installdir='/usr/share/soldat'
pkgver=122.g967097b
pkgrel=1
pkgdesc="Unique 2D (side-view) multiplayer action game."
arch=('x86_64')
url='https://github.com/Soldat/soldat'
# NOTE: BSD is the license for GNS
license=('MIT' 'cc-by-4.0' 'BSD')
# NOTE: protobuf & openssl are deps for GNS
depends=('sdl2' 'openal' 'freetype2' 'physfs' 'protobuf' 'openssl')
# NOTE: cmake & ninja are make-deps for GNS
makedepends=('make' 'fpc' 'zip' 'cmake' 'ninja')
provides=('soldat')
source=("$pkgname::git+https://github.com/Soldat/soldat.git#branch=$_branch"
        "soldat-base::git+https://github.com/Soldat/base.git"
        "game-networking-sockets::git+https://github.com/ValveSoftware/GameNetworkingSockets.git")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/continuous-//g' | sed 's/-/./g'
}

build() {
  # compile game-networking-sockets
  cd "$srcdir/game-networking-sockets"
  mkdir -p build;
  cd build;
  cmake -G Ninja ..
  ninja
  cp "src/libGameNetworkingSockets.so" "$srcdir/$pkgname/shared/libs/GameNetworkingSockets/"

  # compile assets
  cd "$srcdir/soldat-base"
  chmod +x create_smod.sh
  ./create_smod.sh

  # compile engine
  cd "$srcdir/$pkgname"
  mkdir -p server/build/linux; mkdir -p client/build/linux
  cd server; make linux_x86_64; cd ..;
  cd client;
  cd libs/stb; make; cd ../..;
  make linux_x86_64; cd ..;

  # create bins
  cat <<EOF > soldat
#!/usr/bin/env sh
$_installdir/soldat_x64 -fs_portable 0 \$@
EOF

  # HACK: fs_portable doesnt work on the server =/
  cat <<EOF > soldatserver
#!/usr/bin/env sh
$_installdir/soldatserver_x64 -fs_userpath ~/.local/share/Soldat/Soldat \$@
EOF

  # create desktop file
  cat <<EOF > soldat.desktop
[Desktop Entry]
Type=Application
Name=Soldat
Exec=soldat -joinurl %u
Icon=$_installdir/soldat.ico
StartupNotify=false
Terminal=false
MimeType=x-scheme-handler/soldat;
EOF
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 "$srcdir/soldat-base/client/readme.txt" "$pkgdir/usr/share/licenses/$pkgname/ASSET_LICENSE"
  install -Dm 644 "$srcdir/game-networking-sockets/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/GameNetworkingSockets"
  install -Dm 655 "server/build/soldatserver_x64" -t "$pkgdir/$_installdir";
  install -Dm 655 "client/build/soldat_x64" -t "$pkgdir/$_installdir";
  install -Dm 644 "client/build/libstb.so" -t "$pkgdir/$_installdir";
  install -Dm 644 "client/media/soldat.ico" -t "$pkgdir/$_installdir";
  install -Dm 644 "shared/libs/GameNetworkingSockets/libGameNetworkingSockets.so" -t "$pkgdir/$_installdir";
  install -Dm 644 "$srcdir/soldat-base/soldat.smod" -t "$pkgdir/$_installdir";
  install -Dm 644 "$srcdir/soldat-base/client/play-regular.ttf" -t "$pkgdir/$_installdir";
  install -Dm 655 "soldat" -t "$pkgdir/usr/bin";
  install -Dm 655 "soldatserver" -t "$pkgdir/usr/bin";
  install -Dm 644 "soldat.desktop" -t "$pkgdir/usr/share/applications";
}
