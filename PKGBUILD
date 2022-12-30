# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname='emacs-mozc'
pkgver=2.28.4960.102
pkgrel=1
pkgdesc='Mozc module for Emacs'
arch=('x86_64')
url='https://github.com/google/mozc'
license=('Apache' 'BSD' 'LGPL' 'custom')
depends=('emacs' 'mozc>=2.28.4960.102')
makedepends=('bazel' 'git' 'python' 'qt5-base')
options=(!distcc !ccache)
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=7ec82c9356dbd5e15736627cfef05ec0f2c9bb9b")
sha256sums=('SKIP')

prepare() {
    cd ${pkgname}-git/src

    git submodule update --init --recursive

    # Temp fix for Bazel 6.0.0
    sed -i -e 's|@bazel_tools//platforms|@platforms//os|' tools/cc_target_os/BUILD.bazel
}

build() {
    cd ${pkgname}-git/src

    unset ANDROID_NDK_HOME
    export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
    bazel build unix/emacs:mozc_emacs_helper --config oss_linux --compilation_mode opt
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   ${pkgdir}/usr/share/licenses/emacs-mozc/LICENSE
    install -Dm644 data/installer/credits_en.html               ${pkgdir}/usr/share/licenses/emacs-mozc/credits_en.html

    install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper       ${pkgdir}/usr/bin/mozc_emacs_helper
    install -Dm644 unix/emacs/mozc.el                           ${pkgdir}/usr/share/emacs/site-lisp/mozc.el
}
