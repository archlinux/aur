# Maintainer: XYenon <i@xyenon.bid>

pkgname=librime-qjs-git
pkgver=1.2.0.r0.g5f17ba1
# https://gitlab.archlinux.org/archlinux/packaging/packages/librime/-/blob/main/PKGBUILD
_librimetag=1.12.0
_octagramcommit=dfcc15115788c828d9dd7b4bff68067d3ce2ffb8
_luacommit=e3912a4b3ac2c202d89face3fef3d41eb1d7fcd6
_charcodecommit=55e7f563e999802d41a13ba02657c1be4b2011b4
_protocommit=657a923cd4c333e681dc943e6894e6f6d42d25b4
_predictcommit=920bd41ebf6f9bf6855d14fbe80212e54e749791
pkgrel=1
epoch=1
pkgdesc="Rime input method engine, with librime-qjs"
arch=('x86_64')
url="https://github.com/HuangJian/librime-qjs"
license=('BSD-3-Clause')
depends=('boost-libs' 'capnproto' 'gcc-libs' 'glibc' 'opencc' 'yaml-cpp' 'leveldb' 'librime-data' 'lua' 'google-glog' 'marisa')
makedepends=('git' 'cmake' 'boost' 'gtest' 'ninja' 'npm')
conflicts=('librime')
provides=("librime=${_librimetag}")
source=(
    "git+https://github.com/rime/librime.git#tag=$_librimetag"
    "git+https://github.com/lotem/librime-octagram.git#commit=$_octagramcommit"
    "git+https://github.com/hchunhui/librime-lua.git#commit=$_luacommit"
    "git+https://github.com/HuangJian/librime-qjs.git"
    "git+https://github.com/quickjs-ng/quickjs.git"
    "git+https://github.com/rime/librime-charcode.git#commit=$_charcodecommit"
    "git+https://github.com/lotem/librime-proto.git#commit=$_protocommit"
    "git+https://github.com/rime/librime-predict.git#commit=$_predictcommit"
)
sha512sums=(
    '3c2ad932f4c87226f11646f6ee3bc4f18387dc776956cdee913feca753f00fa523b32d562020544d8ce0d63bf33fa71d6dacaac4c7628a941878dc27c4c8981b'
    '1d4c633d15a810b97171f9d44c8474b59e857253310a961a2ab93042bc8bc5c86e549c60816470959c35b68909fcfad14e0661ca28627289f18c1445eb690485'
    '241475088d11d76f947dfe008d1e7b772014f00520f96f97bd1c98d9c8706180398e7d9f8fe47e1d6ec9963470911ce8825fc8cb23e24eb2ac094f8dcf6241d1'
    'SKIP'
    'SKIP'
    'c21a1384f7eba77afdcda4bd0cffcdfa1bc6989e009f02c685160de443f8fc658bee7def57fe93162b3d5f31d366b48271d7204b4f6e7dd057facb2787703a15'
    'e9b2aa47a87f96af97fc55686e85d905bd7bb06b633a9a318aeeea2731d87b38e50f9f821c2e68a30d58f4daaeaff97124247c1028a049ced922c6e7b4cc20ab'
    'cf7062baa8dfe6d97946979545094a1962b73347f233065219b69488f078b6022b46f9bf59d0643de01ef36fe45b2d72375f0578747f85a6d389bdef4acc6967'
)

prepare() {
    cd librime/plugins
    ln -sf "$srcdir"/librime-octagram
    ln -sf "$srcdir"/librime-lua
    ln -sf "$srcdir"/librime-qjs
    ln -sf "$srcdir"/librime-charcode
    ln -sf "$srcdir"/librime-proto
    ln -sf "$srcdir"/librime-predict

    cd "$srcdir"/librime-qjs
    git submodule init
    git config submodule.thirdparty/quickjs.url "$srcdir/quickjs"
    git -c protocol.file.allow=always submodule update
}

pkgver() {
    cd librime/plugins/librime-qjs
    (
        set -o pipefail
        git describe --long --tags --abbrev=7 --exclude=latest 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd librime
    export CXXFLAGS="$CXXFLAGS -DNDEBUG -DGLOG_USE_GLOG_EXPORT -DGLOG_USE_GFLAGS"
    cmake . -GNinja -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_MERGED_PLUGINS=Off -DENABLE_EXTERNAL_PLUGINS=On -Wno-dev
    cmake --build build
}

check() {
    rm -rf librime/build/plugins/librime-qjs/tests
    ln -sf ../../../plugins/librime-qjs/tests librime/build/plugins/librime-qjs/tests
    cd librime/build/plugins/librime-qjs/tests/js
    npm install

    cd "$srcdir/librime/build"
    make test
}

package() {
    cd librime/build
    DESTDIR="$pkgdir" ninja install
    install -vDm 644 ../LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
