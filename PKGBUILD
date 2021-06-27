# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Based on original PKGBUILD by: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>


## The UT dictionary's upstream url: 'http://linuxplayers.g1.xrea.com/mozc-ut.html'


## Helpful internal stuff
_commit=171aebaf3a1fb76d1a460d12c7199bc6fbcec473
_mozcver=2.26.4416.102
_utdicver=20210627

pkgname='fcitx5-mozc-ut'
pkgver=${_mozcver}.${_utdicver}
pkgrel=1
pkgdesc='Mozc module for Fcitx5 bundled with the UT dictionary'
arch=('i686' 'x86_64')
url='https://github.com/fcitx/fcitx5'
license=('custom')
depends=('fcitx5' 'mozc-ut-common')
makedepends=('bazel' 'git' 'pkgconf' 'python' 'python-six' 'qt5-base')
optdepends=('fcitx5-configtool')
conflicts=('fcitx-mozc' 'fcitx-mozc-ut2' 'fcitx-mozc-neologd-ut' 'fcitx-mozc-neologd-ut+ut2' 'fcitx-mozc-ut-unified' 'fcitx-mozc-ut-unified-full'
           'fcitx-mozc-ut' 'fcitx5-mozc' 'fcitx5-mozc-git')
provides=("fcitx5-mozc=${_mozcver}")
source=("${pkgname}-git::git+https://github.com/google/mozc.git#commit=${_commit}"
        "fcitx.patch")
sha256sums=('SKIP'
            'd8ba7ccbfed47f8133c916884f2cc20d591b79c3327ba4251564761a21e6d6e4')

prepare() {
    cd ${pkgname}-git

    git submodule update --init --recursive

    # Patch in the out-of-source Fcitx5 target
    patch -Np1 -i ${srcdir}/fcitx.patch

    # Fix the Qt5 include path
    sed -i -e 's/x86_64-linux-gnu\/qt5/qt/' src/config.bzl
}

build() {
    cd ${pkgname}-git/src

    env PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH" bazel build unix/fcitx5:fcitx5-mozc.so unix/icons --config oss_linux --compilation_mode opt
}

package() {
    cd ${pkgname}-git/src

    install -Dm644 ../LICENSE                                   ${pkgdir}/usr/share/licenses/mozc/fcitx5-mozc
    install -Dm644 data/installer/credits_en.html               ${pkgdir}/usr/share/licenses/mozc/fcitx5-mozc-submodules

    install -Dm755 bazel-bin/unix/fcitx5/fcitx5-mozc.so         ${pkgdir}/usr/lib/fcitx5/fcitx5-mozc.so
    install -Dm644 unix/fcitx5/mozc-addon.conf                  ${pkgdir}/usr/share/fcitx5/addon/mozc.conf
    install -Dm644 unix/fcitx5/mozc.conf                        ${pkgdir}/usr/share/fcitx5/inputmethod/mozc.conf

    for pofile in unix/fcitx5/po/*.po
    do
        filename=`basename ${pofile}`
        lang=${filename/.po/}
        mofile=${pofile/.po/.mo}
        msgfmt ${pofile} -o ${mofile}
        install -Dm644 ${mofile} ${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/fcitx5-mozc.mo
    done

    msgfmt --xml -d unix/fcitx5/po/ --template unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml.in -o unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml
    install -Dm644 unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml ${pkgdir}/usr/share/metainfo/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml

    cd bazel-bin/unix

    unzip -o icons.zip

    install -Dm644 mozc.png                                     ${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.fcitx.Fcitx5.fcitx-mozc.png
    install -Dm644 alpha_full.svg                               ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-alpha-full.svg
    install -Dm644 alpha_half.svg                               ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-alpha-half.svg
    install -Dm644 direct.svg                                   ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-direct.svg
    install -Dm644 hiragana.svg                                 ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-hiragana.svg
    install -Dm644 katakana_full.svg                            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-katakana-full.svg
    install -Dm644 katakana_half.svg                            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-katakana-half.svg
    install -Dm644 dictionary.svg                               ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-dictionary.svg
    install -Dm644 properties.svg                               ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-properties.svg
    install -Dm644 tool.svg                                     ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.fcitx.Fcitx5.fcitx-mozc-tool.svg

    ln -s org.fcitx.Fcitx5.fcitx-mozc.png                       ${pkgdir}/usr/share/icons/hicolor/128x128/apps/fcitx-mozc.png
    ln -s org.fcitx.Fcitx5.fcitx-mozc-alpha-full.svg            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-alpha-full.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-alpha-half.svg            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-alpha-half.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-direct.svg                ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-direct.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-hiragana.svg              ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-hiragana.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-katakana-full.svg         ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-katakana-full.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-katakana-half.svg         ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-katakana-half.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-dictionary.svg            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-dictionary.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-properties.svg            ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-properties.svg
    ln -s org.fcitx.Fcitx5.fcitx-mozc-tool.svg                  ${pkgdir}/usr/share/icons/hicolor/scalable/apps/fcitx-mozc-tool.svg
}
