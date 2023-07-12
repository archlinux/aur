# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>

pkgname=gittyup-git
pkgver=1.3.0.r26.g34625fb
pkgrel=3
pkgdesc="Graphical Git client (GitAhead fork)"
url="https://github.com/Murmele/Gittyup"
arch=(x86_64)
license=(MIT)
depends=(qt5-base hunspell lua cmark pcre libssh2)
makedepends=(git cmake ninja qt5-tools qt5-translations ) #libgit2 libgnome-keyring
optdepends=('git-lfs: git-lfs support'
            'libgnome-keyring: for GNOME Keyring for auth credentials'
            'qt5-translations: translations')
provides=(gittyup)
conflicts=(gittyup)
source=("git+https://github.com/Murmele/Gittyup.git"
        "stinb-libgit2::git+https://github.com/stinb/libgit2.git"
        "git+https://github.com/kuba--/zip.git"
        "git+https://github.com/ScintillaOrg/lexilla.git"
        "git+https://github.com/orbitalquark/scintillua.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/Gittyup"
  git describe --long --tags --exclude latest --exclude development | sed 's/^gittyup_v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/Gittyup"

  git submodule init
  git config submodule.dep/libgit2/libgit2.url "${srcdir}/stinb-libgit2"
  git config submodule.dep/git/git.update none
  git config submodule.dep/cmark/cmark.update none
  git config submodule.dep/libssh2/libssh2.update none
  git config submodule.dep/openssl/openssl.update none
  git config submodule.dep/hunspell/hunspell.update none
  git config submodule.test/dep/zip.url "${srcdir}/zip"
  git config submodule.dep/scintilla/lexilla.url "${srcdir}/lexilla"
  git config submodule.dep/scintilla/scintillua.url "${srcdir}/scintillua"
  git -c protocol.file.allow=always submodule update

  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/Gittyup/build"
  cmake -G Ninja .. -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr/lib/gittyup \
    -DCMAKE_INSTALL_DATADIR=/usr/lib \
    -DCMAKE_INSTALL_BINDIR=/usr/lib/gittyup \
    -DENABLE_REPRODUCIBLE_BUILDS=ON \
    -DENABLE_UPDATE_OVER_GUI=OFF \
    -DGENERATE_APPDATA=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DUSE_SYSTEM_CMARK=ON \
    -DUSE_SYSTEM_GIT=ON \
    -DUSE_SYSTEM_HUNSPELL=ON \
    -DUSE_SYSTEM_LIBSSH2=ON \
    -DUSE_SYSTEM_LUA=ON \
    -DUSE_SYSTEM_OPENSSL=ON \
    -DUSE_SYSTEM_QT=ON

  ninja
}

check() {
  cd "${srcdir}/Gittyup"
  ninja -C build check
}

package() {
  cd "${srcdir}/Gittyup"
  DESTDIR="${pkgdir}" ninja -C build install

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/gittyup/gittyup "${pkgdir}/usr/bin/gittyup"
  ln -s /usr/lib/gittyup/gittyup "${pkgdir}/usr/bin/Gittyup"

  #mv "${pkgdir}"/usr/lib/Gittyup/*  "${pkgdir}"/usr/lib/gittyup/
  #rmdir "${pkgdir}"/usr/lib/Gittyup

  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 rsrc/linux/com.github.Murmele.Gittyup.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 rsrc/linux/com.github.Murmele.Gittyup.appdata.xml.in "${pkgdir}/usr/share/metainfo/com.github.Murmele.Gittyup.appdata.xml"

  install -Dm644 rsrc/Gittyup.iconset/gittyup_logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gittyup.svg"
  for s in 16x16 32x32 64x64 128x128 256x256 512x512; do
    install -Dm0644 "rsrc/Gittyup.iconset/icon_$s.png" "${pkgdir}/usr/share/icons/hicolor/$s/apps/$pkgname.png"
  done

  rm -rf "${pkgdir}/usr/lib/gittyup/"*.so.*
  rm -rf "${pkgdir}/usr/lib/gittyup/include"
  rm -rf "${pkgdir}/usr/lib/gittyup/lib"
}
