# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's upstream url: 'http://linuxplayers.g1.xrea.com/mozc-ut.html'


## Helpful internal stuff
_commit=467a91c5b237ef9f519075b42e7c4585281e168f
_mozcver=2.26.4318.102
_utdicver=20210322
_utdicrel=1
_utdiclink1=28
_utdiclink2=28019
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
        "https://osdn.net/downloads/users/${_utdiclink1}/${_utdiclink2}/mozcdic-ut-${_utdicver}.${_utdicrel}.tar.bz2"
        "https://osdn.net/projects/ponsfoot-aur/storage/mozc/ken_all-${_kenver}.zip"
        "https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-${_jugyosyover}.zip")
sha256sums=('SKIP'
            '4dfaad909e2634621b028261140354608d0e560d369e97b2712ebca72d1456dd'
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
