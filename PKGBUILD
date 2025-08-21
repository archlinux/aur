# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>

pkgname=gittyup-git
pkgver=1.3.0.r435.gfa59b663
pkgrel=1
pkgdesc="Graphical Git client (GitAhead fork)"
url="https://github.com/Murmele/Gittyup"
arch=(x86_64)
license=(MIT)
depends=(qt6-base hunspell lua cmark pcre libssh2

         # namcap implict depends
         hicolor-icon-theme glibc gcc-libs zlib openssl libglvnd krb5
)
makedepends=(git cmake ninja qt6-tools qt6-translations) #libgit2 libgnome-keyring
optdepends=('git-lfs: git-lfs support'
            'libgnome-keyring: for GNOME Keyring for auth credentials'
            'qt6-translations: translations')
provides=(gittyup)
conflicts=(gittyup)
options=(!lto)
source=("git+https://github.com/Murmele/Gittyup.git"
        "gittyup-libgit2::git+https://github.com/Murmele/libgit2.git"
        "git+https://github.com/kuba--/zip.git"
        "git+https://github.com/ScintillaOrg/lexilla.git"
        "git+https://github.com/orbitalquark/scintillua.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "Gittyup"
  git describe --long --tags --exclude latest --exclude development | sed 's/^gittyup_v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "Gittyup"
  git submodule init
  git config submodule.dep/libgit2/libgit2.url "${srcdir}/gittyup-libgit2"
  git config submodule.dep/git/git.update none
  git config submodule.dep/cmark/cmark.update none
  git config submodule.dep/libssh2/libssh2.update none
  git config submodule.dep/openssl/openssl.update none
  git config submodule.dep/hunspell/hunspell.update none
  git config submodule.test/dep/zip.url "${srcdir}/zip"
  git config submodule.dep/scintilla/lexilla.url "${srcdir}/lexilla"
  git config submodule.dep/scintilla/scintillua.url "${srcdir}/scintillua"
  git config submodule.dep/lua/lua.update none
  git -c protocol.file.allow=always submodule update
}

build() {
  # Build type None result in "PANIC: unprotected error in call to Lua API (cannot open /build/gittyup-git/src/Gittyup/conf/System.lua: No such file or directory)" then coredump

  local _flags=(
    -DCMAKE_INSTALL_PREFIX=/usr/lib/gittyup
    -DCMAKE_INSTALL_DATADIR=/usr/lib
    -DCMAKE_INSTALL_BINDIR=/usr/lib/gittyup
    -DENABLE_REPRODUCIBLE_BUILDS=ON
    -DENABLE_UPDATE_OVER_GUI=OFF
    -DGENERATE_APPDATA=ON
    -DBUILD_SHARED_LIBS=OFF
    -DUSE_SYSTEM_CMARK=ON
    -DUSE_SYSTEM_GIT=ON
    -DUSE_SYSTEM_HUNSPELL=ON
    -DUSE_SYSTEM_LIBSSH2=ON
    -DUSE_SYSTEM_LUA=ON
    -DUSE_SYSTEM_OPENSSL=ON
    -DLUA_MODULES_PATH=/usr/lib/
    -DUSE_SYSTEM_QT=ON
  )

  cmake -B build -S "Gittyup" -G Ninja -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  ninja -C build
}

check() {
  #ninja -C build check
  true
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  cd "Gittyup"
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

  # Remove bundled zip
  rm -rf "${pkgdir}/usr/lib/gittyup/"*.so.*
  rm -rf "${pkgdir}/usr/lib/gittyup/include"
  rm -rf "${pkgdir}/usr/lib/gittyup/lib"
}
