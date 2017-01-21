# Maintainer: djazz

pkgname=webjcs-git
_gitname=webjcs
pkgver=2017.01.21
pkgrel=1
pkgdesc="A level editor for Jazz Jackrabbit 2."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/daniel-j/webjcs"
provides=('webjcs')
conflicts=('webjcs')
license=('MIT')
depends=('electron')
makedepends=('npm' 'curl' 'make')
optdepends=('emscripten: for tracker music file support (makedepend)')
install="webjcs.install"
source=(webjcs.desktop webjcs.mime.xml launch.sh "git+https://github.com/daniel-j/$_gitname.git")
sha1sums=(
  '2119a3c3242425973c2770706169738ab88885d0'
  '6fefe6635686400121fb982550e3964a1b12ea00'
  '7d8c099cd6237dc0a27c142bb630e3660c462cab'
  'SKIP'
)

pkgver() {
   cd "$_gitname"
   git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${_gitname}"
  npm install --no-optional
  NO_WEB=1 gulp build -p
  which emcc > /dev/null 2>&1 && make libopenmpt || echo 'emscripten is not installed, skipping libopenmpt'
  make asar
}

package() {
  install -d "$pkgdir/usr/lib/${_gitname}"
  install "${srcdir}/${_gitname}/build/app.asar" "$pkgdir/usr/lib/${_gitname}/app.asar"

  # Desktop entry
  install -d "${pkgdir}/usr/share/applications"
  install "${srcdir}/webjcs.desktop" "${pkgdir}/usr/share/applications/${_gitname}.desktop"

  # Main binary
  install -d "${pkgdir}/usr/bin"
  install "${srcdir}/launch.sh" "${pkgdir}/usr/bin/${_gitname}"

  # Icon
  install -d "${pkgdir}/usr/share/pixmaps"
  install "${srcdir}/${_gitname}/app/media/icons/JCS.png" "${pkgdir}/usr/share/pixmaps/${_gitname}.png"

  # Register mimetypes
  install -d "${pkgdir}/usr/share/mime/packages/"
  install "${srcdir}/webjcs.mime.xml" "${pkgdir}/usr/share/mime/packages/${_gitname}.xml"

  # License
  install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
