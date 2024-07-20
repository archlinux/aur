# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname='mozc'
pkgver=2.30.5520.102
pkgrel=2
pkgdesc='The Open Source edition of Google Japanese Input'
arch=('x86_64')
url='https://github.com/google/mozc'
license=('Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND NAIST-2003 AND Unicode-3.0 AND LicenseRef-Okinawa-Dictionary')
depends=('qt6-base')
makedepends=('bazel' 'git' 'python' 'qt6-base')
optdepends=('fcitx5-mozc-ut: Fcitx5 integration'
            'ibus-mozc: IBus integration'
            'emacs-mozc: Emacs integration')
conflicts=('mozc-ut')
options=(!distcc !ccache)
source=('git+https://github.com/google/mozc.git#commit=d2fc9c7d9269cc84b9a4a680cafc382a55e90f42'
        'git+https://github.com/abseil/abseil-cpp.git#commit=2f9e432cce407ce0ae50676696666f33a77d42ac'
        'git+https://github.com/google/breakpad.git#commit=216cea7bca53fa441a3ee0d0f5fd339a3a894224'
        'git+https://github.com/google/googletest.git#commit=58d77fa8070e8cec2dc1ed015d66b454c8d78850'
        'git+https://github.com/chromium/gyp.git#commit=9ecf45e37677743503342ee4c6a76eaee80e4a7f'
        'git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git#commit=e5b3425575734c323e1d947009dd74709437b684'
        'git+https://github.com/protocolbuffers/protobuf.git#commit=a978b75794a6ce4547c9db08a115c458d9190934'
        'git+https://github.com/microsoft/wil.git#commit=fc5dbf55989fe20351c71d038a8d12de4b397a6d')
sha256sums=('195f1218deae0daa22a6ae0e2b2f42eb900e314e3442ef549b6f9d666aa68644'
            '8380cac08316c35118999b95845b8c28d9c9c4688402960fb1558d5eeda90f73'
            '5168bb8ea19e2f696eeecbdee991f28e496aea206a473fd7cb49b547f5d0c5af'
            '2acda2cf88e375a7638f521f25c61b308d0eae8a7e188a54fafa2f2c8c2a063f'
            '8a136786407526c64686c3f9990d6416d62c7e2d474ef4a75ced337ecfc58cef'
            '10a13d356071f2b0c2b6dcab1d841fae451f6a2020ee9b901533533fc7ac3008'
            'f09520ceeb7f1f1bb7e1cb61a8cd7a490fff84302ed5dc91f923f0e82ee191dc'
            'abb86ac4d546c98d7d9a10fdeb1059d6e3395e892d5397fb03179361f37c98fe')

prepare() {
    cd mozc/src

    git submodule init
    git config submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
    git config submodule.src/third_party/breakpad.url "$srcdir/breakpad"
    git config submodule.src/third_party/gtest.url "$srcdir/googletest"
    git config submodule.src/third_party/gyp.url "$srcdir/gyp"
    git config submodule.src/third_party/japanese_usage_dictionary.url "$srcdir/japanese-usage-dictionary"
    git config submodule.src/third_party/protobuf.url "$srcdir/protobuf"
    git config submodule.src/third_party/wil.url "$srcdir/wil"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd mozc/src

    unset ANDROID_NDK_HOME
    unset ANDROID_HOME
    export JAVA_HOME='/usr/lib/jvm/java-21-openjdk/'

    bazel build server:mozc_server gui/tool:mozc_tool --config oss_linux --compilation_mode opt --copt='-Wno-maybe-uninitialized' --host_copt='-Wno-maybe-uninitialized'
}

package() {
    cd mozc/src

    # BSD-3-Clause
    sed -n 67,94p data/installer/credits_en.html > Mozc
    install -Dm644 Mozc "${pkgdir}"/usr/share/licenses/mozc/Mozc
    # BSD-3-Clause
    sed -n 317,344p data/installer/credits_en.html > Breakpad
    install -Dm644 Breakpad "${pkgdir}"/usr/share/licenses/mozc/Breakpad
    # NAIST-2003
    sed -n 355,424p data/installer/credits_en.html > IPAdic
    install -Dm644 IPAdic "${pkgdir}"/usr/share/licenses/mozc/IPAdic
    # BSD-2-Clause
    sed -n 435,457p data/installer/credits_en.html > Japanese-Usage-Dictionary
    install -Dm644 Japanese-Usage-Dictionary "${pkgdir}"/usr/share/licenses/mozc/Japanese-Usage-Dictionary
    # Public Domain Data
    sed -n 468,470p data/installer/credits_en.html > Okinawa-Dictionary
    install -Dm644 Okinawa-Dictionary "${pkgdir}"/usr/share/licenses/mozc/Okinawa-Dictionary
    # BSD-3-Clause
    sed -n 481,513p data/installer/credits_en.html > Protocol-Buffers
    install -Dm644 Protocol-Buffers "${pkgdir}"/usr/share/licenses/mozc/Protocol-Buffers
    # MIT
    sed -n 698,704p data/installer/credits_en.html > Tamachi-Phonetic-Kanji-Alphabet
    install -Dm644 Tamachi-Phonetic-Kanji-Alphabet "${pkgdir}"/usr/share/licenses/mozc/Tamachi-Phonetic-Kanji-Alphabet
    # MIT
    sed -n 762,782p data/installer/credits_en.html > Windows-Implementation-Library
    sed -i -e 's|^[ \t]*||g' Windows-Implementation-Library
    install -Dm644 Windows-Implementation-Library "${pkgdir}"/usr/share/licenses/mozc/Windows-Implementation-Library

    install -Dm755 bazel-bin/server/mozc_server "${pkgdir}"/usr/lib/mozc/mozc_server
    install -Dm755 bazel-bin/gui/tool/mozc_tool "${pkgdir}"/usr/lib/mozc/mozc_tool
}
