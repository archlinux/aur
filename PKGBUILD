# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>
# Contributor: Angelo Theodorou <encelo@gmail.com>

pkgname=gittyup
pkgver=1.3.0
pkgrel=1
pkgdesc='Graphical Git client (GitAhead fork)'
url="https://murmele.github.io/${pkgname^}"
_url="https://github.com/Murmele/${pkgname^}"
arch=(x86_64)
license=(MIT)
depends=(cmark
         git
         hunspell
         libssh2
         lua
         lua-lpeg
         openssl
         qt5-base)
makedepends=(cmake
             libgnome-keyring
             ninja
             qt5-tools
             qt5-translations)
optdepends=('git-lfs: git-lfs support'
            'libgnome-keyring: for GNOME Keyring for auth credentials'
            'qt5-translations: translations')
source=("git+$_url.git#tag=${pkgname}_v$pkgver"
        "$pkgname-libgit2::git+https://github.com/stinb/libgit2.git" # a fork, not the official upstream!
        "$pkgname-scintillua::git+https://github.com/orbitalquark/scintillua.git"
        "$pkgname-lexilla::git+https://github.com/ScintillaOrg/lexilla.git"
        "$pkgname-zip::git+https://github.com/kuba--/zip.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "${pkgname^}"
	git submodule init
	git config submodule.dep/cmark/cmark.update none
	git config submodule.dep/git/git.update none
	git config submodule.dep/hunspell/hunspell.update none
	git config submodule.dep/libssh2/libssh2.update none
	git config submodule.dep/openssl/openssl.update none
	git config submodule.dep/libgit2/libgit2.url "$srcdir/$pkgname-libgit2"
	git config submodule.dep/scintillua/lexilla.url "$srcdir/$pkgname-lexilla"
	git config submodule.dep/scintillua/scintillua.url "$srcdir/$pkgname-scintillua"
	git config submodule.test/dep/zip.url "$srcdir/$pkgname-zip"
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake \
		-G Ninja \
		-W no-dev \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_INSTALL_DATADIR=share/$pkgname \
		-D ENABLE_REPRODUCIBLE_BUILDS=ON \
		-D BUILD_SHARED_LIBS=OFF \
		-D DEBUG_OUTPUT=OFF \
		-D USE_SYSTEM_CMARK=ON \
		-D USE_SYSTEM_GIT=ON \
		-D USE_SYSTEM_HUNSPELL=ON \
		-D USE_SYSTEM_LIBSSH2=ON \
		-D USE_SYSTEM_LUA=ON \
		-D USE_SYSTEM_OPENSSL=ON \
		-D LUA_MODULES_PATH=/usr/lib/lua/5.4 \
		-B build \
		-S "${pkgname^}"
	ninja -C build
}

check() {
	ninja -C build check
}

package() {
	install -Dm0644 "${pkgname^}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 "${pkgname^}/rsrc/linux/com.github.Murmele.Gittyup.desktop" "$pkgdir/usr/share/applications/gittyup.desktop"
	DESTDIR="$pkgdir" ninja -C build install
	pushd "$pkgdir/usr"
	rm -f lib/libQt*.so.* lib/*.a
	rm -rf include lib/{cmake,pkgconfig,Plugins}
	mv bin/{indexer,relauncher} "share/$pkgname"
}
