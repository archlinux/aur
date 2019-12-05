# Maintainer: Tony Duco <nosduco@gmail.com>
pkgname=safe
_pkgver=0.2.0
pkgver=${_pkgver//-/_}
pkgrel=1
epoch=1
pkgdesc='SAFE - Single App For Everything.'
arch=(x86_64 i686)
url='https://github.com/abstra-llc/safe#readme'
license=(MIT)
depends=(electron)
makedepends=(git npm)
source=("git+https://github.com/abstra-llc/$pkgname#tag=v$_pkgver"
  'safe.desktop'
  'safe.sh')
sha512sums=('SKIP'
            'bffa9e3f504bf37b808822bb8a8faf477aad70b9bb52594ab896649375e0fd1ebe6e42fc07ec261935a140c2554b83ae4d0b05e71905ee4ee693c05c71a0e50c'
            'd8d6086974e144ab70bdbcc4b4c75eec9548f1e9ea3760faedef80bcd09d8ebc2972527b519666df3ecbf2ea027cbd9974959e287e7275264240fd7a0f4b500a')

build() {
  cd $pkgname
  export PATH="$srcdir/$pkgname/node_modules/.bin:$PATH"
  npm install --cache "${srcdir}/npm-cache" 
  electron-builder --linux dir
}

package() {
  cd $pkgname

  # Install linux build
  install -dm 755 "$pkgdir"/usr/lib/$pkgname
  cp -r --no-preserve=ownership --preserve=mode dist/linux-unpacked/resources "$pkgdir"/usr/lib/$pkgname/

  # Icon
  install -Dm 644 "$srcdir"/safe.desktop "$pkgdir"/usr/share/applications/safe.desktop
  install -Dm 644 build/icon.png "$pkgdir"/usr/share/icons/safe.png

  # Run script
  install -Dm 755 "$srcdir"/safe.sh "$pkgdir"/usr/bin/safe
}
