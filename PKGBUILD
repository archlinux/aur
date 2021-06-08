# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's upstream url: 'http://linuxplayers.g1.xrea.com/mozc-ut.html'


## Helpful internal stuff
_commit=d031469630c70188c20598c0f3a3c3c46c6c7a14
_mozcver=2.26.4395.102
_utdicver=20210603
_utdicrel=
_utuserlink=30
_utdiclink=30562
_kenver=202105
_jugyosyover=202105
_buildtype=Release

pkgname='mozc-ut-common'
pkgver=${_mozcver}.${_utdicver}
pkgrel=1
pkgdesc='The Open Source edition of Google Japanese Input bundled with the UT dictionary'
arch=('i686' 'x86_64')
url='https://github.com/google/mozc'
license=('custom')
depends=('qt5-base')
makedepends=('clang' 'git' 'gtk2' 'ninja' 'pkgconf' 'python' 'python-six')
conflicts=('mozc' 'mozc-ut' 'mozc-ut2' 'mozc-neologd-ut' 'mozc-neologd-ut+ut2' 'mozc-ut-unified' 'mozc-ut-united')
provides=("mozc=${_mozcver}" "mozc-ut=${_mozcver}.${_utdicver}")
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=${_commit}"
#        "https://osdn.net/downloads/users/${_utuserlink}/${_utdiclink}/mozcdic-ut-${_utdicver}.${_utdicrel}.tar.bz2"
        "https://osdn.net/downloads/users/${_utuserlink}/${_utdiclink}/mozcdic-ut-${_utdicver}.tar.bz2"
        "https://osdn.net/projects/ponsfoot-aur/storage/mozc/ken_all-${_kenver}.zip"
        "https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-${_jugyosyover}.zip")
sha256sums=('SKIP'
            '46303f6d2ecc77a990834d5ae0607b52a4e7cb8cc512fc9f266861d777b4c192'
            '659d7faa3e12b09721d45eb44c3f79d0b63c018ae71d9d745d9b23d2cd0d1d6e'
            '0121dc4983dfca149df74c715f86c14f8dba21aaa6fd163b3cda021b94cf916f')

prepare() {
    cd ${pkgname}-git

    git submodule update --init --recursive

    # Fix for GCC11 compatibility
    # Based on original patch found at https://yanqiyu.fedorapeople.org/fcitx5-mozc/fix-build-gcc11.patch
    sed -i -e 's/#include <array>/#include <array>\n#include <limits>/' src/third_party/abseil-cpp/absl/synchronization/internal/graphcycles.cc

    # Avoid build errors (don't use libc++)
    # These should probably be included as options in GYP_DEFINES
    sed -i -e 's/-stdlib=libc++//' src/gyp/common.gypi
    sed -i -e 's/-lc++//' src/gyp/common.gypi

    # Add the UT dictionary
    #cat ${srcdir}/mozcdic-ut-${_utdicver}.${_utdicrel}/mozcdic*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt
    cat ${srcdir}/mozcdic-ut-${_utdicver}/mozcdic*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt

    # Add latest ZIP codes
    PYTHONPATH="${PYTHONPATH}:src/" \
    python src/dictionary/gen_zip_code_seed.py --zip_code=${srcdir}/KEN_ALL.CSV --jigyosyo=${srcdir}/JIGYOSYO.CSV >> src/data/dictionary_oss/dictionary09.txt
}

build() {
    cd ${pkgname}-git/src

    _targets='server/server.gyp:mozc_server gui/gui.gyp:mozc_tool'

    GYP_DEFINES='document_dir=/usr/share/licenses/mozc'

    python build_mozc.py gyp --target_platform=Linux
    python build_mozc.py build -c ${_buildtype} ${_targets}
}

package() {
    #install -Dm644 mozcdic-ut-${_utdicver}.${_utdicrel}/COPYING        ${pkgdir}/usr/share/licenses/mozc/ut-dictionary
    install -Dm644 mozcdic-ut-${_utdicver}/COPYING        ${pkgdir}/usr/share/licenses/mozc/ut-dictionary

    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                          ${pkgdir}/usr/share/licenses/mozc/mozc
    install -Dm644 data/installer/credits_en.html                      ${pkgdir}/usr/share/licenses/mozc/mozc-submodules

    install -Dm755 out_linux/${_buildtype}/mozc_server                 ${pkgdir}/usr/lib/mozc/mozc_server
    install -Dm755 out_linux/${_buildtype}/mozc_tool                   ${pkgdir}/usr/lib/mozc/mozc_tool
}
