# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Maintainer: silentnoodle <lonnqvistben at gmail dot com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>
# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the initial patches!
# https://github.com/mymedia2/tdesktop
pkgname=telegram-desktop-dev
pkgver=4.1.0
pkgrel=1
pkgdesc='Official Telegram Desktop client - development release'
arch=(x86_64)
url="https://desktop.telegram.org/"
license=('GPL3')
# Although not in order, keeping them in the same order of the standard package
# for my mental sanity.
depends=('hunspell' 'ffmpeg4.4' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch')
makedepends=('cmake' 'git' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=(telegram-desktop)
conflicts=(telegram-desktop)
_commit="tag=v$pkgver"

# All the sources are Git repositories and might be adjusted when a build issue arise.
# These files might require modifications to be up-to-date.
# In such situation, extra patches will be added.
# An easy way to clone the repo since the last update is:
# git clone --recurse-submodules --shallow-submodules --remote-submodules --shallow-since=vOLDVER https://github.com/telegramdesktop/tdesktop WORKDIR
# All the submodules "source" definitions are generated them via:
# git submodule foreach --quiet 'echo \"${name##*/}::git+`git remote get-url origin`\"' | sort
source=(
    "tdesktop::git+https://github.com/telegramdesktop/tdesktop#$_commit"
    "tgcalls_type_fix.diff"
    "use_qt6_only.diff"
    # Here are all the repos. See the commands above for populating them
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
    "lib_waylandshells::git+https://github.com/desktop-app/lib_waylandshells.git"
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
            'e1328de1bf2dfc26a834aae855c9ee4734ff00e92f8c31fcfe633b0b5365456daa5ae1736a590a57889597f8703214829e0809d7e6d13e8fb02165c731b1ea88'
            'd6569a4b9d77647f268ee09cfcbc78102165098cda3732938c8e89a37d3d92a65ecaac0af1ade6494d00b106a604bcd0de6722de162abf394912018cd3c06e13'
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
    git config submodule.Telegram/lib_waylandshells.url "$srcdir/lib_waylandshells"
    git config submodule.Telegram/lib_webrtc.url "$srcdir/lib_webrtc"
    git config submodule.Telegram/lib_webview.url "$srcdir/lib_webview"
    git config submodule.Telegram/ThirdParty/dispatch.url "$srcdir/dispatch"
    git config submodule.Telegram/ThirdParty/expected.url "$srcdir/expected"
    git config submodule.Telegram/ThirdParty/fcitx5-qt.url "$srcdir/fcitx5-qt"
    git config submodule.Telegram/ThirdParty/fcitx-qt5.url "$srcdir/fcitx-qt5"
    git config submodule.Telegram/ThirdParty/GSL.url "$srcdir/GSL"
    git config submodule.Telegram/ThirdParty/hime.url "$srcdir/hime"
    git config submodule.Telegram/ThirdParty/hunspell.url "$srcdir/hunspell"
    git config submodule.Telegram/ThirdParty/jemalloc.url "$srcdir/jemalloc"
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
    git submodule update

    # Cheating! Linking fixed patches to their usual place
    #for fixed in $srcdir/*_fixed*
    #do
    #    ln -s $fixed ${fixed/_fixed/}
    #done
    # Patch here, if needed!
    # patch -Np1 -i "$srcdir/my_beautiful.patch"
    cd "$srcdir/tdesktop/Telegram/ThirdParty/tgcalls"
    patch -Np1 -i "$srcdir/tgcalls_type_fix.diff"

    cd "$srcdir/tdesktop/cmake"
    patch -Np1 -i "$srcdir/use_qt6_only.diff"
    # Official package patches
}

build() {
    cd "$srcdir/tdesktop"

    # Be sure to use FFmpeg 4.4
    export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake \
        -B build \
        -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    make -C build -j `nproc`
}

package() {
    cd "$srcdir/tdesktop"
    DESTDIR="$pkgdir" make -C build install
    # They botched the release and put a lot of stuff here.
    rm -rf "$pkgdir/build"
}
