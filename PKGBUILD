# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>

pkgname=gittyup-git
pkgver=1.0.0.r187.g54d9e5e
pkgrel=1
pkgdesc="Graphical Git client (GitAhead fork)"
url="https://github.com/Murmele/Gittyup"
arch=(x86_64)
license=(MIT)
depends=(qt5-base cmark libsecret hunspell)
makedepends=(git cmake ninja qt5-tools qt5-translations libgnome-keyring libssh2) #libssh2 detected but not used
optdepends=('git-lfs: git-lfs support'
            'libgnome-keyring: for GNOME Keyring for auth credentials'
            'qt5-translations: translations')
provides=(gittyup)
conflicts=(gittyup)
source=("${pkgname%-git}::git+https://github.com/Murmele/Gittyup.git"
        "git+https://github.com/stinb/libgit2.git"
        "git+https://github.com/git/git.git"
        "git+https://github.com/libssh2/libssh2.git"
        "git+https://github.com/kuba--/zip.git"
        'gittyup.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a07943687afee5f3664219373b60ae54eaa207414646181df107893407119462')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags --exclude latest | sed 's/^gittyup_v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"

  git submodule init
  git config 'submodule.dep/libgit2/libgit2.url' "${srcdir}/libgit2"
  git config 'submodule.dep/git/git.url' "${srcdir}/git"
  git config 'submodule.dep/libssh2/libssh2.url' "${srcdir}/libssh2"
  git config 'submodule.test/dep/zip.url' "${srcdir}/zip"
  git -c submodule.dep/openssl/openssl.update=none -c submodule.dep/cmark/cmark.update=none -c submodule.dep/hunspell/hunspell.update=none submodule update

  install -d build
}

build() {
  cd "${srcdir}/${pkgname%-git}/build"
  cmake -G Ninja .. -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr/lib/gittyup \
    -DENABLE_REPRODUCIBLE_BUILDS=ON \
    -DBUILD_SHARED_LIBS=OFF

  ninja
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  DESTDIR="${pkgdir}" ninja -C build install

  rm -rf "${pkgdir}/usr/lib/gittyup/"*.so.*
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/gittyup/Gittyup "${pkgdir}/usr/bin/gittyup"

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ../gittyup.desktop "${pkgdir}/usr/share/applications/gittyup.desktop"

  install -Dm644 rsrc/Gittyup.iconset/gittyup_logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gittyup.svg"
  for s in 16x16 32x32 64x64 128x128 256x256 512x512; do
    install -Dm0644 "rsrc/Gittyup.iconset/icon_$s.png" "icons/hicolor/$s/apps/$pkgname.png"
  done

  rm -rf "${pkgdir}/usr/lib/gittyup/share" # libssh2 doc man pages
}
