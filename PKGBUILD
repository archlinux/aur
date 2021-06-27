# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's upstream url: 'http://linuxplayers.g1.xrea.com/mozc-ut.html'


## Helpful internal stuff
_commit=171aebaf3a1fb76d1a460d12c7199bc6fbcec473
_mozcver=2.26.4416.102
_utdicver=20210627

pkgname='ibus-mozc-ut'
pkgver=${_mozcver}.${_utdicver}
pkgrel=1
pkgdesc='Mozc module for IBus bundled with the UT dictionary'
arch=('i686' 'x86_64')
url='https://github.com/google/mozc'
license=('custom')
depends=('ibus>=1.4.1' 'mozc-ut-common')
makedepends=('bazel' 'git' 'pkgconf' 'python' 'python-six' 'qt5-base')
conflicts=('ibus-mozc' 'ibus-mozc-ut2' 'ibus-mozc-ut-united')
provides=("ibus-mozc=${_mozcver}")
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
    cd ${pkgname}-git

    git submodule update --init --recursive

    # Fix the Qt5 include path
    sed -i -e 's/x86_64-linux-gnu\/qt5/qt/' src/config.bzl

    # Fix the GLib include path
    sed -i -e 's/x86_64-linux-gnu\/glib/glib/' src/BUILD.ibus
}

build() {
    cd ${pkgname}-git/src

    env PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH" bazel build renderer:mozc_renderer unix/ibus:ibus_mozc unix/icons --config oss_linux --compilation_mode opt
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   ${pkgdir}/usr/share/licenses/mozc/ibus-mozc
    install -Dm644 data/installer/credits_en.html               ${pkgdir}/usr/share/licenses/mozc/ibus-mozc-submodules

    install -Dm755 bazel-bin/renderer/mozc_renderer             ${pkgdir}/usr/lib/mozc/mozc_renderer

    install -Dm755 bazel-bin/unix/ibus/ibus_mozc                ${pkgdir}/usr/lib/ibus-mozc/ibus-engine-mozc
    install -Dm644 bazel-bin/unix/ibus/mozc.xml                 ${pkgdir}/usr/share/ibus/component/mozc.xml

    cd bazel-bin/unix

    unzip -o icons.zip

    install -Dm644 mozc.png                                     ${pkgdir}/usr/share/ibus-mozc/product_icon.png
    install -Dm644 alpha_full.png                               ${pkgdir}/usr/share/ibus-mozc/alpha_full.png
    install -Dm644 alpha_half.png                               ${pkgdir}/usr/share/ibus-mozc/alpha_half.png
    install -Dm644 direct.png                                   ${pkgdir}/usr/share/ibus-mozc/direct.png
    install -Dm644 hiragana.png                                 ${pkgdir}/usr/share/ibus-mozc/hiragana.png
    install -Dm644 katakana_full.png                            ${pkgdir}/usr/share/ibus-mozc/katakana_full.png
    install -Dm644 katakana_half.png                            ${pkgdir}/usr/share/ibus-mozc/katakana_half.png
    install -Dm644 dictionary.png                               ${pkgdir}/usr/share/ibus-mozc/dictionary.png
    install -Dm644 properties.png                               ${pkgdir}/usr/share/ibus-mozc/properties.png
    install -Dm644 tool.png                                     ${pkgdir}/usr/share/ibus-mozc/tool.png
}
