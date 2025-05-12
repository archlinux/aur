# Maintainer   : bartus <arch-local-repo(at).bartus.33mail.com>
# Co-Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor  : Rafał Kozdrój <kozeid2+aur@gmail.com>
# Contributor  : kikadf <kikadf.01@gmail.com>
# Contributor  : Daniel Henry <d at hackr dot pl>
# Contributor  : Miguel Revilla <yo at  miguelrevilla dot com>
# Contributor  : Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com>
# Contributor  : Hexchain Tong <i at hexchain dot org>

pkgname=megasync-nopdfium
pkgver=5.11.1.0
pkgrel=1
pkgdesc="Easy automated syncing between your computers and your MEGA cloud drive(stripped of pdfium dependency)"
arch=('i686' 'x86_64')
provides=(megasync=$pkgver)
conflicts=(megasync)
url="https://github.com/meganz/MEGAsync"
license=('custom:MEGA LIMITED CODE REVIEW LICENCE')
depends=('c-ares' 'crypto++' 'libsodium' 'hicolor-icon-theme' 'libuv'
         'qt5-base' 'qt5-svg' 'qt5-x11extras' 'libmediainfo' 'libraw'
         'ffmpeg' 'freeimage' 'qt5-declarative')
makedepends=(cmake 'qt5-tools' 'swig' 'doxygen' 'lsb-release' 'git')
_extname="_Win"
_sdk_ver="9.3.0"
source=("git+https://github.com/meganz/MEGAsync.git#tag=v${pkgver}${_extname}"
        "meganz-sdk::git+https://github.com/meganz/sdk#tag=v${_sdk_ver}"
        "cmake_crypto++.patch"
	"ffmpeg.patch")
sha256sums=('cc537739076c597e8dc0494ec4d374e0833c4bc3641fd7cca8f6f3a4c1834d53'
            '439bdd3b3fd3d80178415c677afe31f5e9acfcb2129e3efc35395ea569e1da16'
            '004df095bcd6b15b0f69dd69219dc15c27ee7b46ade0c9ab7271b46b2ad6ca13'
            '4f7a31567de1b7c3114efbbb208bdf93b80a5a2c4fd290868c5212b8312c500d')

prepare() {
    git -C "$srcdir/MEGAsync" config submodule.src/MEGASync/mega.url "$srcdir/meganz-sdk"
    git -C "$srcdir/MEGAsync" -c protocol.file.allow=always submodule update --init -- src/MEGASync/mega
#   git -C "${srcdir}"/MEGAsync/src/MEGASync/mega checkout f60237a8d46cec993137065d39138fd42c043271 # ${_sdk_ver}
    mapfile -t patches < <(grep -Po '^.*?(patch|diff)(?=::|$)' < <(printf "${srcdir}/%s\n" ${source[@]}))
    for patch in "${patches[@]}"; do
      msg2  "apply ${patch##*/}..."
      patch -Np1 -d "${srcdir}"/MEGAsync -i "$patch"
    done
}

build() {
    cmake -B build -S MEGAsync \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_MODULE_PATH:PATH="${srcdir}/MEGAsync/src/MEGASync/mega/cmake/modules/packages" \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
        -DENABLE_DESIGN_TOKENS_IMPORTER:BOOL='OFF' \
        -DENABLE_DESKTOP_APP_TESTS:BOOL='OFF' \
	-DUSE_PDFIUM:BOOL='OFF' \
        -Wno-dev
    cmake --build build --target MEGAsync
}

package () {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 MEGAsync/LICENCE.md -t "${pkgdir}/usr/share/licenses/megasync"
    install -D -m644 MEGAsync/installer/terms.txt -t "${pkgdir}/usr/share/licenses/megasync"
    install -D -m644 MEGAsync/src/MEGASync/mega/LICENSE "${pkgdir}/usr/share/licenses/megasync/LICENCE-SDK"
    rm -d "${pkgdir}/opt"{/megasync{/lib,},}
}
