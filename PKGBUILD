# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname='ibus-mozc'
pkgver=2.29.5400.102
pkgrel=3
pkgdesc='Mozc module for IBus'
arch=('x86_64')
url='https://github.com/google/mozc'
license=('Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND NAIST-2003 AND Unicode-3.0 AND LicenseRef-Okinawa-Dictionary')
depends=('ibus>=1.4.1' 'mozc>=2.29.5400.102')
makedepends=('bazel' 'git' 'python' 'qt6-base')
options=(!distcc !ccache)
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=e87c83febda07ffd93fcbfc4ea67562f40423005")
sha256sums=('SKIP')

prepare() {
    cd ${pkgname}-git/src

    git submodule update --init --recursive
}

build() {
    cd ${pkgname}-git/src

    unset ANDROID_NDK_HOME
    unset ANDROID_HOME
    export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
    bazel build renderer/qt:mozc_renderer unix/ibus:ibus_mozc unix/icons --config oss_linux --compilation_mode opt
}

package() {
    cd ${pkgname}-git/src

    # BSD-3-Clause
    sed -n 67,94p data/installer/credits_en.html > Mozc
    install -Dm644 Mozc "${pkgdir}"/usr/share/licenses/${pkgname}/Mozc
    # BSD-3-Clause
    sed -n 317,344p data/installer/credits_en.html > Breakpad
    install -Dm644 Breakpad "${pkgdir}"/usr/share/licenses/${pkgname}/Breakpad
    # NAIST-2003
    sed -n 355,424p data/installer/credits_en.html > IPAdic
    install -Dm644 IPAdic "${pkgdir}"/usr/share/licenses/${pkgname}/IPAdic
    # BSD-2-Clause
    sed -n 435,457p data/installer/credits_en.html > Japanese-Usage-Dictionary
    install -Dm644 Japanese-Usage-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Japanese-Usage-Dictionary
    # Public Domain Data
    sed -n 468,470p data/installer/credits_en.html > Okinawa-Dictionary
    install -Dm644 Okinawa-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Okinawa-Dictionary
    # BSD-3-Clause
    sed -n 481,513p data/installer/credits_en.html > Protocol-Buffers
    install -Dm644 Protocol-Buffers "${pkgdir}"/usr/share/licenses/${pkgname}/Protocol-Buffers
    # MIT
    sed -n 698,704p data/installer/credits_en.html > Tamachi-Phonetic-Kanji-Alphabet
    install -Dm644 Tamachi-Phonetic-Kanji-Alphabet "${pkgdir}"/usr/share/licenses/${pkgname}/Tamachi-Phonetic-Kanji-Alphabet
    # MIT
    sed -n 762,782p data/installer/credits_en.html > Windows-Implementation-Library
    sed -i -e 's|^[ \t]*||g' Windows-Implementation-Library
    install -Dm644 Windows-Implementation-Library "${pkgdir}"/usr/share/licenses/${pkgname}/Windows-Implementation-Library

    install -Dm755 bazel-bin/renderer/qt/mozc_renderer "${pkgdir}"/usr/lib/mozc/mozc_renderer

    install -Dm755 bazel-bin/unix/ibus/ibus_mozc "${pkgdir}"/usr/lib/${pkgname}/ibus-engine-mozc
    install -Dm644 bazel-bin/unix/ibus/mozc.xml "${pkgdir}"/usr/share/ibus/component/mozc.xml

    cd bazel-bin/unix

    unzip -o icons.zip

    install -Dm644 mozc.png                         "${pkgdir}"/usr/share/${pkgname}/product_icon.png
    install -Dm644 alpha_full.svg                   "${pkgdir}"/usr/share/${pkgname}/alpha_full.svg
    install -Dm644 alpha_half.svg                   "${pkgdir}"/usr/share/${pkgname}/alpha_half.svg
    install -Dm644 direct.svg                       "${pkgdir}"/usr/share/${pkgname}/direct.svg
    install -Dm644 hiragana.svg                     "${pkgdir}"/usr/share/${pkgname}/hiragana.svg
    install -Dm644 katakana_full.svg                "${pkgdir}"/usr/share/${pkgname}/katakana_full.svg
    install -Dm644 katakana_half.svg                "${pkgdir}"/usr/share/${pkgname}/katakana_half.svg
    install -Dm644 outlined/dictionary.svg          "${pkgdir}"/usr/share/${pkgname}/dictionary.svg
    install -Dm644 outlined/properties.svg          "${pkgdir}"/usr/share/${pkgname}/properties.svg
    install -Dm644 outlined/tool.svg                "${pkgdir}"/usr/share/${pkgname}/tool.svg
}
