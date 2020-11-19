# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's upstream url: 'http://linuxplayers.g1.xrea.com/mozc-ut.html'


## Helpful internal stuff
_commit=cfd05a0907d4ff95a15cc6fe2d4d56ed480f4002
_mozcver=2.25.4190.102
_utdicdate=20201110
_utdicrel=1
_bldtype=Release

pkgbase='ibus-mozc-ut'
pkgname=('ibus-mozc-ut' 'mozc-ut-common')
pkgver=${_mozcver}.${_utdicdate}
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/google/mozc'
license=('custom')
makedepends=('git' 'clang' 'ninja' 'pkg-config' 'python' 'gtk2' 'qt5-base' 'ibus>=1.4.1')
source=("${pkgbase}-git::git+https://github.com/google/mozc.git#commit=${_commit}"
        "https://osdn.net/downloads/users/26/26897/mozcdic-ut-${_utdicdate}.${_utdicrel}.tar.bz2")
sha256sums=('SKIP'
            'bc40c1f4798a8d5c39325201376277289f8228491101195c85d748efbf3e0ffc')

prepare() {
    cd ${pkgbase}-git

    git submodule update --init --recursive

    # Avoid build errors (don't use libc++)
    # These should probably be included as options in GYP_DEFINES
    sed -i -e 's/-stdlib=libc++//' src/gyp/common.gypi
    sed -i -e 's/-lc++//' src/gyp/common.gypi

    # Add the UT dictionary
    cat ${srcdir}/mozcdic-ut-${_utdicdate}.${_utdicrel}/mozcdic*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt
}

build() {
    cd ${pkgbase}-git/src

    _targets='server/server.gyp:mozc_server gui/gui.gyp:mozc_tool renderer/renderer.gyp:mozc_renderer unix/ibus/ibus.gyp:ibus_mozc'

    GYP_DEFINES='document_dir=/usr/share/licenses/mozc ibus_mozc_path=/usr/lib/ibus-mozc/ibus-engine-mozc ibus_mozc_icon_path=/usr/share/ibus-mozc/icons/ibus-mozc.png'

    python build_mozc.py gyp --target_platform=Linux
    python build_mozc.py build -c ${_bldtype} ${_targets}
}

package_ibus-mozc-ut() {
    pkgdesc='Mozc module for IBus bundled with the UT dictionary'
    depends=('mozc-ut-common' 'ibus>=1.4.1')
    conflicts=('ibus-mozc' 'ibus-mozc-ut2' 'ibus-mozc-ut-united')
    provides=("ibus-mozc=${_mozcver}")

    cd ${pkgbase}-git/src

    install -Dm755 out_linux/${_bldtype}/mozc_renderer                  ${pkgdir}/usr/lib/mozc/mozc_renderer

    install -Dm755 out_linux/${_bldtype}/ibus_mozc                      ${pkgdir}/usr/lib/ibus-mozc/ibus-engine-mozc
    install -Dm644 out_linux/${_bldtype}/gen/unix/ibus/mozc.xml         ${pkgdir}/usr/share/ibus/component/mozc.xml

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

package_mozc-ut-common() {
    pkgdesc='The Open Source edition of Google Japanese Input bundled with the UT dictionary'
    depends=('qt5-base')
    conflicts=('mozc' 'mozc-ut' 'mozc-ut2' 'mozc-neologd-ut' 'mozc-neologd-ut+ut2' 'mozc-ut-unified' 'mozc-ut-united')
    provides=("mozc=${_mozcver}" "mozc-ut=${_mozcver}")

    install -Dm644 mozcdic-ut-${_utdicdate}.${_utdicrel}/COPYING        ${pkgdir}/usr/share/licenses/mozc/UT_Dictionary

    cd ${pkgbase}-git/src

    install -Dm644 ../LICENSE                                           ${pkgdir}/usr/share/licenses/mozc/Mozc
    install -Dm644 data/installer/credits_en.html                       ${pkgdir}/usr/share/licenses/mozc/Submodules

    install -Dm755 out_linux/${_bldtype}/mozc_server                    ${pkgdir}/usr/lib/mozc/mozc_server
    install -Dm755 out_linux/${_bldtype}/mozc_tool                      ${pkgdir}/usr/lib/mozc/mozc_tool
}
