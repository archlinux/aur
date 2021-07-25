# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's project page: http://linuxplayers.g1.xrea.com/mozc-ut.html


## Helpful internal stuff
_commit=87f9ce226a32225cd3dfedde47a21fa16541ae88
_mozcver=2.26.4444.102
_utdicver=20210725

pkgname='emacs-mozc-ut'
pkgver=${_mozcver}.${_utdicver}
pkgrel=1
pkgdesc='Mozc module for Emacs bundled with the UT dictionary'
arch=('i686' 'x86_64')
url='https://github.com/google/mozc'
license=('custom')
depends=('emacs' 'mozc-ut-common')
makedepends=('bazel' 'git' 'pkgconf' 'python-six' 'qt5-base')
conflicts=('emacs-mozc' 'emacs-mozc-ut2' 'emacs-mozc-ut-united')
provides=("emacs-mozc=${_mozcver}")
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
    cd ${pkgname}-git

    git submodule update --init --recursive

    # Fix the Qt5 include path
    sed -i -e 's/x86_64-linux-gnu\/qt5/qt/' src/config.bzl
}

build() {
    cd ${pkgname}-git/src

    env PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH" bazel build unix/emacs:mozc_emacs_helper --config oss_linux --compilation_mode opt
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   ${pkgdir}/usr/share/licenses/mozc/emacs-mozc
    install -Dm644 data/installer/credits_en.html               ${pkgdir}/usr/share/licenses/mozc/emacs-mozc-submodules

    install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper       ${pkgdir}/usr/bin/mozc_emacs_helper
    install -Dm644 unix/emacs/mozc.el                           ${pkgdir}/usr/share/emacs/site-lisp/mozc.el
}
