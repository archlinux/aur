# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Konsonanz <maximilian.lehmann@protonmail.com>

## WIP
# Currently fails to build with Qt 6.7

pkgname=gpgfrontend
pkgver=2.1.3
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
  'qt5-base'
)
makedepends=(
  'boost'
  'chrpath'
  'cmake'
  'git'
  'qt5-tools'
)
source=("git+https://github.com/saturneric/GpgFrontend#tag=v$pkgver"
        'git+https://github.com/bricke/Qt-AES.git'
        'git+https://github.com/gabime/spdlog.git'
        'git+https://github.com/microsoft/mimalloc.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/libarchive/libarchive.git'
        'git+https://github.com/qt/qttranslations.git')
sha256sums=('529e48fbe251aed122f2b326074df66570ae9bafe381bc0cf5a7b26a1d15b2a2'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
    -DGPGFRONTEND_QT5_BUILD='ON' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

#  install -m755 build/src/module/libgpgfrontend_module.so -t "$pkgdir/usr/lib/"
#  install -m755 build/src/module/integrated/gnupg_info_gathering_module/libgpgfrontend_integrated_module_gnupg_info_gathering.so -t "$pkgdir/usr/lib/"
#  install -m755 build/src/module/integrated/version_checking_module/libgpgfrontend_integrated_module_version_checking.so -t "$pkgdir/usr/lib/"
#  install -m755 build/src/pinentry/libgpgfrontend_pinentry.so -t "$pkgdir/usr/lib/"
#  install -m755 build/src/test/libgpgfrontend_test.so -t "$pkgdir/usr/lib/"
#  install -m755 build/third_party/mimalloc/libmimalloc-secure.{so,so.2.1} -t "$pkgdir/usr/lib/"
#  ln -s /usr/lib/libmimalloc-secure.so.2.1 "$pkgdir/usr/lib/libmimalloc-secure.so.2"

#  # Remove insecure RUNPATH pointing to build dir
#  chrpath --delete "$pkgdir"/usr/lib/*.so
#  chrpath --delete "$pkgdir"/usr/lib/libmimalloc-secure.so.2.1
}
