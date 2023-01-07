# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

#NOTE: The UT dictionary's project page: http://linuxplayers.g1.xrea.com/mozc-ut.html

pkgname='mozc-ut'
pkgver=2.28.4960.102.20230107
pkgrel=1
pkgdesc='The Open Source edition of Google Japanese Input bundled with the UT dictionary'
arch=('x86_64')
url='https://github.com/google/mozc'
license=('Apache' 'BSD' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('bazel' 'git' 'python')
optdepends=('fcitx5-mozc-ut: Fcitx5 integration'
            'fcitx-mozc-ut: Fcitx integration'
            'ibus-mozc: IBus integration'
            'emacs-mozc: Emacs integration')
provides=('mozc=2.28.4960.102')
conflicts=('mozc')
options=(!distcc !ccache)
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=7ec82c9356dbd5e15736627cfef05ec0f2c9bb9b"
        'https://osdn.net/downloads/users/40/40082/mozcdic-ut-20230107.tar.bz2')
sha256sums=('SKIP'
            '2c3514cc4e21c227fd4b327847bf967c7c2394d8d2f4e22751c894b4fc744db3')

prepare() {
    cd ${pkgname}-git/src

    git submodule update --init --recursive

    # Append the UT dictionary
    cat ${srcdir}/mozcdic-ut-20230107/mozcdic-ut-20230107.txt >> data/dictionary_oss/dictionary00.txt

    # Temp fix for Bazel 6.0.0
    sed -i -e 's|@bazel_tools//platforms|@platforms//os|' tools/cc_target_os/BUILD.bazel
}

build() {
    cd ${pkgname}-git/src

    unset ANDROID_NDK_HOME
    export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
    bazel build server:mozc_server gui/tool:mozc_tool --config oss_linux --compilation_mode opt
}

package() {
    install -Dm644 mozcdic-ut-20230107/LICENSE                  ${pkgdir}/usr/share/licenses/mozc/LICENSE_UT_DICTIONARY

    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   ${pkgdir}/usr/share/licenses/mozc/LICENSE
    install -Dm644 data/installer/credits_en.html               ${pkgdir}/usr/share/licenses/mozc/credits_en.html

    install -Dm755 bazel-bin/server/mozc_server                 ${pkgdir}/usr/lib/mozc/mozc_server
    install -Dm755 bazel-bin/gui/tool/mozc_tool                 ${pkgdir}/usr/lib/mozc/mozc_tool
}
