# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

#NOTE: The UT dictionary's project page: http://linuxplayers.g1.xrea.com/mozc-ut.html

pkgname='mozc-ut'
pkgver=2.28.4950.102.20221022
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
provides=('mozc=2.28.4950.102')
conflicts=('mozc')
options=(!distcc !ccache)
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=db37db71b53c9accc9ad66d12ad8196b25c771b3"
        'https://osdn.net/downloads/users/39/39554/mozcdic-ut-20221022.tar.bz2')
sha256sums=('SKIP'
            '1012b6cf1e8e0e23e60910f0b9c0ca857836e70408ad6edaabba9803fb274b10')

prepare() {
    cd ${pkgname}-git/src

    git submodule update --init --recursive

    # Append the UT dictionary
    cat ${srcdir}/mozcdic-ut-20221022/mozcdic-ut-20221022.txt >> data/dictionary_oss/dictionary00.txt
}

build() {
    cd ${pkgname}-git/src

    unset ANDROID_NDK_HOME
    export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
    bazel build server:mozc_server gui/tool:mozc_tool --config oss_linux --compilation_mode opt
}

package() {
    install -Dm644 mozcdic-ut-20221022/LICENSE                  ${pkgdir}/usr/share/licenses/mozc/LICENSE_UT_DICTIONARY

    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   ${pkgdir}/usr/share/licenses/mozc/LICENSE
    install -Dm644 data/installer/credits_en.html               ${pkgdir}/usr/share/licenses/mozc/credits_en.html

    install -Dm755 bazel-bin/server/mozc_server                 ${pkgdir}/usr/lib/mozc/mozc_server
    install -Dm755 bazel-bin/gui/tool/mozc_tool                 ${pkgdir}/usr/lib/mozc/mozc_tool
}
