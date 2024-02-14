# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

_pkgname=unityhubnative
pkgname="$_pkgname-git"
pkgver=1.53.r9.gbc636ec
pkgrel=1
pkgdesc='A lightweight C++ / wxWidgets alternative to the official Unity Hub'
url='https://github.com/Ravbug/UnityHubNative'
license=('GPL-3.0-only' 'custom')  # The code mixes a bunch of different licenses
arch=('x86_64')
depends=('wxwidgets' 'libcurl.so')
makedepends=('icoutils' 'fmt')
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/Ravbug/UnityHubNative.git"
        'UnityHubNative.desktop'
        'fix-cmakelists.patch'
        'fix-wxwidgets-usage.patch')
sha256sums=('SKIP'
            '89bf2f78b85654a9e2e7f68e82c59ec2327970757a4637058bbacd607064e7df'
            '1f5eb1e514f43c944662e1d3319122622bfa10acb0f50250479f20b411bd2521'
            '2a2a277ef7a5c00a9b06d400e0a4a3c9769c952107639a3527e1c633730f6cc5')

pkgver() {
  git -C "$_pkgname" describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    patch -d "$_pkgname" --binary -Np1 -i ../fix-cmakelists.patch
    patch -d "$_pkgname" --binary -Np1 -i ../fix-wxwidgets-usage.patch
    rm -rf "$_pkgname/curl" "$_pkgname/fmt" "$_pkgname/mbedtls" "$_pkgname/wxWidgets"
}

build() {
    cmake \
        -G 'Unix Makefiles' \
        -B 'build' \
        -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_SHARED_LIBS:BOOL='True' \
        -Wno-dev
    cmake --build 'build'
    mkdir 'build/icon'
    icotool --extract --icon "$_pkgname/source/wxwin.ico" --output='build/icon'
    mv "$(find build/icon -type f -name '*.png' | sort | tail -n1)" 'build/UnityHubNative.png'
}

check() {
    ctest --test-dir 'build' --output-on-failure --stop-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install 'build'
    install -D -m644 "$_pkgname/LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -D -m644 'build/UnityHubNative.png' -t "$pkgdir/usr/share/icons"
    install -D -m644 'UnityHubNative.desktop' -t "$pkgdir/usr/share/applications"
}
