# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=gpgfrontend
pkgver=2.1.3+3+g71b9ea8
pkgrel=1
pkgdesc="An exceptional GUI frontend for the modern GnuPG (gpg)"
arch=('x86_64')
url="https://gpgfrontend.bktus.com"
license=('GPL-3.0-or-later')
depends=(
  'gnupg'
  'gpgme'
  'hicolor-icon-theme'
  'icu'
  'libarchive'
  'libassuan'
  'libconfig'
  'libgpg-error'
  'mimalloc'
  'ncurses'
  'qt6-base'
)
makedepends=(
  'boost'
  'chrpath'
  'cmake'
  'git'
  'qt6-tools'
)
_commit=71b9ea8d3a902d10890ca8d327d8275a0f0f349d  # branch/main
source=("git+https://github.com/saturneric/GpgFrontend#commit=${_commit}"
        'git+https://github.com/bricke/Qt-AES.git'
        'git+https://github.com/gabime/spdlog.git'
        'git+https://github.com/microsoft/mimalloc.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/libarchive/libarchive.git'
        'git+https://github.com/qt/qttranslations.git')
sha256sums=('b1095d1e09482eb1248cad7c092ab2fc8d1960ab414f2239e0d4fad500fd4d0a'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd GpgFrontend
  git describe --tags --abbrev=7 | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd GpgFrontend
  git submodule init
  git config submodule.third_party/qt-aes.url "$srcdir/Qt-AES"
  git config submodule.third_party/spdlog.url "$srcdir/spdlog"
  git config submodule.third_party/mimalloc.url "$srcdir/mimalloc"
  git config submodule.third_party/googletest.url "$srcdir/googletest"
  git config submodule.third_party/libarchive.url "$srcdir/libarchive"
  git config submodule.third_party/qttranslations.url "$srcdir/qttranslations"
  git -c protocol.file.allow=always submodule update

  # /usr/local/ > /usr/
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;
}

build() {
  cmake -B build -S GpgFrontend \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGPGFRONTEND_GENERATE_LINUX_INSTALL_SOFTWARE='ON' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
