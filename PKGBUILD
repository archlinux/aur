# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=memebox
_pkgname=meme-box
pkgver=2022.1.1
_pkgver="${pkgver//_/-}"
pkgrel=5
pkgdesc="Manage and trigger media in OBS as a browser source"
arch=('any')
url="https://github.com/negue/meme-box"
license=('AGPL-3.0-or-later')
depends=('electron')
makedepends=('jq' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
b2sums=('707e4104a583a927d286845518bf56a7cee6b5cf6606f2611704ee960d9e9dab7be1614777a48d6e9f7ed14c41cc5e7d89a51d4446022b10a5b167099d9c9d7a'
        '9a825fe91ed8dc7d8a55e6b72aa84ce498e62096f9fdd6c14710d7a173d9ea722a2aa3883e5e0afdb32957b95e15f54956785d177252862fe0a2d06ec940702f'
        '52807ca9528ed2405c5c4f2da8cfec73d99e4023908934a99c7d12b7a921e28fe79de02176a1e43a52d6c6c1376657b0558cae76bdb43b327e7345cc7cae95af')

prepare() {
  cd "$_pkgname-$_pkgver"

  # Remove unneeded postinstall steps
  jq 'del(.scripts.postinstall)' package.json > package.json.tmp
  mv package.json.tmp package.json

  # Install dependencies
  npm install --legacy-peer-deps --cache "$srcdir"/npm-cache
}

build() {
  cd "$_pkgname-$_pkgver"

  # Enable legacy OpenSSL provider
  export NODE_OPTIONS=--openssl-legacy-provider

  # Avoid any interactive prompts during build
  export npm_config_yes=true

  # Build only Electron parts of the app
  npm run electron:build_app
  npm run electron:build_0compile
  npm run electron:build_1combineJs

  # Build the Electron package
  npm exec -- electron-builder --linux --x64 --dir -c.electronDist=/usr/lib/electron -c.electronVersion=$(< /usr/lib/electron/version) --publish=never
}

package() {
  cd "$_pkgname-$_pkgver"
  install -dm 755 "$pkgdir"/usr/lib/"$pkgname"
  install -Dm 644 release-electron/linux-unpacked/resources/app.asar "$pkgdir"/usr/lib/"$pkgname"/"$pkgname".asar
  install -Dm 755 "$srcdir/$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
  install -Dm 644 "$srcdir/$pkgname".desktop -t "$pkgdir"/usr/share/applications

  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/"$pkgname"
  install -Dm 644 LICENSE.md -t "$pkgdir"/usr/share/licenses/"$pkgname"

  install -Dm 644 assets/memebox-optimized.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/"$pkgname".svg

  for _i in 72 96 128 144 152 192 384 512; do
    install -Dm 644 dist/assets/icons/icon-"${_i}x${_i}".png "$pkgdir"/usr/share/icons/hicolor/"${_i}x${_i}"/apps/"$pkgname".png
  done
}
