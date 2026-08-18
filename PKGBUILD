# Maintainer: dbas.so <d dot bass05 at proton dot me>
pkgname=beyondallreason-git
electronver=42
pkgver=r4620.e0217bd
electronver=42
pkgrel=1
pkgdesc="The latest release of BYAR-Chobby, the launcher for Beyond All Reason - An open source RTS game built on top of the Spring RTS Engine"
arch=(x86_64)
url="https://beyondallreason.info"
license=('GPL-2.0-or-later' 'CC-BY-SA-4.0' 'CC-BY-NC-ND-4.0')
depends=(electron${electronver} gtk3 sdl2 zlib bash)
makedepends=(nodejs git jq npm)
conflicts=(beyondallreason-appimage)
source=("git+https://github.com/beyond-all-reason/BYAR-Chobby.git"
  "git+https://github.com/beyond-all-reason/spring-launcher.git"
  "run.sh" "beyondallreason.desktop")

provides=(beyondallreason)
conflicts=(beyondallreason)

b2sums=('SKIP'
        'SKIP'
        '2b38725afa65f4e54606df379fa0184345611c76336c205db2fd1c5ab8f6fe42e10c8a002599325f790207f52de0ba9bd5022f813d7a436f6b2378af9d33d638'
        '29bad1442d12fe970722e2d4ab6f4daea47b8d3014b1d4dc11eab5b790329c434f7b109a21a396138313a10cd36821f9c711515ed4666466c71e7f0b90ff65c5')

pkgver() {
  cd "BYAR-Chobby"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "BYAR-Chobby"

  mkdir -p $srcdir/app/chobby $srcdir/src

  export PACKAGE_VERSION=$(echo "1.$(git rev-list --count HEAD).0")
  export GITHUB_REPOSITORY="beyond-all-reason/BYAR-Chobby"

  cp -r dist_cfg $srcdir/app/chobby
  cp -r build $srcdir/app/chobby

  cd "../spring-launcher"

  cp -r $srcdir/app/chobby/dist_cfg/* $srcdir/src/
  for dir in bin files build; do
          mkdir -p $dir
          if [ -d $srcdir/src/$dir/ ]; then
            mv $srcdir/src/$dir/* $dir/
            rm -rf $srcdir/src/$dir
          fi
        done

  echo "Making build for version: $PACKAGE_VERSION"
  node $srcdir/app/chobby/build/make_package_json.js package.json $srcdir/app/chobby/dist_cfg/config.json $GITHUB_REPOSITORY $PACKAGE_VERSION

  jq '.build.linux.target="dir"' <<<$(<package.json) > package.json
  cat package.json

  npm ci --ignore-scripts --allow-git=all

  sed -i 's|\${process\.resourcesPath}/\.\.||g' src/spring_platform.js
}

build() {
  cd "spring-launcher"

  electronDist="/usr/lib/electron${electronver}"
  electronVersion=$(<"${electronDist}/version")

  npx electron-builder -- -c.electronDist=$electronDist -c.electronVersion=$electronVer --linux --dir
}

package() {
  cd "./spring-launcher"

  mkdir -p $pkgdir/usr/{bin,share/beyondallreason}

  cp -a dist/linux*unpacked/resources/** $pkgdir/usr/share/beyondallreason

  rm -r $pkgdir/usr/share/beyondallreason/app.asar.unpacked/node_modules/7zip-bin/linux/arm*

  install -Dm644 $srcdir/app/chobby/dist_cfg/config.json $pkgdir/usr/share/beyondallreason

  install -Dm755 $srcdir/run.sh $pkgdir/usr/bin/beyondallreason
  install -Dm755 dist/linux*unpacked/bin/pr-downloader $pkgdir/usr/bin/
  
  install -Dm644 $srcdir/app/chobby/dist_cfg/build/icon.png $pkgdir/usr/share/icons/hicolor/128x128/apps/beyondallreason.png
  install -Dm644 $srcdir/beyondallreason.desktop $pkgdir/usr/share/applications/beyondallreason.desktop
}
