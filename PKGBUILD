# Maintainer: Michał Lisowski <lisu@riseup.net>

_assets_ver=2009

pkgname=maszyna-git
pkgver=r2131.2376aa6f
pkgrel=2
pkgdesc="Polish train simulator"
arch=('x86_64')
url="https://eu07.pl/"
license=('MPL2' 'custom')
makedepends=('asio' 'cmake' 'git' 'glfw' 'glm' 'libserialport' 'openvr' 'p7zip' 'python2-virtualenv')
depends=('glfw' 'libserialport' 'openvr' 'python2' 'wine')
source=("$pkgname"::'git+https://github.com/eu07/maszyna.git'
        "http://stuff.eu07.pl/MaSzyna${_assets_ver}.zip"
        "http://stuff.eu07.pl/${_assets_ver}HF.zip"
        "https://eu07.pl/theme/Maszyna/dokumentacja/inne/readme_pliki/licencja.html"
        "maszyna.sh")
noextract=("MaSzyna${_assets_ver}.zip"
           "${_assets_ver}HF.zip")
md5sums=('SKIP'
         '009a039e320592cf30f11ee07c8237e9'
         'c77ac9dea108545ec5dea76d896f083a'
         'fdbde83abd66899b540800c3d4b5f0a2'
         'a24521953418278dc07571bf3ee75b89')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 build/bin/eu07_2021-01-31 "${pkgdir}/opt/maszyna/eu07"
  install -D -m755 ${srcdir}/maszyna.sh "${pkgdir}/usr/bin/maszyna"
  cp -r shaders "${pkgdir}/opt/maszyna/"
  7z x "${srcdir}/MaSzyna${_assets_ver}.zip" -o"${pkgdir}/opt/maszyna" -y
  7z x "${srcdir}/${_assets_ver}HF.zip" -o"${pkgdir}/opt/maszyna" -y
  install -D -m644 "${srcdir}/licencja.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
