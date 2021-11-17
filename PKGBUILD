# Maintainer:  Tim Schumacher <timschumi@gmx.de>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>

pkgname=gittyup-git
pkgver=r533.73bf3db
pkgrel=1
pkgdesc="Graphical Git client"
url="https://github.com/Murmele/Gittyup"
arch=(x86_64)
license=(MIT)
depends=(qt5-base cmark libssh2 libsecret)
makedepends=(git cmake ninja qt5-tools qt5-translations libgnome-keyring)
optdepends=('libgnome-keyring: for GNOME Keyring for auth credentials'
            'qt5-translations: translations '
            'git-lfs: git-lfs support')
provides=(gittyup)
conflicts=(gittyup gitahead)
source=("${pkgname%-git}::git+https://github.com/Murmele/Gittyup.git"
        "git+https://github.com/stinb/libgit2.git"
        "git+https://github.com/git/git.git"
        "git+https://github.com/libssh2/libssh2.git"
        "git+https://github.com/hunspell/hunspell.git"
        'gittyup.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '537674eec14d36761691e7ab803ceed47107c60f34cfe556f708284ebda9a96f')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"

  git submodule init
  git config 'submodule.dep/libgit2/libgit2.url' "${srcdir}/libgit2"
  git config 'submodule.dep/git/git.url' "${srcdir}/git"
  git config 'submodule.dep/libssh2/libssh2.url' "${srcdir}/libssh2"
  git config 'submodule.dep/hunspell/hunspell.url' "${srcdir}/hunspell"
  git -c submodule.dep/openssl/openssl.update=none -c submodule.dep/cmark/cmark.update=none submodule update

  install -d build
}

build() {
  cd "${srcdir}/${pkgname%-git}/build"
  cmake -G Ninja .. -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr/lib/gitahead \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man \
    -DENABLE_REPRODUCIBLE_BUILDS=ON \
    -DBUILD_SHARED_LIBS=OFF

  ninja
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  DESTDIR="${pkgdir}" ninja -C build install

  rm -rf "${pkgdir}/usr/lib/gitahead/"*.so.*
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/gitahead/Gittyup "${pkgdir}/usr/bin/gittyup"

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/gittyup.desktop" "${pkgdir}/usr/share/applications/gittyup.desktop"

  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/Gittyup.iconset/icon_16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/gitahead.png"
  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/Gittyup.iconset/icon_32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/gitahead.png"
  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/Gittyup.iconset/icon_64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gitahead.png"
  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/Gittyup.iconset/icon_128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/gitahead.png"
  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/Gittyup.iconset/icon_256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gitahead.png"
  install -Dm644 "${pkgdir}/usr/lib/gitahead/Resources/Gittyup.iconset/icon_512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/gitahead.png"

  rm -rf "${pkgdir}/usr/share/man" # libssh2 man pages
}
