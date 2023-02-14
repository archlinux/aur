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
pkgver=2.28.5008.102.20230214
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
provides=('mozc=2.28.5008.102')
conflicts=('mozc')
options=(!distcc !ccache)
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=913bb5b968944b9100497698789a65b3f2a5c177"
        'git+https://github.com/utuhiro78/merge-ut-dictionaries.git#commit=ffaf40e56c3a7b317a6b432bf167415fcfb9077b'
        'git+https://github.com/utuhiro78/mozcdic-ut-alt-cannadic.git#commit=f59287e569db3e226378380a34e71275654b46d0'
        'git+https://github.com/utuhiro78/mozcdic-ut-edict2.git#commit=99b4f5a1bd132816a1088c553458ab640e368cdb'
        'git+https://github.com/utuhiro78/mozcdic-ut-jawiki.git#commit=86480c134bac7991977110191a3f5a93cee3690d'
        'git+https://github.com/utuhiro78/mozcdic-ut-neologd.git#commit=f881c1c55c73a53341f9a970487e9a7546070333'
        'git+https://github.com/utuhiro78/mozcdic-ut-personal-names.git#commit=781213c4573d2e4f93d358a08bf581df51387d77'
        'git+https://github.com/utuhiro78/mozcdic-ut-place-names.git#commit=0297d6a941a6cc3ebe78b46bb67fe6d62fddf7ab'
        'git+https://github.com/utuhiro78/mozcdic-ut-skk-jisyo.git#commit=2cbf5b4652ab0f253880258af4aeaf3dd9d7ae09'
        'git+https://github.com/utuhiro78/mozcdic-ut-sudachidict.git#commit=18b1a7710f2e819129c9f5c86a471c881725e26a')
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

    bash ./make.sh

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
