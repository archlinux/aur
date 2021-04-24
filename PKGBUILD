# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=kotatogram-dev-git
_pkgname=kotatogram-desktop
pkgver=k1.4.12.g40df43998
pkgrel=1
pkgdesc="Kotatogram – experimental Telegram Desktop fork - Dev branch"
arch=(x86_64)
url="https://github.com/kotatogram/kotatogram-desktop"
license=(GPL3)
depends=(
	qt5-imageformats
  gtk3
	ffmpeg
	openal
  glibmm
  kwayland
	lz4
	xxhash
	minizip
	libdbusmenu-qt5
	hunspell
)
makedepends=(
  cmake
	git
  ninja
	python
	range-v3
	tl-expected
  microsoft-gsl
  libtg_owt
)
optdepends=(
	'ttf-opensans: default Open Sans font family'
)
conflicts=('kotatogram-desktop')
provides=('kotatogram-desktop')
source=(
  "${_pkgname}::git+${url}.git#branch=test"
  "${_pkgname}-libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
  "${_pkgname}-rlottie::git+https://github.com/desktop-app/rlottie.git"
  "${_pkgname}-lib_crl::git+https://github.com/desktop-app/lib_crl.git"
  "${_pkgname}-lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
  "${_pkgname}-lib_base::git+https://github.com/kotatogram/lib_base.git"
  "${_pkgname}-codegen::git+https://github.com/desktop-app/codegen.git"
  "${_pkgname}-lib_ui::git+https://github.com/kotatogram/lib_ui.git"
  "${_pkgname}-lib_rlottie::git+https://github.com/desktop-app/lib_rlottie.git"
  "${_pkgname}-lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
  "${_pkgname}-lib_tl::git+https://github.com/desktop-app/lib_tl.git"
  "${_pkgname}-lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck"
  "${_pkgname}-lib_storage::git+https://github.com/desktop-app/lib_storage.git"
  "${_pkgname}-cmake_helpers::git+https://github.com/kotatogram/cmake_helpers.git"
  "${_pkgname}-QR-Code-generator::git+https://github.com/nayuki/QR-Code-generator"
  "${_pkgname}-lib_qr::git+https://github.com/desktop-app/lib_qr.git"
  "${_pkgname}-lib_webrtc::git+https://github.com/desktop-app/lib_webrtc.git"
  "${_pkgname}-tgcalls::git+https://github.com/TelegramMessenger/tgcalls.git"
  "0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '13357d081fb658c735bb2575360f5d48214e1cf5002719ba410405a2fe05c7c3d2379588c2ca3c2ca6a5e6ff64e01e6d1ff3aecdaee8f3dd0519a64f6ee94182')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --tags --long | sed 's/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule init
    git config submodule.Telegram/ThirdParty/libtgvoip.url "${srcdir}/${_pkgname}-libtgvoip"
    git config submodule.Telegram/ThirdParty/rlottie.url "${srcdir}/${_pkgname}-rlottie"
    git config submodule.Telegram/lib_crl.url "${srcdir}/${_pkgname}-lib_crl"
    git config submodule.Telegram/lib_rpl.url "${srcdir}/${_pkgname}-lib_rpl"
    git config submodule.Telegram/lib_base.url "${srcdir}/${_pkgname}-lib_base"
    git config submodule.Telegram/codegen.url "${srcdir}/${_pkgname}-codegen"
    git config submodule.Telegram/lib_ui.url "${srcdir}/${_pkgname}-lib_ui"
    git config submodule.Telegram/lib_rlottie.url "${srcdir}/${_pkgname}-lib_rlottie"
    git config submodule.Telegram/lib_lottie.url "${srcdir}/${_pkgname}-lib_lottie"
    git config submodule.Telegram/lib_tl.url "${srcdir}/${_pkgname}-lib_tl"
    git config submodule.Telegram/lib_spellcheck.url "${srcdir}/${_pkgname}-lib_spellcheck"
    git config submodule.Telegram/lib_storage.url "${srcdir}/${_pkgname}-lib_storage"
    git config submodule.cmake.url "${srcdir}/${_pkgname}-cmake_helpers"
    git config submodule.Telegram/ThirdParty/QR.url "${srcdir}/${_pkgname}-QR-Code-generator"
    git config submodule.Telegram/lib_qr.url "${srcdir}/${_pkgname}-lib_qr"
    git config sumbodule.Telegram/lib_webrtc.url "${srcdir}/${_pkgname}-lib_webrtc"
    git config sumbodule.Telegram/ThirdParty/tgcalls.url "${srcdir}/${_pkgname}-tgcalls"
    git submodule update

    pushd cmake
    # force webrtc link to libjpeg
    echo "target_link_libraries(external_webrtc INTERFACE jpeg)" | tee -a external/webrtc/CMakeLists.txt
    popd

    patch -p1 < ${srcdir}/0001-Add-an-option-to-hide-messages-from-blocked-users-in.patch
}

build() {
	cd "${srcdir}/${_pkgname}/"

  cmake . \
    -B build \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DTDESKTOP_API_TEST=ON

  cmake --build build
}

package() {
	cd "${srcdir}/${_pkgname}"

  DESTDIR="$pkgdir" ninja -C build install
}
# vim:set ts=2 sw=2 et:
