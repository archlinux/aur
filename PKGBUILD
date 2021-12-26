# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


pkgname='mozc'
pkgver=2.26.4596.102
pkgrel=1
pkgdesc='The Open Source edition of Google Japanese Input'
arch=('x86_64')
url='https://github.com/google/mozc'
license=('Apache' 'BSD' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('bazel' 'git' 'pkgconf' 'python-six')
conflicts=('mozc-ut-common' 'mozc-ut' 'mozc-ut2' 'mozc-ut-united' 'mozc-neologd-ut+ut2')
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=3735608")
sha256sums=('SKIP')

prepare() {
    cd ${pkgname}-git

    git submodule update --init --recursive

    cd src

    # Fix the Qt5 include path
    sed -i -e 's/x86_64-linux-gnu\/qt5/qt/' config.bzl
}

build() {
    cd ${pkgname}-git/src

    env PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH" bazel build server:mozc_server gui/tool:mozc_tool --config oss_linux --compilation_mode opt
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   ${pkgdir}/usr/share/licenses/mozc/mozc
    install -Dm644 data/installer/credits_en.html               ${pkgdir}/usr/share/licenses/mozc/mozc-submodules

    install -Dm755 bazel-bin/server/mozc_server                 ${pkgdir}/usr/lib/mozc/mozc_server
    install -Dm755 bazel-bin/gui/tool/mozc_tool                 ${pkgdir}/usr/lib/mozc/mozc_tool
}
