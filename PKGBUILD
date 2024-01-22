# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname='mozc'
pkgver=2.29.5346.102
pkgrel=1
pkgdesc='The Open Source edition of Google Japanese Input'
arch=('x86_64')
url='https://github.com/google/mozc'
license=('Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND LGPL-3.0-only AND MIT AND MS-PL AND NAIST-2003 AND Unicode-3.0')
depends=('qt6-base')
makedepends=('bazel' 'git' 'python')
optdepends=('fcitx5-mozc-ut: Fcitx5 integration'
            'fcitx-mozc-ut: Fcitx integration'
            'ibus-mozc: IBus integration'
            'emacs-mozc: Emacs integration')
conflicts=('mozc-ut')
options=(!distcc !ccache)
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=034b61000d2af24438f09c08abea42ef35689944")
sha256sums=('SKIP')

prepare() {
    cd ${pkgname}-git/src

    git submodule update --init --recursive
}

build() {
    cd ${pkgname}-git/src

    unset ANDROID_NDK_HOME
    export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
    bazel build server:mozc_server gui/tool:mozc_tool --config oss_linux --compilation_mode opt
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 data/installer/credits_en.html               "${pkgdir}"/usr/share/licenses/${pkgname}/Submodules

    install -Dm755 bazel-bin/server/mozc_server                 "${pkgdir}"/usr/lib/mozc/mozc_server
    install -Dm755 bazel-bin/gui/tool/mozc_tool                 "${pkgdir}"/usr/lib/mozc/mozc_tool
}
