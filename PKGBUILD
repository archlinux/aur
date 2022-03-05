# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

#NOTE: The UT dictionary's project page: http://linuxplayers.g1.xrea.com/mozc-ut.html

pkgname='mozc-ut'
pkgver=2.26.4666.102.20220305
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
provides=('mozc=2.26.4666.102')
conflicts=('mozc')
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=650e8de7e6280dce751e4a27ae6cda3827ea8a29"
        'https://osdn.net/downloads/users/37/37876/mozcdic-ut-20220305.tar.bz2')
sha256sums=('SKIP'
            'cb8020142ecbbbe961b5821b055b920d673853599fe8aa1c063386249dec2e00')

prepare() {
    cd ${pkgname}-git/src

    git submodule update --init --recursive

    # Fix the Qt5 include path
    sed -i -e 's/x86_64-linux-gnu\/qt5/qt/' config.bzl

    # Temp fix for the Android NDK error
    sed -i -e 's/android_ndk_repository(name = "androidndk")/#android_ndk_repository(name = "androidndk")/' WORKSPACE.bazel

    # Append the UT dictionary
    cat ${srcdir}/mozcdic-ut-20220305/mozcdic-ut-20220305.txt >> data/dictionary_oss/dictionary00.txt
}

build() {
    cd ${pkgname}-git/src

    export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
    bazel build server:mozc_server gui/tool:mozc_tool --config oss_linux --compilation_mode opt
}

package() {
    install -Dm644 mozcdic-ut-20220305/LICENSE                  ${pkgdir}/usr/share/licenses/mozc/LICENSE_UT_DICTIONARY

    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   ${pkgdir}/usr/share/licenses/mozc/LICENSE
    install -Dm644 data/installer/credits_en.html               ${pkgdir}/usr/share/licenses/mozc/credits_en.html

    install -Dm755 bazel-bin/server/mozc_server                 ${pkgdir}/usr/lib/mozc/mozc_server
    install -Dm755 bazel-bin/gui/tool/mozc_tool                 ${pkgdir}/usr/lib/mozc/mozc_tool
}
