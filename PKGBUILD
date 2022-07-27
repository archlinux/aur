# Maintainer: kevku <kevku@gmx.com>
pkgname=web-eid
pkgver=2.1.0.565
_rls_tag=v2.1.0
pkgrel=1
pkgdesc="Web eID browser extension for chromium and native application"
arch=('x86_64')
url="https://web-eid.eu/"
license=('MIT')
depends=('openssl' 'qt5-base' 'qt5-svg' 'pcsclite')
makedepends=('git' 'qt5-tools' 'gtest' 'gmock')
source=("$pkgname::git+https://github.com/web-eid/web-eid-app.git?signed#tag=$_rls_tag"
        "web-eid-libelectronic-id::git+https://github.com/web-eid/libelectronic-id.git"
        "web-eid-libpcsc-cpp::git+https://github.com/web-eid/libpcsc-cpp.git"
        "web-eid-libpcsc-mock::git+https://github.com/web-eid/libpcsc-mock.git")
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")
validpgpkeys=(
    '1282B0F8809D0DC632C85A3F86B611CE24492160'  # Mart Somermaa https://github.com/mrts.gpg
)

prepare() {
    cd "$srcdir/$pkgname"
    [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
    mkdir "$pkgname-build"

    git submodule init
    git config submodule.lib/libelectronic-id.url $srcdir/web-eid-libelectronic-id
    git submodule update lib/libelectronic-id
    
    cd "$srcdir/$pkgname/lib/libelectronic-id"
    git submodule init
    git config submodule.lib/libpcsc-cpp.url $srcdir/web-eid-libpcsc-cpp
    git submodule update

    cd "$srcdir/$pkgname/lib/libelectronic-id/lib/libpcsc-cpp"
    git submodule init
    git config submodule.tests/lib/libpcsc-mock.url $srcdir/web-eid-libpcsc-mock
    git submodule update
}

build() {
    cd "$srcdir/$pkgname/$pkgname-build"
    export BUILD_NUMBER=${pkgver##*.}
    cmake .. -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
             -DMOZILLA_INSTALL_DIR="/usr/lib/mozilla/native-messaging-hosts" \
             -DCMAKE_INSTALL_PREFIX="/usr" \
             -DCMAKE_INSTALL_LIBDIR="lib" \
             -DCMAKE_INSTALL_SYSCONFDIR="/etc" \
             -DQT_DIR="/usr/lib/cmake/Qt5"
    cmake --build . --config Release
}

package() {
    cd "$srcdir/$pkgname/$pkgname-build"
    make DESTDIR="$pkgdir/" install
    mkdir -p $pkgdir/usr/share/chromium/extensions
    mkdir -p $pkgdir/opt/google/chrome/extensions
    mkdir -p $pkgdir/etc/chromium/native-messaging-hosts
    mkdir -p $pkgdir/etc/opt/chrome/native-messaging-hosts
    ln -sf "/usr/share/web-eid/eu.webeid.json" "$pkgdir/etc/chromium/native-messaging-hosts/eu.webeid.json"
    ln -sf "/usr/share/web-eid/eu.webeid.json" "$pkgdir/etc/opt/chrome/native-messaging-hosts/eu.webeid.json"
    ln -sf "/usr/share/google-chrome/extensions/ncibgoaomkmdpilpocfeponihegamlic.json" "$pkgdir/usr/share/chromium/extensions/ncibgoaomkmdpilpocfeponihegamlic.json"
    ln -sf "/usr/share/google-chrome/extensions/ncibgoaomkmdpilpocfeponihegamlic.json" "$pkgdir/opt/google/chrome/extensions/ncibgoaomkmdpilpocfeponihegamlic.json"
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/web-eid/LICENSE"
}
