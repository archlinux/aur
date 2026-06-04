# Maintainer: dbas.so <d dot bass05 at proton dot me>
pkgname=beyondallreason
electronver=42
pkgver=1.2988.0
electronver=42
pkgrel=1
pkgdesc="The latest release of BYAR-Chobby, the launcher for Beyond All Reason - An open source RTS game built on top of the Spring RTS Engine"
arch=(x86_64)
url="https://beyondallreason.info"
license=('GPL')
depends=(electron${electronver})
makedepends=(nodejs-lts-jod git)
conflicts=(beyondallreason-appimage)
source=("git+https://github.com/beyond-all-reason/BYAR-Chobby.git#tag=v$pkgver"
  "git+https://github.com/beyond-all-reason/spring-launcher.git#commit=2c0a6e17b50ab04ea592c53963c571e5ccb071ba"
  "run.sh" "beyondallreason.desktop")

b2sums=('e7bf39475b03da7bb4611b6ac716dbfbcf514afdcad0349ba8e17f456627087bb7bfe8d67f5eeb31eb039bbf79bc74d20bcf170e7b49b6a41a1889bebfe7175a'
        '8bf68c86c60a72c06c3bb042dc21a4a66bb389a912579998587df8e5213fa2eef2172a506d91bfaaf86b57d8d37b3cec85825c1581ec14d4bc7b55ac2ca44969'
        '94e8b50e99029ed1d673e5a76ad99dcfe5f33412201a35b39fb4698571e4671d6ec1ec4948fe0eecd7eff346836784d86a9acd576a30f47e9b631aa407d6c69f'
        '29bad1442d12fe970722e2d4ab6f4daea47b8d3014b1d4dc11eab5b790329c434f7b109a21a396138313a10cd36821f9c711515ed4666466c71e7f0b90ff65c5')

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

  npm ci --ignore-scripts
}

build() {
  cd "spring-launcher"

  electronDist="/usr/lib/electron${electronver}"
  electronVersion=$(<"${electronDist}/version")

  npx electron-builder -- -c.electronDist=$electronDist -c.electronVersion=$electronVer --linux --dir
}

package() {
  cd "./spring-launcher"

  mkdir -p $pkgdir/{usr,opt/beyondallreason}

  cp -a dist/linux*unpacked/** $pkgdir/opt/beyondallreason

  install -Dm644 $srcdir/app/chobby/dist_cfg/config.json $pkgdir/opt/beyondallreason

  install -Dm755 $srcdir/run.sh $pkgdir/usr/bin/beyondallreason

  install -Dm644 $srcdir/app/chobby/dist_cfg/build/icon.png $pkgdir/usr/share/icons/hicolor/128x128/apps/beyondallreason.png
  install -Dm644 $srcdir/beyondallreason.desktop $pkgdir/usr/share/applications/beyondallreason.desktop
}
