# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://github.com/Soldat/soldat
# Upstream: https://github.com/Soldat/soldat

pkgname=('soldat-git')
_installdir='/usr/share/soldat'
pkgver=1.8.0.alpha.initial.3.g6dee4d0
pkgrel=1
pkgdesc="Unique 2D (side-view) multiplayer action game."
arch=('x86_64')
url='https://github.com/Soldat/soldat'
license=('MIT' 'custom:Shareware assets')
depends=('sdl2' 'openal' 'freetype2' 'physfs' 'gamenetworkingsockets')
makedepends=('make' 'fpc' 'zip')
#optdepends=()
provides=('soldat')
# conflicts=()
source=("$pkgname::git+https://github.com/Soldat/soldat.git#branch=develop" "soldat-base::git+https://github.com/Soldat/base.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/[-+]/./g'
  # OLD VERSION BEFORE TAGS
  # echo "1.8.0.$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
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
  install -Dm 655 "server/build/soldatserver_x64" -t "$pkgdir/$_installdir";
  install -Dm 655 "client/build/soldat_x64" -t "$pkgdir/$_installdir";
  install -Dm 644 "client/build/libstb.so" -t "$pkgdir/$_installdir";
  install -Dm 644 "client/media/soldat.ico" -t "$pkgdir/$_installdir";
  install -Dm 644 "$srcdir/soldat-base/soldat.smod" -t "$pkgdir/$_installdir";
  install -Dm 644 "$srcdir/soldat-base/client/play-regular.ttf" -t "$pkgdir/$_installdir";
  install -Dm 655 "soldat" -t "$pkgdir/usr/bin";
  install -Dm 655 "soldatserver" -t "$pkgdir/usr/bin";
  install -Dm 644 "soldat.desktop" -t "$pkgdir/usr/share/applications";
}
