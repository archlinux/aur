# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Maintainer: silentnoodle <lonnqvistben at gmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the initial patches!
# https://github.com/mymedia2/tdesktop

# Updated using:
# https://raw.githubusercontent.com/archlinux/svntogit-community/packages/telegram-desktop/trunk/PKGBUILD
# Thanks to the Arch maintainers :)

# You can pass parameters to `ninja` via MAKEFLAGS

pkgname=telegram-desktop-dev
pkgver=4.6.9
pkgrel=1
pkgdesc='Official Telegram Desktop client - development release'
arch=(x86_64)
url="https://desktop.telegram.org/"
license=('GPL3')
# Although not in order, keeping them in the same order of the standard package
# for my mental sanity.
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'glibmm-2.68'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
         'openssl-1.1' 'protobuf')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=(telegram-desktop)
conflicts=(telegram-desktop)
# Specify the commit to fetch. Normally the version tag.
_commit="tag=v$pkgver"
# All the sources are Git repositories and might be adjusted when a build issue arise.
# These files might require modifications to be up-to-date.
# In such situation, extra patches will be added.
# An easy way to clone the repo since the last update is:
# git clone --recurse-submodules --shallow-submodules --shallow-since vOLDVER --branch=vNEWVER https://github.com/telegramdesktop/tdesktop WORKDIR
source=(
    "tdesktop::git+https://github.com/telegramdesktop/tdesktop#$_commit"
    "ensure_qt6_build.patch"
    # Here are all the submodule repos.
    # All the submodules "source" definitions are generated them via:
    # git submodule foreach --quiet 'echo \"${name##*/}::git+`git remote get-url origin`\"' | sort
    "cld3::git+https://github.com/google/cld3.git"
    "cmake::git+https://github.com/desktop-app/cmake_helpers.git"
    "codegen::git+https://github.com/desktop-app/codegen.git"
    "dispatch::git+https://github.com/apple/swift-corelibs-libdispatch"
    "expected::git+https://github.com/TartanLlama/expected"
    "fcitx5-qt::git+https://github.com/fcitx/fcitx5-qt.git"
    "fcitx-qt5::git+https://github.com/fcitx/fcitx-qt5.git"
    "GSL::git+https://github.com/Microsoft/GSL.git"
    "hime::git+https://github.com/hime-ime/hime.git"
    "hunspell::git+https://github.com/hunspell/hunspell"
    "jemalloc::git+https://github.com/jemalloc/jemalloc"
    "kcoreaddons::git+https://github.com/KDE/kcoreaddons.git"
    "kimageformats::git+https://github.com/KDE/kimageformats.git"
    "lib_base::git+https://github.com/desktop-app/lib_base.git"
    "lib_crl::git+https://github.com/desktop-app/lib_crl.git"
    "lib_lottie::git+https://github.com/desktop-app/lib_lottie.git"
    "lib_qr::git+https://github.com/desktop-app/lib_qr.git"
    "lib_rpl::git+https://github.com/desktop-app/lib_rpl.git"
    "lib_spellcheck::git+https://github.com/desktop-app/lib_spellcheck"
    "lib_storage::git+https://github.com/desktop-app/lib_storage.git"
    "libtgvoip::git+https://github.com/telegramdesktop/libtgvoip"
    "lib_tl::git+https://github.com/desktop-app/lib_tl.git"
    "lib_ui::git+https://github.com/desktop-app/lib_ui.git"
    "lib_webrtc::git+https://github.com/desktop-app/lib_webrtc.git"
    "lib_webview::git+https://github.com/desktop-app/lib_webview.git"
    "lz4::git+https://github.com/lz4/lz4.git"
    "nimf::git+https://github.com/hamonikr/nimf.git"
    "plasma-wayland-protocols::git+https://github.com/KDE/plasma-wayland-protocols.git"
    "QR::git+https://github.com/nayuki/QR-Code-generator"
    "range-v3::git+https://github.com/ericniebler/range-v3.git"
    "rlottie::git+https://github.com/desktop-app/rlottie.git"
    "tgcalls::git+https://github.com/TelegramMessenger/tgcalls.git"
    "wayland-protocols::git+https://github.com/gitlab-freedesktop-mirrors/wayland-protocols.git"
    "xxHash::git+https://github.com/Cyan4973/xxHash.git"
)
sha512sums=('SKIP'
            '44b4a265cece9a197441cab7483ffdb300c9b93e46983251eed1254b1ab7aa6488e48c3e2aa02dad7f305623314c8def56ca106bc893c777af37bbe8c43f2bc7'
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
            'SKIP')

prepare() {
    cd "$srcdir/tdesktop"
    git submodule init

    # Same magic as above.
    # git submodule foreach --quiet 'echo git config submodule.$name.url \"\$srcdir/${name##*/}\"' | sort
    git config submodule.cmake.url "$srcdir/cmake"
    git config submodule.Telegram/codegen.url "$srcdir/codegen"
    git config submodule.Telegram/lib_base.url "$srcdir/lib_base"
    git config submodule.Telegram/lib_crl.url "$srcdir/lib_crl"
    git config submodule.Telegram/lib_lottie.url "$srcdir/lib_lottie"
    git config submodule.Telegram/lib_qr.url "$srcdir/lib_qr"
    git config submodule.Telegram/lib_rpl.url "$srcdir/lib_rpl"
    git config submodule.Telegram/lib_spellcheck.url "$srcdir/lib_spellcheck"
    git config submodule.Telegram/lib_storage.url "$srcdir/lib_storage"
    git config submodule.Telegram/lib_tl.url "$srcdir/lib_tl"
    git config submodule.Telegram/lib_ui.url "$srcdir/lib_ui"
    git config submodule.Telegram/lib_webrtc.url "$srcdir/lib_webrtc"
    git config submodule.Telegram/lib_webview.url "$srcdir/lib_webview"
    git config submodule.Telegram/ThirdParty/cld3.url "$srcdir/cld3"
    git config submodule.Telegram/ThirdParty/dispatch.url "$srcdir/dispatch"
    git config submodule.Telegram/ThirdParty/expected.url "$srcdir/expected"
    git config submodule.Telegram/ThirdParty/fcitx5-qt.url "$srcdir/fcitx5-qt"
    git config submodule.Telegram/ThirdParty/fcitx-qt5.url "$srcdir/fcitx-qt5"
    git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
    git config submodule.Telegram/ThirdParty/hime.url "$srcdir/hime"
    git config submodule.Telegram/ThirdParty/hunspell.url "$srcdir/hunspell"
    git config submodule.Telegram/ThirdParty/jemalloc.url "$srcdir/jemalloc"
    git config submodule.Telegram/ThirdParty/kcoreaddons.url "$srcdir/kcoreaddons"
    git config submodule.Telegram/ThirdParty/kimageformats.url "$srcdir/kimageformats"
    git config submodule.Telegram/ThirdParty/libtgvoip.url "$srcdir/libtgvoip"
    git config submodule.Telegram/ThirdParty/lz4.url "$srcdir/lz4"
    git config submodule.Telegram/ThirdParty/nimf.url "$srcdir/nimf"
    git config submodule.Telegram/ThirdParty/plasma-wayland-protocols.url "$srcdir/plasma-wayland-protocols"
    git config submodule.Telegram/ThirdParty/QR.url "$srcdir/QR"
    git config submodule.Telegram/ThirdParty/range-v3.url "$srcdir/range-v3"
    git config submodule.Telegram/ThirdParty/rlottie.url "$srcdir/rlottie"
    git config submodule.Telegram/ThirdParty/tgcalls.url "$srcdir/tgcalls"
    git config submodule.Telegram/ThirdParty/wayland-protocols.url "$srcdir/wayland-protocols"
    git config submodule.Telegram/ThirdParty/xxHash.url "$srcdir/xxHash"

    # Magic is over!
    # We need the extra flag for this vulnerability:
    # https://github.blog/2022-10-18-git-security-vulnerabilities-announced/#cve-2022-39253
    # With the -c flag we enable the file cloning only for this command, as per guidelines:
    # https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
    git -c protocol.file.allow=always submodule update

    # Cheating! Linking fixed patches to their usual place
    #for fixed in $srcdir/*_fixed*
    #do
    #    ln -s $fixed ${fixed/_fixed/}
    #done
    # Patch here, if needed!
    # patch -Np1 -i "$srcdir/my_beautiful.patch"
    # Official package patches
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'
    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake -B build -S tdesktop -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
        # -DCMAKE_VERBOSE_MAKEFILE=ON \
    cmake --build build -- $MAKEFLAGS
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
