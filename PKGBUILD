# Maintainer: Naoya Inada <naoina@kuune.org>
# fcitx-mozc-ut is based on fcitx-mozc and mozc-ut.

##
## Build configuration
##
## ニコニコ大百科IME辞書 (NICONICOPEDIA IME dictionary, see below)
#_NICODIC="true"
#
## If you want to use an English-Japanese dictionary,
## uncomment the following line.
#_EJDIC="true"


#***********************************************************************
# License information:
#
# Mozc:     3-clause BSD
#
# Mozc-UT dictionary
# altcanna, jinmei, skk: GPL
# hatena: unknown
# edict: Creative Commons Attribution-ShareAlike License (V3.0)
# ekimei: redistributable
# zip code: public domain
# niconico: unknown
# Japanese WordNet: See above
# ruby/shell scripts: GPL
#
# ** CAUTION **
# CC-BY-SA (EDICT) is incompatible with GPL (some of the other dic data).
# You should not redistribute the binary of mozc-ut including edict
# (and niconico which unknown license) at least.
#
#***********************************************************************
# Upstreams:
#
# mozc
# http://code.google.com/p/mozc/
#
# Japanese zip code data by Japan Post
# http://www.post.japanpost.jp/zipcode/download.html
#
# Modified zip code data by Ibs
# http://zipcloud.ibsnet.co.jp/
#
# Mozc UT dictionary
# http://www.geocities.jp/ep3797/mozc_01.html
#
#***********************************************************************

## Mozc compile option
_bldtype=Release

_zipcode_rel=201603
_mozcver=2.17.2315.102
_utdicver=20160419
_protobuf_rev=172019c40bf548908ab09bfd276074c929d48415
_gyp_rev=e2e928bacd07fead99a18cb08d64cb24e131d3e5
_jsoncpp_rev=11086dd6a7eba04289944367ca82cea71299ed70
_japanese_usage_dictionary_rev=e5b3425575734c323e1d947009dd74709437b684
_mozc_rev=3306d3314499a54a4064b8b80bbc1bce3f6cfac4
_fonttools_rev=5ba7d98a4153fad57258fca23b0bcb238717aec3
_jsr305_ver=2.0.2

_pkgbase=mozc
pkgname=fcitx-mozc-ut
pkgdesc="Fcitx Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input) with Mozc UT Dictionary (additional dictionary)"
pkgver=${_mozcver}.${_utdicver}
_fcitx_patchver=2.17.2313.102.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.geocities.jp/ep3797/mozc_01.html"
license=('custom')
depends=('qt4' 'fcitx' 'zinnia')
makedepends=('pkg-config' 'python2' 'curl' 'gtk2' 'mesa' 'subversion' 'ninja' 'ruby' 'git' 'clang' 'unzip' 'wget')
replaces=('mozc-fcitx' 'fcitx-mozc')
conflicts=('mozc' 'mozc-server' 'mozc-utils-gui' 'mozc-fcitx' 'mozc-ut' 'fcitx-mozc')
source=(mozc-${_mozcver}::git+https://github.com/google/mozc.git#commit=${_mozc_rev}
        japanese_usage_dictionary::git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git#commit=${_japanese_usage_dictionary_rev}
        git+https://chromium.googlesource.com/external/gyp#commit=${_gyp_rev}
        git+https://github.com/google/protobuf.git#commit=${_protobuf_rev}
        fontTools::git+https://github.com/googlei18n/fonttools.git#commit=${_fonttools_rev}
        "x-ken-all-${_zipcode_rel}.zip::https://www.codeplex.com/Download/Release?ProjectName=naoina&DownloadId=1563797&FileTime=131055899132200000&Build=21031"
        "edict-${_utdicver}.gz::https://www.codeplex.com/Download/Release?ProjectName=naoina&DownloadId=1563799&FileTime=131055899135630000&Build=21031"
        "jigyosyo-${_zipcode_rel}.zip::https://www.codeplex.com/Download/Release?ProjectName=naoina&DownloadId=1563798&FileTime=131055899133630000&Build=21031"
        mozcdic-ut-${_utdicver}.tar.bz2::https://osdn.jp/frs/chamber_redir.php?f=%2Fusers%2F10%2F10777%2Fmozcdic-ut-${_utdicver}.tar.bz2
        EDICT_license.html
        mod-generate-mozc-ut.sh
        http://findbugs.googlecode.com/svn/repos/release-repository/com/google/code/findbugs/jsr305/$_jsr305_ver/jsr305-$_jsr305_ver.jar
        http://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-${_fcitx_patchver}.patch
        http://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-icon.tar.gz)

prepare() {
  cd "${srcdir}/mozcdic-ut-${_utdicver}"

  "${srcdir}"/mod-generate-mozc-ut.sh
  msg "Generating UT dictionary seed..."
  MOZCVER="$_mozcver" DICVER="$_utdicver" NICODIC="$_NICODIC" EJDIC="$_EJDIC" \
    ./generate-mozc-ut.sh
  msg "Done."

  cd "${srcdir}/mozc-ut-${pkgver}"

  # Apply fcitx patch
  rm unix/fcitx -rf
  patch -Np2 -i "$srcdir/fcitx-mozc-${_fcitx_patchver}.patch"

  # Fix qt4 binary path
  sed -i 's|(qt_dir)/bin|(qt_dir)/lib/qt4/bin|' gui/*.gyp{,i}
  sed -i 's|(qt_dir_env)/bin|(qt_dir_env)/lib/qt4/bin|' gui/*.gyp{,i}

  # Adjust to use python2
  find . -name  \*.py        -type f -exec sed -i -e "1s|python.*$|python2|"  {} +
  find . -regex '.*\.gypi?$' -type f -exec sed -i -e "s|'python'|'python2'|g" {} +

  # Generate zip code seed
  msg "Generating zip code seed..."
  python2 dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/x-ken-all.csv" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >> data/dictionary_oss/dictionary09.txt
  msg "Done."

  # Copy third party deps
  cd "$srcdir"
  for dep in gyp protobuf japanese_usage_dictionary fontTools
  do
    cp -a $dep mozc-ut-${pkgver}/third_party/
  done

  install -D jsr305-$_jsr305_ver.jar mozc/src/third_party/jsr305/jsr305-$_jsr305_ver.jar
}

build() {
  # Update: Fix qt4 include path too
  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -I/usr/include/qt4 -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -I/usr/include/qt4 -fvisibility=hidden"

  cd "${srcdir}/mozc-ut-${pkgver}"

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool unix/fcitx/fcitx.gyp:fcitx-mozc"

  QTDIR=/usr GYP_DEFINES="document_dir=/usr/share/licenses/$pkgname use_libzinnia=1" python2 build_mozc.py gyp
  python2 build_mozc.py build -c $_bldtype $_targets

  # Extract license part of mozc
  head -n 29 server/mozc_server.cc > LICENSE
}

package() {
  cd "${srcdir}/mozc-ut-${pkgver}"
  install -D -m 755 out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install    -m 755 out_linux/${_bldtype}/mozc_tool   "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE doc-ut/README data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"
  cd doc-ut/dictionary
  for d in *
  do
    install -d "${pkgdir}/usr/share/licenses/dictionary/${d}"
    install -m 644 "${d}"/* "${pkgdir}/usr/share/licenses/dictionary/${d}"
  done
  install -m 644 ${srcdir}/EDICT_license.html "${pkgdir}/usr/share/licenses/dictionary/edict/license.html"

  cd "${srcdir}/mozc-ut-${pkgver}"
  for mofile in out_linux/${_bldtype}/gen/unix/fcitx/po/*.mo
  do
    filename=`basename $mofile`
    lang=${filename/.mo/}
    install -D -m 644 "$mofile" "${pkgdir}/usr/share/locale/$lang/LC_MESSAGES/fcitx-mozc.mo"
  done

  install -D -m 755 out_linux/${_bldtype}/fcitx-mozc.so "${pkgdir}/usr/lib/fcitx/fcitx-mozc.so"
  install -D -m 644 unix/fcitx/fcitx-mozc.conf "${pkgdir}/usr/share/fcitx/addon/fcitx-mozc.conf"
  install -D -m 644 unix/fcitx/mozc.conf "${pkgdir}/usr/share/fcitx/inputmethod/mozc.conf"

  install -d "${pkgdir}/usr/share/fcitx/mozc/icon"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-alpha_full.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-alpha_full.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-alpha_half.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-alpha_half.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-direct.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-direct.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-hiragana.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-hiragana.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-katakana_full.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-katakana_full.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-katakana_half.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-katakana_half.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-dictionary.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-dictionary.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-properties.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-properties.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-tool.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-tool.png"
}
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'faa70a8454cc59aae23f137b7789975e3733f06811056b9132d281ade67c98f93229785fca55aa3ffa1484d4109241c708a084e01173c8ba67cce310e551daa1'
            '1eda172040227f56c4f4702457d49d14be85dc1b3d0208da04a3ff9b7936a995119d33929159a6f1d06ca09d7a2d7ca08cc485dee8620217199fa350388299fb'
            '744559bb7ca5159f57cc51f435b6661a4eb3bdaf5c268e4fc05c017e30820091fbb797b894d6072f6d095c03f75fd573e9232d12e3b397800d30901c90f28cd8'
            '29e36fd857ed34ab27257cc40fd8bd6a666a267b57b5b3037c4ce6f10092999c78000489950758a84cf9a0265c5e4fda9ac388ada651d81e75d5df74d3307195'
            '4899c7ee01e387c7c5c628356a0b32e7ba28643580701b779138361ca657864ec17ae0f38d298d60e44093e52a3dfe37d922f780b791e3bd17fc4f056f22dbbb'
            '3b8d49eb8f6fff7443de48f10d6af122c08cef89c9ddf33857ba13b294fbad3e727a26067196cd249fe61ab4dd0d9ca8d7f8c64226a7f59580e5bd21e7b208eb'
            'b3b832489ef9249b22d8a0b9d6eee1895c9d93ef53d5968724a65184cb3f04e17cc74938128b98916da7829c6566be0bc6d60fa8801248cc24620730a060eac6'
            'a9a3ca5dba636c84d216a0a3574e5132d0e6ca69e913ccd5f1a1716af238ea34d5100a4b5d42bbd0c12649780b6009f4533e848e86050e51c22dc8859badd615'
            '5507c637e5a65c44ccf6e32118b6d16647ece865171b9a77dd3c78e6790fbd97e6b219e68d2e27750e22074eb536bccf8d553c295d939066b72994b86b2f251a')
