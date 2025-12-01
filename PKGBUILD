# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: WaveHack <email@wavehack.net>
# Contributor: Whovian9369 <Whovian9369@gmail.com>
# Contributor: Angelo Theodorou <encelo@gmail.com>

pkgname=gittyup
pkgver=2.0.0
pkgrel=2
pkgdesc='Graphical Git client (GitAhead fork)'
url="https://murmele.github.io/${pkgname^}"
_url="https://github.com/Murmele/${pkgname^}"
arch=(x86_64 aarch64)
license=(MIT)
depends=(cmark
         git
         hunspell
         hicolor-icon-theme
         icu
         libsecret
         libssh2
         lua
         lua-lpeg
         openssl
         qt6-base)
makedepends=(cmake
             libgnome-keyring
             qt6-tools
             qt6-translations)
optdepends=('git-lfs: git-lfs support'
            'libgnome-keyring: for GNOME Keyring for auth credentials'
            'qt6-translations: translations')
source=("git+$_url.git#tag=${pkgname}_v$pkgver"
        "$pkgname-libgit2::git+https://github.com/Murmele/libgit2.git"
        "$pkgname-lexilla::git+https://github.com/ScintillaOrg/lexilla.git"
        "$pkgname-scintillua::git+https://github.com/orbitalquark/scintillua.git"
        "$pkgname-zip::git+https://github.com/kuba--/zip.git")
sha256sums=('1d5f9751084b63cfc9bfb0d9b1600b968084896091fc5b08b74de338921d10b8'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "${pkgname^}"
	git submodule init
	for submodule in cmark git hunspell libssh2 openssl; do
		git config "submodule.dep/$submodule/$submodule.update" none
	done
	for submodule in libgit2 lexilla scintillua zip; do
		git config "submodule.dep/$submodule/$submodule.url" "$srcdir/$pkgname-$submodule"
	done
	git -c protocol.file.allow=always submodule update
}

build() {
	local cmake_options=(
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_INSTALL_DATADIR=share
		-D LUA_MODULES_PATH=/usr/lib/lua/5.4
		-D BUILD_SHARED_LIBS=Off
		-D DEBUG_OUTPUT=Off
		-D ENABLE_UPDATE_OVER_GUI=Off
		-D GENERATE_APPDATA=Off
		-D USE_SYSTEM_CMARK=On
		-D USE_SYSTEM_GIT=On
		-D USE_SYSTEM_HUNSPELL=On
		-D USE_SYSTEM_LIBGIT2=Off # system libgit2 too new
		-D USE_SYSTEM_LIBSSH2=On
		-D USE_SYSTEM_LUA=On
		-D USE_SYSTEM_OPENSSL=On
		-D USE_SYSTEM_QT=On
	)
	cmake -B build -S "${pkgname^}" -W no-dev "${cmake_options[@]}"
	cmake --build build
}

check() {
	cd build
	make check
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "${pkgname^}/LICENSE.md"
	pushd "$pkgdir/usr"
	# https://github.com/Murmele/Gittyup/issues/904
	rm -f bin/git2
	rm -f lib/libQt*.so.* lib/*.a
	rm -rf include lib/{cmake,pkgconfig,Plugins}
	mv bin/{indexer,relauncher} "share/${pkgname^}"
}
