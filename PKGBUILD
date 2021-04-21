# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's upstream url: 'http://linuxplayers.g1.xrea.com/mozc-ut.html'


## Helpful internal stuff
_commit=b03ab3ff544130d6220a587a781c5ef7d5e07380
_mozcver=2.26.4346.102
_utdicver=20210421
_buildtype=Release

pkgname='ibus-mozc-ut'
pkgver=${_mozcver}.${_utdicver}
pkgrel=1
pkgdesc='Mozc module for IBus bundled with the UT dictionary'
arch=('i686' 'x86_64')
url='https://github.com/google/mozc'
license=('custom')
depends=('ibus>=1.4.1' 'mozc-ut-common')
makedepends=('clang' 'git' 'gtk2' 'ninja' 'pkgconf' 'python' 'python-six' 'qt5-base')
conflicts=('ibus-mozc' 'ibus-mozc-ut2' 'ibus-mozc-ut-united')
provides=("ibus-mozc=${_mozcver}")
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
    cd ${pkgname}-git

    git submodule update --init --recursive

    # Avoid build errors (don't use libc++)
    # These should probably be included as options in GYP_DEFINES
    sed -i -e 's/-stdlib=libc++//' src/gyp/common.gypi
    sed -i -e 's/-lc++//' src/gyp/common.gypi
}

build() {
    cd ${pkgname}-git/src

    _targets='renderer/renderer.gyp:mozc_renderer unix/ibus/ibus.gyp:ibus_mozc'

    GYP_DEFINES='document_dir=/usr/share/licenses/mozc server_dir=/usr/lib/mozc ibus_mozc_path=/usr/lib/ibus-mozc/ibus-engine-mozc ibus_mozc_icon_path=/usr/share/ibus-mozc/icons/ibus-mozc.png'

    python build_mozc.py gyp --target_platform=Linux
    python build_mozc.py build -c ${_buildtype} ${_targets}
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                           ${pkgdir}/usr/share/licenses/mozc/ibus-mozc
    install -Dm644 data/installer/credits_en.html                       ${pkgdir}/usr/share/licenses/mozc/ibus-mozc-submodules

    install -Dm755 out_linux/${_buildtype}/mozc_renderer                ${pkgdir}/usr/lib/mozc/mozc_renderer

    install -Dm755 out_linux/${_buildtype}/ibus_mozc                    ${pkgdir}/usr/lib/ibus-mozc/ibus-engine-mozc
    install -Dm644 out_linux/${_buildtype}/gen/unix/ibus/mozc.xml       ${pkgdir}/usr/share/ibus/component/mozc.xml

    install -Dm644 data/images/unix/ime_product_icon_opensource-32.png  ${pkgdir}/usr/share/ibus-mozc/icons/ibus-mozc.png
    install -Dm644 data/images/unix/ui-tool.png                         ${pkgdir}/usr/share/ibus-mozc/icons/tool.png
    install -Dm644 data/images/unix/ui-properties.png                   ${pkgdir}/usr/share/ibus-mozc/icons/properties.png
    install -Dm644 data/images/unix/ui-dictionary.png                   ${pkgdir}/usr/share/ibus-mozc/icons/dictionary.png
    install -Dm644 data/images/unix/ui-direct.png                       ${pkgdir}/usr/share/ibus-mozc/icons/direct.png
    install -Dm644 data/images/unix/ui-hiragana.png                     ${pkgdir}/usr/share/ibus-mozc/icons/hiragana.png
    install -Dm644 data/images/unix/ui-katakana_half.png                ${pkgdir}/usr/share/ibus-mozc/icons/katakana_half.png
    install -Dm644 data/images/unix/ui-katakana_full.png                ${pkgdir}/usr/share/ibus-mozc/icons/katakana_full.png
    install -Dm644 data/images/unix/ui-alpha_half.png                   ${pkgdir}/usr/share/ibus-mozc/icons/alpha_half.png
    install -Dm644 data/images/unix/ui-alpha_full.png                   ${pkgdir}/usr/share/ibus-mozc/icons/alpha_full.png
}
