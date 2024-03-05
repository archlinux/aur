# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Konsonanz <maximilian.lehmann@protonmail.com>

## WIP

pkgname=gpgfrontend
pkgver=2.1.2
pkgrel=1
pkgdesc="OpenPGP crypto tool and gui frontend for modern GnuPG"
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
  'ncurses'
  'qt6-5compat'
  'qt6-base'
)
makedepends=(
  'boost'
  'chrpath'
  'cmake'
  'git'
  'qt6-tools'
)
_commit=f00c1725a247ea12760396ae5184ab17c7681f62  # tags/v2.1.2^0
source=("git+https://github.com/saturneric/GpgFrontend#commit=${_commit}"
        'git+https://github.com/gpg/gpgme.git'
        'git+https://github.com/gpg/libassuan.git'
        'git+https://github.com/gpg/libgpg-error.git'
        'git+https://github.com/nlohmann/json.git'
        'git+https://github.com/bricke/Qt-AES.git'
        'git+https://github.com/libarchive/libarchive.git'
        'git+https://github.com/hyperrealm/libconfig.git'
        'git+https://github.com/gabime/spdlog.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd GpgFrontend
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd GpgFrontend
  git submodule init
  git config submodule.third_party/gpgme.url "$srcdir/gpgme"
  git config submodule.third_party/libassuan.url "$srcdir/libassuan"
  git config submodule.third_party/libgpg-error.url "$srcdir/libgpg-error"
  git config submodule.third_party/json.url "$srcdir/json"
  git config submodule.third_party/Qt-AES.url "$srcdir/Qt-AES"
  git config submodule.third_party/libarchive.url "$srcdir/libarchive"
  git config submodule.third_party/libconfig.url "$srcdir/libconfig"
  git config submodule.third_party/spdlog.url "$srcdir/spdlog"
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

  install -m755 build/src/module/libgpgfrontend_module.so -t "$pkgdir/usr/lib/"
  install -m755 build/src/module/integrated/gnupg_info_gathering_module/libgpgfrontend_integrated_module_gnupg_info_gathering.so -t "$pkgdir/usr/lib/"
  install -m755 build/src/module/integrated/version_checking_module/libgpgfrontend_integrated_module_version_checking.so -t "$pkgdir/usr/lib/"
  install -m755 build/src/pinentry/libgpgfrontend_pinentry.so -t "$pkgdir/usr/lib/"
  install -m755 build/src/test/libgpgfrontend_test.so -t "$pkgdir/usr/lib/"
  install -m755 build/third_party/mimalloc/libmimalloc-secure.{so,so.2.1} -t "$pkgdir/usr/lib/"
  ln -s /usr/lib/libmimalloc-secure.so.2.1 "$pkgdir/usr/lib/libmimalloc-secure.so.2"

  # Remove insecure RUNPATH pointing to build dir
  chrpath --delete "$pkgdir"/usr/lib/*.so
  chrpath --delete "$pkgdir"/usr/lib/libmimalloc-secure.so.2.1
}
