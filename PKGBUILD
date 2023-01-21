# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

#NOTE: The UT dictionary's project page: http://linuxplayers.g1.xrea.com/mozc-ut.html

### Uncomment the third-party dictionaries you want to be included:
DICTIONARIES=(
#alt-cannadic
#edict2
jawiki
neologd
personal-names
place-names
#skk-jisyo
#sudachidict
)

pkgname='mozc-ut'
pkgver=2.28.4990.102.20230121
pkgrel=1
pkgdesc='The Open Source edition of Google Japanese Input bundled with the UT dictionary'
arch=('x86_64')
url='https://github.com/google/mozc'
license=('Apache' 'BSD' 'CCPL' 'GPL2' 'LGPL' 'MIT' 'custom')
depends=('qt5-base')
makedepends=('bazel' 'git' 'python' 'rsync' 'ruby' 'wget')
optdepends=('fcitx5-mozc-ut: Fcitx5 integration'
            'fcitx-mozc-ut: Fcitx integration'
            'ibus-mozc: IBus integration'
            'emacs-mozc: Emacs integration')
provides=('mozc=2.28.4990.102')
conflicts=('mozc')
options=(!distcc !ccache)
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=811cb8c7606a4732a83abb89752664eb23728623"
        'git+https://github.com/utuhiro78/merge-ut-dictionaries.git#commit=c174159285922e6674b496a6596e14045ea51244'
        'git+https://github.com/utuhiro78/mozcdic-ut-alt-cannadic.git#commit=ea403663e9d98d8305123b5ee11c4662e4257b61'
        'git+https://github.com/utuhiro78/mozcdic-ut-edict2.git#commit=8cb88cdfe0db973bbd7710abbd7f1779d50c2ed6'
        'git+https://github.com/utuhiro78/mozcdic-ut-jawiki.git#commit=57fa28e51e848a762a5d13a1a97d297e926710d2'
        'git+https://github.com/utuhiro78/mozcdic-ut-neologd.git#commit=38d938ac3aad4a7bef07fed1eb14aee6f5a7012e'
        'git+https://github.com/utuhiro78/mozcdic-ut-personal-names.git#commit=d617e438add7bb3577c406be40296d84ece4234b'
        'git+https://github.com/utuhiro78/mozcdic-ut-place-names.git#commit=2dbf6cd3c8e86d2ad239afc5ad1184d68c5c83b1'
        'git+https://github.com/utuhiro78/mozcdic-ut-skk-jisyo.git#commit=74e460efea78681ec4f9cf60ab1e97ac53e61a2d'
        'git+https://github.com/utuhiro78/mozcdic-ut-sudachidict.git#commit=17b7efbe1ffe9ef57f9bfd4a70b9c0a14e67e888')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd ${pkgname}-git/src

    git submodule update --init --recursive

    # Generate the UT dictionary
    cd ${srcdir}/merge-ut-dictionaries/src/

    sed -i -e 's|^\([a-z_]*\)="true"|#\1="true"|g' make.sh
    sed -i -e 's|edict=|edict2=|g' make.sh

    for dict in "${DICTIONARIES[@]}"
    do
        sed -i -e "s|#${dict//-/_}=\"true\"|${dict//-/_}=\"true\"|g" make.sh
        cp ${srcdir}/mozcdic-ut-${dict}/mozcdic-ut-${dict}.txt.tar.bz2 .
        tar -xf mozcdic-ut-${dict}.txt.tar.bz2
    done

    sh ./make.sh

    # Append the UT dictionary
    cat ${srcdir}/merge-ut-dictionaries/src/mozcdic-ut.txt >> ${srcdir}/${pkgname}-git/src/data/dictionary_oss/dictionary00.txt
}

build() {
    cd ${pkgname}-git/src

    unset ANDROID_NDK_HOME
    export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
    bazel build server:mozc_server gui/tool:mozc_tool --config oss_linux --compilation_mode opt
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   ${pkgdir}/usr/share/licenses/mozc/LICENSE
    install -Dm644 data/installer/credits_en.html               ${pkgdir}/usr/share/licenses/mozc/Submodules

    install -Dm755 bazel-bin/server/mozc_server                 ${pkgdir}/usr/lib/mozc/mozc_server
    install -Dm755 bazel-bin/gui/tool/mozc_tool                 ${pkgdir}/usr/lib/mozc/mozc_tool
}
