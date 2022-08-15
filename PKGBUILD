# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>

pkgname=gittyup
pkgver=1.1.2
pkgrel=1
pkgdesc='Graphical Git client (GitAhead fork)'
url="https://github.com/Murmele/${pkgname^}"
arch=(x86_64)
license=(MIT)
depends=(cmark
         libssh2
         libsecret
         lua
         qt5-base)
makedepends=(cmake
             git
             hunspell
             libgit2
             libgnome-keyring
             ninja
             openssl
             qt5-tools
             qt5-translations)
optdepends=('git-lfs: git-lfs support'
            'libgnome-keyring: for GNOME Keyring for auth credentials'
            'qt5-translations: translations')
source=("$pkgname::git+$url.git#tag=${pkgname}_v$pkgver"
        "$pkgname-cmark::git+https://github.com/commonmark/cmark.git"
        "$pkgname-git::git+https://github.com/git/git.git"
        "$pkgname-hunspell::git+https://github.com/hunspell/hunspell.git"
        "$pkgname-libgit2::git+https://github.com/stinb/libgit2.git" # a fork, not the official upstream!
        "$pkgname-libssh2::git+https://github.com/libssh2/libssh2.git"
        "$pkgname-openssl::git+https://github.com/openssl/openssl.git"
        "$pkgname-zip::git+https://github.com/kuba--/zip.git"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'fb900e4d101c19a5b3e1dc4c7619780e1d38fd78d0b9d951e794fbf36eebf21a')

prepare() {
	cd "$pkgname"
	git config advice.detachedHead false
	git submodule init
	git config submodule.test/dep/zip.url "$srcdir/$pkgname-zip"
	git config submodule.dep/libgit2/libgit2.url "$srcdir/$pkgname-libgit2"
	git config submodule.dep/git/git.url "$srcdir/$pkgname-git"
	git config submodule.dep/libssh2/libssh2.url "$srcdir/$pkgname-libssh2"
	git config submodule.dep/hunspell/hunspell.url "$srcdir/$pkgname-hunspell"
	git config submodule.dep/openssl/openssl.url "$srcdir/$pkgname-openssl"
	git config submodule.dep/cmark/cmark.url "$srcdir/$pkgname-cmark"
	git submodule update
	sed -i -e 's/cmark_exe/cmark/' src/app/CMakeLists.txt
}

build() {
	cmake \
		-G Ninja \
		-W no-dev \
		-D CMAKE_BUILD_TYPE=None \
		-D CMAKE_INSTALL_PREFIX=/usr/lib/$pkgname \
		-D CMAKE_INSTALL_MANDIR=/usr/share/man \
		-D DATA_INSTALL_DIR=/usr/share/$pkgname \
		-D ENABLE_REPRODUCIBLE_BUILDS=ON \
		-D BUILD_SHARED_LIBS=OFF \
		-D BUILD_TESTS=OFF \
		-B build \
		-S "$pkgname"
	ninja -C build
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" ninja -C ../build install
	rm -rf "$pkgdir/usr/lib/gittyup/"*.so.*
	local _bin="$pkgdir/usr/lib/$pkgname/${pkgname^}"
	install -Dm0755 "$_bin" "$pkgdir/usr/bin/$pkgname"
	rm "$_bin"
	mv "$pkgdir/usr/"{lib/$pkgname/Resources,share/$pkgname}
	rm -rf "$pkgdir/usr/lib/$pkgname/"{include,lib/cmake}
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	install -Dm0644 -t "$pkgdir/usr/share/applications/" ../$pkgname.desktop
	install -Dm0644 rsrc/Gittyup.iconset/gittyup_logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gittyup.svg"
	for s in 16x16 32x32 64x64 128x128 256x256 512x512; do
		install -Dm0644 "rsrc/Gittyup.iconset/icon_$s.png" "icons/hicolor/$s/apps/$pkgname.png"
	done
	rm -rf "$pkgdir/usr/share/man" # libssh2 man pages
}
