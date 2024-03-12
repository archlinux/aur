# Maintainer: Popolon <popolon@popolon.org>
# Contributor: Paulequilibrio 
# Contributor: JKA Network <contacto@jkanetwork.com>
# Contributor: Todor Imreorov for github <blurymind@gmail.com>

pkgname=gdevelop
_pkgname=GDevelop
pkgver=5.3.194
pkgrel=1
pkgdesc="A full featured, open source game development software, allowing to create HTML5 and native games without knowing a programming language. All the game logic is made thanks to an intuitive and powerful event based system."
arch=('x86_64' 'riscv64')
url=http://www.compilgames.net
license=('GPL' 'MIT' 'zlib/png')
groups=()
provides=('gdevelop')
makedepends=('rsync' 'cmake' 'git' 'curl')
depends=('gcc' 'wxwidgets-gtk3' 'openal' 'p7zip' 'glew' 'libsndfile' 'systemd' 'libjpeg-turbo' 'desktop-file-utils' 'gtk-update-icon-cache' 'emscripten')
source=("https://github.com/4ian/GDevelop/archive/refs/tags/v${pkgver}.tar.gz"
        'gdevelop.desktop')
sha256sums=('2391dfa0315d2ded50d0752b58082fec0f9cffcd50382330e9a3018d72801c54'
            '81de9743eb30435302e429263b9bdcf6c3a8b36c52e29b87d9cd2d69be07b9e2')

build() {
  cd "${srcdir}"/${_pkgname}-${pkgver}
  cd Binaries
  if [ ! -e build ]; then
    mkdir build
  fi
  cd build
  cmake ../.. -DCMAKE_INSTALL_PREFIX=/usr
  #Build the whole project
  make
}

package() {
  cd "$srcdir"/GDevelop-$pkgver
  cd Binaries/build
  make preinstall DESTDIR="$pkgdir"
  cmake -P cmake_install.cmake DESTDIR="$pkgdir"
  install -Dm755 ../Output/Release_Linux/libGDCore.so "${pkgdir}/usr//lib/libGDCore.so"
  install -Dm755 ../Output/Release_Linux/JsPlatform/libGDJS.so "${pkgdir}/usr/lib/libGDJS.so"
  cd "$srcdir/${_pkgname}-$pkgver/GDevelop.js"
  npm install  --user root --prefix "${pkgdir}/usr"
  cd "$srcdir/${_pkgname}-$pkgver/newIDE/app"
  npm install  --user root --prefix "${pkgdir}/usr"

  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m 644 "${srcdir}/${_pkgname}-${pkgver}/Core/docs/images/glogo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
