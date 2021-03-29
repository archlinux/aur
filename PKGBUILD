# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's upstream url: 'http://linuxplayers.g1.xrea.com/mozc-ut.html'


## Helpful internal stuff
_commit=2d434cb612b680cdc1bdaf4b036be606ef3856f0
_mozcver=2.26.4325.102
_utdicver=20210329
_utdicrel=1
_utuserlink=28
_utdiclink=28065
_kenver=202102
_jugyosyover=202102
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
        "https://osdn.net/downloads/users/${_utuserlink}/${_utdiclink}/mozcdic-ut-${_utdicver}.${_utdicrel}.tar.bz2"
        "https://osdn.net/projects/ponsfoot-aur/storage/mozc/ken_all-${_kenver}.zip"
        "https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-${_jugyosyover}.zip")
sha256sums=('SKIP'
            '057c5d1a5c66e7eed20979b7268d651da1999a52469abe2a9eab843d6b1e631f'
            '4529d801c19890f21fb4c2581bafdcb546c3aabd5984715b8e1773692f0293e7'
            '0f832e4a420fb43bc71da881c1e5ea822713d380b2e9d37709b3025198cfbd83')

prepare() {
    cd ${pkgname}-git

    git submodule update --init --recursive

    # Avoid build errors (don't use libc++)
    # These should probably be included as options in GYP_DEFINES
    sed -i -e 's/-stdlib=libc++//' src/gyp/common.gypi
    sed -i -e 's/-lc++//' src/gyp/common.gypi

    # Add the UT dictionary
    cat ${srcdir}/mozcdic-ut-${_utdicver}.${_utdicrel}/mozcdic*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt

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
    install -Dm644 mozcdic-ut-${_utdicver}.${_utdicrel}/COPYING        ${pkgdir}/usr/share/licenses/mozc/ut-dictionary

    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                          ${pkgdir}/usr/share/licenses/mozc/mozc
    install -Dm644 data/installer/credits_en.html                      ${pkgdir}/usr/share/licenses/mozc/mozc-submodules

    install -Dm755 out_linux/${_buildtype}/mozc_server                 ${pkgdir}/usr/lib/mozc/mozc_server
    install -Dm755 out_linux/${_buildtype}/mozc_tool                   ${pkgdir}/usr/lib/mozc/mozc_tool
}
