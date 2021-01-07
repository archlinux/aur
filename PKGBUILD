# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's upstream url: 'http://linuxplayers.g1.xrea.com/mozc-ut.html'


## Helpful internal stuff
_commit=1f4fa17372bd196e87042738a16ab08bf904bcbf
_major=2
_minor=26
_build=4237
_revision=102
_mozcver=${_major}.${_minor}.${_build}.${_revision}
_utdicdate=20201229
_utdicrel=1
_kendate=202012
_jugyosyodate=202012
_bldtype=Release

pkgname='mozc-ut-common'
pkgver=${_mozcver}.${_utdicdate}
pkgrel=1
pkgdesc='The Open Source edition of Google Japanese Input bundled with the UT dictionary'
arch=('i686' 'x86_64')
url='https://github.com/google/mozc'
license=('custom')
depends=('qt5-base')
makedepends=('clang' 'git' 'gtk2' 'ninja' 'pkgconf' 'python' 'python-six')
conflicts=('mozc' 'mozc-ut' 'mozc-ut2' 'mozc-neologd-ut' 'mozc-neologd-ut+ut2' 'mozc-ut-unified' 'mozc-ut-united')
provides=("mozc=${_mozcver}" "mozc-ut=${_mozcver}.${_utdicdate}")
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=${_commit}"
        "https://osdn.net/downloads/users/27/27013/mozcdic-ut-${_utdicdate}.${_utdicrel}.tar.bz2"
        "https://osdn.net/projects/ponsfoot-aur/storage/mozc/ken_all-${_kendate}.zip"
        "https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-${_jugyosyodate}.zip")
sha256sums=('SKIP'
            'd8f82541bc05b0c822f793cfa756f394db5084108848047a8663c06639ed0b12'
            'f6c15add56af8ded9a5e66c0f6643d79c2f36733a879543528b4313e4e1a1d14'
            'c6eca7f6da19420ebc3e7d1b05bd15a838a1aa6c7bcf23e43ebd3c22a49cff1b')

prepare() {
    cd ${pkgname}-git

    git submodule update --init --recursive

    # Avoid build errors (don't use libc++)
    # These should probably be included as options in GYP_DEFINES
    sed -i -e 's/-stdlib=libc++//' src/gyp/common.gypi
    sed -i -e 's/-lc++//' src/gyp/common.gypi

    # Add the UT dictionary
    cat ${srcdir}/mozcdic-ut-${_utdicdate}.${_utdicrel}/mozcdic*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt

    # Add latest ZIP codes
    PYTHONPATH="${PYTHONPATH}:src/" \
    python src/dictionary/gen_zip_code_seed.py --zip_code=${srcdir}/KEN_ALL.CSV --jigyosyo=${srcdir}/JIGYOSYO.CSV >> src/data/dictionary_oss/dictionary09.txt
}

build() {
    cd ${pkgname}-git/src

    _targets='server/server.gyp:mozc_server gui/gui.gyp:mozc_tool'

    GYP_DEFINES='document_dir=/usr/share/licenses/mozc'

    python build_mozc.py gyp --target_platform=Linux
    python build_mozc.py build -c ${_bldtype} ${_targets}
}

package() {    
    install -Dm644 mozcdic-ut-${_utdicdate}.${_utdicrel}/COPYING        ${pkgdir}/usr/share/licenses/mozc/ut-dictionary

    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                           ${pkgdir}/usr/share/licenses/mozc/mozc
    install -Dm644 data/installer/credits_en.html                       ${pkgdir}/usr/share/licenses/mozc/mozc-submodules

    install -Dm755 out_linux/${_bldtype}/mozc_server                    ${pkgdir}/usr/lib/mozc/mozc_server
    install -Dm755 out_linux/${_bldtype}/mozc_tool                      ${pkgdir}/usr/lib/mozc/mozc_tool
}
