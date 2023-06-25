# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

#NOTE: The UT dictionary's project page: http://linuxplayers.g1.xrea.com/mozc-ut.html

### Uncomment the dictionaries you want to include
ENABLED_DICTIONARIES=(
#'alt-cannadic'
#'edict2'
'jawiki'
'neologd'
'personal-names'
'place-names'
#'skk-jisyo'
#'sudachidict'
)

pkgname='mozc-ut'
pkgver=2.29.5135.102.20230625
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
provides=('mozc=2.29.5135.102')
conflicts=('mozc')
options=(!distcc !ccache)
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=cb3150e6d6d2e80e7bfff35944c20510e557dcad"
        'git+https://github.com/utuhiro78/merge-ut-dictionaries.git#commit=e081fbb6ab46007325b3040ddc4f19f02891c2ac'
        'git+https://github.com/utuhiro78/mozcdic-ut-alt-cannadic.git#commit=f59287e569db3e226378380a34e71275654b46d0'
        'git+https://github.com/utuhiro78/mozcdic-ut-edict2.git#commit=384872a301ac9129ad86f6769db7dc1537c64cd6'
        'git+https://github.com/utuhiro78/mozcdic-ut-jawiki.git#commit=d4501eca40cca0edf90e610454357ee535644236'
        'git+https://github.com/utuhiro78/mozcdic-ut-neologd.git#commit=90e59c7707a5fe250c992c10c6ceb08a7ce7e652'
        'git+https://github.com/utuhiro78/mozcdic-ut-personal-names.git#commit=07dea2260f45748386fff4178ffd8686281d8773'
        'git+https://github.com/utuhiro78/mozcdic-ut-place-names.git#commit=4b2e53e3ebf31a1166a1bff26b7537cb70aa8880'
        'git+https://github.com/utuhiro78/mozcdic-ut-skk-jisyo.git#commit=43518e6ea033681580a515281668c85eb74a5b14'
        'git+https://github.com/utuhiro78/mozcdic-ut-sudachidict.git#commit=d09ff222f1562cce5c1f83b2d80c2d93097bf01e'
        'https://dumps.wikimedia.org/jawiki/20230620/jawiki-20230620-all-titles-in-ns0.gz')
noextract=('jawiki-20230620-all-titles-in-ns0.gz')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '7054ec677d1b3f58f8db2f06961a982c21ff95ca372b6e755524d76e7caf4b6c')

prepare() {
    cd ${pkgname}-git/src

    git submodule update --init --recursive

    cd "${srcdir}"/merge-ut-dictionaries/src/

    # Use our local copy of the Mozc repo
    sed -i -e "s|https://raw.githubusercontent.com/google/mozc/master/src|${srcdir}/${pkgname}-git/src|" remove_duplicate_ut_entries.rb

    # Use a dated snapshot for the JAWiki dump data
    sed -i -e '/wget/d' count_word_hits.rb
    sed -i -e "s|filename = \"jawiki-|filename = \"${srcdir}/jawiki-|g" count_word_hits.rb
    sed -i -e 's|jawiki-[a-z0-9]\{6,8\}|jawiki-20230620|g' count_word_hits.rb apply_word_hits.rb

    # Compile the UT dictionary
    printf '\nCompiling the UT dictionary...\n\n'

    [[ -e mozcdic-ut.txt ]] && rm mozcdic-ut.txt

    for dict in "${ENABLED_DICTIONARIES[@]}"
    do
        tar -xf "${srcdir}"/mozcdic-ut-${dict}/mozcdic-ut-${dict}.txt.tar.bz2
        cat mozcdic-ut-${dict}.txt >> mozcdic-ut.txt
    done

    ruby remove_duplicate_ut_entries.rb mozcdic-ut.txt
    ruby count_word_hits.rb
    ruby apply_word_hits.rb mozcdic-ut.txt

    # Append the UT dictionary
    cat mozcdic-ut.txt >> "${srcdir}"/${pkgname}-git/src/data/dictionary_oss/dictionary00.txt
}

build() {
    cd ${pkgname}-git/src

    unset ANDROID_NDK_HOME
    export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
    bazel build server:mozc_server gui/tool:mozc_tool --config oss_linux --compilation_mode opt
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   "${pkgdir}"/usr/share/licenses/mozc/LICENSE
    install -Dm644 data/installer/credits_en.html               "${pkgdir}"/usr/share/licenses/mozc/Submodules

    install -Dm755 bazel-bin/server/mozc_server                 "${pkgdir}"/usr/lib/mozc/mozc_server
    install -Dm755 bazel-bin/gui/tool/mozc_tool                 "${pkgdir}"/usr/lib/mozc/mozc_tool
}
