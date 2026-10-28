pkgname=emu80-git
_commit=e5cfece
_pkgver=4.0.575
pkgver=${_pkgver}.${_commit}
pkgrel=2
pkgdesc="Emulator for bunch of Soviet PCs. Git version"
arch=('x86_64')
url="https://emu80.org/"
license=("GPL-3.0-or-later")
depends=("qt6-base" "qt6-multimedia")
makedepends=("base-devel")
source=("${pkgname}::git+https://github.com/vpyk/emu80v4.git#commit=${_commit}"
  "shortcut.desktop"
  "fix-application-dir-path.patch")
sha256sums=('SKIP'
  '7206828b1279e8387454da6f31bf74ff7319c89f79a6abc396508a6f263db59b'
  'f8d726db8243972378c0dc2ce7c2bfb047f0c0b0b6532a69234fc3ee6f9b2802')

prepare() {
  cd "${pkgname}"
  patch -Np1 -i "${srcdir}/fix-application-dir-path.patch"
}

build() {
  cd "${pkgname}"
  qmake6 src/Emu80qt.pro
  make
}

package() {
  cd "${pkgname}"
  destination=${pkgdir}/opt/${pkgname}

  install -d -m755 ${destination}
  cp -r dist/* ${destination}
  cp COPYING.txt ${destination}
  cp whatsnew.txt ${destination}
  cp -r doc/* ${destination}

  install -D -m644 "src/qt/icons/emu80.png" "${pkgdir}/usr/share/pixmaps/emu80-git.png"
  install -d -m755 ${destination}
  install -m0755 Emu80qt ${destination}/${pkgname}

  install -d -m755 ${pkgdir}/usr/bin
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/shortcut.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
