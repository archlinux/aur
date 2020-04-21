# Maintainer: Michał Lisowski <lisu@riseup.net>

pkgname=maszyna-git
pkgver=r1277.c45081b2
pkgrel=2
pkgdesc="Polish train simulator"
arch=('x86_64')
url="https://eu07.pl/"
license=('MPL2' 'custom')
makedepends=('cmake' 'git' 'glfw' 'glm' 'libserialport' 'p7zip')
source=("$pkgname"::'git://github.com/eu07/maszyna.git'
        "http://stuff.eu07.pl/MaSzyna1908.zip"
        "http://stuff.eu07.pl/1908HF.zip"
        "https://eu07.pl/theme/Maszyna/dokumentacja/inne/readme_pliki/licencja.html")
noextract=('MaSzyna1908.zip'
           '1908HF.zip')
md5sums=('SKIP'
         '1e33a4155c4dfeabfe8a72aaab6406be'
         '70178c340fc236217343fe8ddcb63114'
         'fdbde83abd66899b540800c3d4b5f0a2')

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
  install -D -m755 build/bin/eu07_$(date +'%y%m%d') "${pkgdir}/opt/maszyna/eu07"
  7z x "${srcdir}/MaSzyna1908.zip" -o"${pkgdir}/opt/maszyna" -y
  7z x "${srcdir}/1908HF.zip" -o"${pkgdir}/opt/maszyna" -y
  install -Dm644 licencja.html "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
