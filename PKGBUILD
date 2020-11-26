# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's upstream url: 'http://linuxplayers.g1.xrea.com/mozc-ut.html'


## Helpful internal stuff
_commit=e769997e0eff37676c78fb53b122ff79b2fb99b2
_major=2
_minor=26
_build=4200
_revision=100
_mozcver=${_major}.${_minor}.${_build}.${_revision}
_utdicdate=20201110
_utdicrel=1
_bldtype=Release

pkgname='mozc-ut-common'
pkgver=${_mozcver}.${_utdicdate}
pkgrel=1
pkgdesc='The Open Source edition of Google Japanese Input bundled with the UT dictionary'
arch=('i686' 'x86_64')
url='https://github.com/google/mozc'
license=('custom')
depends=('qt5-base' 'zinnia')
makedepends=('clang' 'git' 'gtk2' 'ninja' 'pkgconf' 'python' 'python-six')
optdepends=('tegaki-models-zinnia-japanese: character models for the handwriting tool')
conflicts=('mozc' 'mozc-ut' 'mozc-ut2' 'mozc-neologd-ut' 'mozc-neologd-ut+ut2' 'mozc-ut-unified' 'mozc-ut-united')
provides=("mozc=${_mozcver}" "mozc-ut=${_mozcver}.${_utdicdate}")
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=${_commit}"
        "https://osdn.net/downloads/users/26/26897/mozcdic-ut-${_utdicdate}.${_utdicrel}.tar.bz2"
        "https://osdn.net/projects/ponsfoot-aur/storage/mozc/ken_all-202010.zip"
        "https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-202010.zip")
sha256sums=('SKIP'
            'bc40c1f4798a8d5c39325201376277289f8228491101195c85d748efbf3e0ffc'
            '95e68670e52baab93f804a643a454840079ba7d6522b21c83e01dd6dfc7b75b8'
            '57fbd2fdf5023dc1158260e6ac9ed98e63609cd14f86e74ae223f1bcb5ca852b')

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

    GYP_DEFINES='use_libzinnia=1 document_dir=/usr/share/licenses/mozc'

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
