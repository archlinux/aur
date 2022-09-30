# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=memebox
_pkgname=meme-box
pkgver=2022.1_rc1
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Manage and trigger media in OBS as a browser source"
arch=('any')
url="https://github.com/negue/meme-box"
license=('AGPL3')
depends=('electron20')
makedepends=('jq' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh")
b2sums=('6da59ee2bbfe2662da61b6f6785a2c8744d299e0361197cd3342a53eac830c562b527fea9252b99a5593639869797e8e5c0aec811ec9ffd71e46eb6d5b47f299'
        '9a825fe91ed8dc7d8a55e6b72aa84ce498e62096f9fdd6c14710d7a173d9ea722a2aa3883e5e0afdb32957b95e15f54956785d177252862fe0a2d06ec940702f'
        '3a92fad92d82110ace6e77f4486d6336d5c25a7e309990588d687956e05a07446cf7058e3e4211cc44370d2548f14568ec6ecc2fb57253763c6285cbe0b2b5bf')

prepare() {
  cd "$_pkgname-$_pkgver"

  # Remove unneeded postinstall steps
  jq 'del(.scripts.postinstall)' package.json > package.json.tmp
  mv package.json.tmp package.json

  # Install deps and patch `ttypescript` version
  npm install --legacy-peer-deps --cache "$srcdir"/npm-cache
  npm install --legacy-peer-deps --cache "$srcdir"/npm-cache --save ttypescript@1.5.13
}

build() {
  cd "$_pkgname-$_pkgver"

  # Avoid any interactive prompts during build
  export npm_config_yes=true

  # Build only Electron parts of the app
  npm run electron:build_app
  npm run electron:build_0compile
  npm run electron:build_1combineJs

  # Build the Electron package
  npm exec -- electron-builder --linux --x64 --dir -c.electronDist=/usr/lib/electron20 -c.electronVersion=$(< /usr/lib/electron20/version) --publish=never
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
