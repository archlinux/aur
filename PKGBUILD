# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/Soldat/soldat
# Upstream: https://github.com/Soldat/soldat

pkgname=('soldat-git')
installdir='/usr/share'
pkgver=1.18.1.g9c8d032
pkgrel=1
pkgdesc="Unique 2D (side-view) multiplayer action game."
arch=('x86_64')
url='https://github.com/Soldat/soldat'
license=('MIT')
depends=('sdl2' 'openal' 'freetype2' 'physfs' 'libGameNetworkingSockets.so')
makedepends=('make' 'fpc')
#optdepends=()
provides=('soldat')
# conflicts=()
source=("$pkgname::git+https://github.com/Soldat/soldat.git" "soldat-base::git+https://github.com/Soldat/base.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd $pkgname
  # git describe --tags | sed 's/^v//;s/-/./g'
  echo "1.18.$(git rev-list --count master).g$(git describe --always)"
}

package() {
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

  # copy files
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm 655 "server/build/soldatserver_x64" -t "$pkgdir/$installdir/$pkgname";
  install -Dm 655 "client/build/soldat_x64" -t "$pkgdir/$installdir/$pkgname";
  install -Dm 644 "client/build/libstb.so" -t "$pkgdir/$installdir/$pkgname";
  install -Dm 644 "$srcdir/soldat-base/soldat.smod" -t "$pkgdir/$installdir/$pkgname";
  install -Dm 644 "$srcdir/soldat-base/client/play-regular.ttf" -t "$pkgdir/$installdir/$pkgname";

  # create bins
  cat <<EOF > soldat
#!/usr/bin/env sh
$installdir/$pkgname/soldat_x64 -fs_portable 0 \$@
EOF

  # HACK: fs_portable doesnt work on the server =/
  cat <<EOF > soldatserver
#!/usr/bin/env sh
$installdir/$pkgname/soldatserver_x64 -fs_userpath ~/.local/share/Soldat/Soldat \$@
EOF
  install -Dm 655 "soldat" -t "$pkgdir/usr/bin";
  install -Dm 655 "soldatserver" -t "$pkgdir/usr/bin";
}
