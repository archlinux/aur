# Maintainer:  Tim Schumacher <timschumi@gmx.de>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>

pkgname=gitahead-git
pkgver=2.6.3.r91.g81df5b4
pkgrel=1
pkgdesc="Graphical Git client"
url="https://gitahead.github.io/gitahead.com/"
arch=(x86_64)
license=(MIT)
depends=(qt5-base cmark libssh2 libsecret)
makedepends=(git cmake ninja qt5-tools qt5-translations libgnome-keyring)
optdepends=('libgnome-keyring: for GNOME Keyring for auth credentials'
            'qt5-translations: translations '
            'git-lfs: git-lfs support')
provides=(gitahead)
conflicts=(gitahead)
source=("git+https://github.com/gitahead/gitahead.git"
        "Gittyup-libgit2::git+https://github.com/stinb/libgit2.git"
        "git+https://github.com/git/git.git"
        "git+https://github.com/hunspell/hunspell.git"
        'gitahead.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0499fdab43ca14cfbab2ad035c893f6ec19303bd6872c7ca6f46cb81a3883551')

pkgver() {
  cd "${srcdir}/gitahead"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/gitahead"

  git submodule init
  git config submodule.dep/libgit2/libgit2.url "${srcdir}/Gittyup-libgit2"
  git config submodule.dep/git/git.url "${srcdir}/git"
  git config submodule.dep/hunspell/hunspell.url "${srcdir}/hunspell"
  git config submodule.dep/openssl/openssl.update none
  git config submodule.dep/cmark/cmark.update none
  git config submodule.dep/libssh2/libssh2.update none
  git -c protocol.file.allow=always submodule update

  install -d build
}

build() {
  cd "${srcdir}/gitahead/build"
  cmake -G Ninja .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr/lib/gitahead \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man \
    -DENABLE_REPRODUCIBLE_BUILDS=ON \
    -DBUILD_SHARED_LIBS=OFF

  ninja
}

package() {
  cd "${srcdir}/gitahead"
  DESTDIR="${pkgdir}" ninja -C build install

  rm -rf "${pkgdir}/usr/lib/gitahead/"*.so.*
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/gitahead/GitAhead "${pkgdir}/usr/bin/gitahead"

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/gitahead.desktop" "${pkgdir}/usr/share/applications/gitahead.desktop"

  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/GitAhead.iconset/icon_16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/gitahead.png"
  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/GitAhead.iconset/icon_32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gitahead.png"
  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/GitAhead.iconset/icon_64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gitahead.png"
  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/GitAhead.iconset/icon_128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gitahead.png"
  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/GitAhead.iconset/icon_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gitahead.png"
  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/GitAhead.iconset/icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gitahead.png"
}
