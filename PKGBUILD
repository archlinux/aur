# Maintainer: Dominic Meiser <git at msrd0 dot de>
# Contributor: Leonidas Spyropoulos <artafinde@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Konstantinos Sideris <siderisk at auth dot gr>

_pkgname=nheko
pkgname=$_pkgname-scrollfix
pkgver=0.12.1
pkgrel=3
pkgdesc="Desktop client for the Matrix protocol"
arch=('x86_64')
url="https://nheko.im/nheko-reborn/nheko"
license=(GPL-3.0-or-later)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
depends=(qt6-base qt6-svg qt6-multimedia qtkeychain-qt6 qt6-declarative qt6-imageformats
		 coeurl 'mtxclient>=0.10.1'
		 lmdb cmark libolm hicolor-icon-theme \
         kdsingleapplication gst-plugins-bad-libs 'org.freedesktop.secrets'
         kirigami openmp)
makedepends=("git" "cmake" "gcc" "fontconfig" "qt6-tools" "nlohmann-json" "asciidoc")
optdepends=('qt6-jdenticon: Auto-generated profile pictures (identicons)'
            'kimageformats: Extends the formats nheko supports for image attachments'
            'gst-plugins-base-libs: VoIP/Video calls' 
            'gst-plugins-good: VoIP/Video calls'
            'gst-plugins-bad: VoIP/Video calls'
            'libnice: VoIP/Video calls'
            'gst-libav: Video messages'
            'gst-plugin-qml6: Video calls support')
makedepends=(cmake ninja qt6-tools fontconfig nlohmann-json asciidoc lmdbxx spdlog)
source=("https://nheko.im/nheko-reborn/$_pkgname/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz"
        nheko-0_12_0-use-kirigami.patch::https://github.com/Nheko-Reborn/$_pkgname/pull/1838/commits/c9f1a449d825d5879735f95ebfb0c7acec101226.patch
        nheko-0_12_1-fix-most-rendering-issues-qt6.9.patch::https://nheko.im/nheko-reborn/nheko/-/commit/2769642d3c7bd3c0d830b2f18ef6b3bf6a710bf4.patch
        nheko-0_12_1-fix-qt6.10.patch::https://nheko.im/nheko-reborn/nheko/-/commit/af2ca72030deb14a920a888e807dc732d93e3714.patch)
sha512sums=('1615e624fb5c70dded065b09c3a25a5e54840116c2a6c8026676ce4db3f5e3347d7c8e441b7c326e95ca6cd755fdf5a567b5deaada8bc887428ecd7c905a2ac5'
            'b34d5d21eba8dcc347a3ee1e78489c0fbd1c03db92a73bd985ff5490635630d6a0b41cef549de492a4d4492d88241051a852e59579df7fc623181cff9a5e7099'
            '9d2b7390aa6f1d95c2f370d2027e905a75f63e123affeb126525d38695aa199e2bc07b58592fc69d2bdaf94d6cf3fa938ba68103e4fc027bd4c802669d98e376'
            '96ff2f71681f3b4e6d8fd8fca01592c319a4eab5f24b13c45cc223decc2269173ae90b22616d3ccef76d3f40e6d24429a3f60c4dede8e15c6aeeff81aa7a1088')

_apply_patches() {
	for patch in "${@}"
	do
		msg2 "Applying patch $patch"
		patch -Np1 -i "$patch"
	done
}

prepare() {
	cd "$_pkgname-v$pkgver"
	_apply_patches \
		"$srcdir/nheko-0_12_0-use-kirigami.patch" \
		"$srcdir/nheko-0_12_1-fix-most-rendering-issues-qt6.9.patch" \
		"$srcdir/nheko-0_12_1-fix-qt6.10.patch"
}

build() {
  cmake \
    -Bbuild \
    -GNinja \
    -S "$_pkgname-v$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='lib' \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_LIB_TESTS=OFF \
    -DBUILD_LIB_EXAMPLES=OFF \
    -Wno-dev
  cmake --build build --verbose
}

package() {
  depends+=(
    mtxclient libmatrix_client.so
    # lmdb liblmdb.so # https://bugs.archlinux.org/task/77537
    spdlog libspdlog.so
    # cmark libcmark.so # https://bugs.archlinux.org/task/77538
    libolm libolm.so
  )
  DESTDIR="$pkgdir" cmake --install build
}

