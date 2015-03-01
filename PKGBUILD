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

_zipcode_rel=201412

_mozcver=2.16.2037.102
_utdicver=20150214
_protobuf_rev=172019c40bf548908ab09bfd276074c929d48415
_gyp_rev=2012
_jsoncpp_rev=11086dd6a7eba04289944367ca82cea71299ed70
_japanese_usage_dictionary_rev=10
_mozc_rev=510

_pkgbase=mozc
pkgname=fcitx-mozc-ut
pkgdesc="Fcitx Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input) with Mozc UT Dictionary (additional dictionary)"
pkgver=${_mozcver}.${_utdicver}
_patchver=${_mozcver}.2
#_patchver=1.15.1834.102.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.geocities.jp/ep3797/mozc_01.html"
license=('custom')
depends=('qt4' 'fcitx' 'zinnia')
makedepends=('pkg-config' 'python2' 'gtest' 'curl' 'gtk2' 'mesa' 'subversion' 'ninja' 'ruby' 'git' 'clang')
replaces=('mozc-fcitx' 'fcitx-mozc')
conflicts=('mozc' 'mozc-server' 'mozc-utils-gui' 'mozc-fcitx' 'mozc-ut' 'fcitx-mozc')
source=(mozc-${_mozcver}::svn+http://mozc.googlecode.com/svn/trunk/src#revision=$_mozc_rev
        jsoncpp::git+https://github.com/open-source-parsers/jsoncpp.git#commit=${_jsoncpp_rev}
        japanese_usage_dictionary::svn+http://japanese-usage-dictionary.googlecode.com/svn/trunk#revision=$_japanese_usage_dictionary_rev
        gyp::svn+http://gyp.googlecode.com/svn/trunk#revision=$_gyp_rev
        git+https://github.com/google/protobuf.git#commit=${_protobuf_rev}
        http://downloads.sourceforge.net/project/mdk-ut/30-source/source/mozcdic-ut-${_utdicver}.tar.bz2
        http://downloads.sourceforge.net/project/pnsft-aur/mozc/edict-${_utdicver}.gz
        EDICT_license.html
        mod-generate-mozc-ut.sh
        http://downloads.sourceforge.net/pnsft-aur/x-ken-all-${_zipcode_rel}.zip
        http://downloads.sourceforge.net/pnsft-aur/jigyosyo-${_zipcode_rel}.zip
        http://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-${_patchver}.patch
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
  patch -Np2 -i "$srcdir/fcitx-mozc-${_patchver}.patch"

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
  for dep in jsoncpp gyp protobuf japanese_usage_dictionary
  do
    cp -a $dep mozc-ut-${pkgver}/third_party/
  done
}

build() {
  # Update: Fix qt4 include path too
  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -I/usr/include/qt4 -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -I/usr/include/qt4 -fvisibility=hidden"

  cd "${srcdir}/mozc-ut-${pkgver}"

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool unix/fcitx/fcitx.gyp:fcitx-mozc"

  QTDIR=/usr GYP_DEFINES="document_dir=/usr/share/licenses/$pkgname" python2 build_mozc.py gyp
  python2 build_mozc.py build -c $_bldtype -j 8 $_targets

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
            '7f21d3761531399e8b05bd307ed425da290c6a3024cbf60534a392c4d5b160ca56d3c2b934becf455808e476a6bbaac1f9b5c7178bc1336fdb88d4d59213e659'
            '3e1d08de98efff39f8fce81975deec8b0e3a2d66b6eba36c3d9d496b8ed62460147e6b7c845f9359b99da74a38f7f106ea164a96d8d885dedd7c35a255b90e0a'
            '4899c7ee01e387c7c5c628356a0b32e7ba28643580701b779138361ca657864ec17ae0f38d298d60e44093e52a3dfe37d922f780b791e3bd17fc4f056f22dbbb'
            'f74d2ddf95706b2925d87b3effa9490aa7cba1f5ce2c20e537f2ac4dfc4c6b6b531f90f8c128bca0f1eafd9197abb6e1f004c11a1ea7a978b2ccad5e85ad0d55'
            '6718acd4d44ca8a9f84c4a847bf82d6b7c8ea3b8e67c92f3e404f3d7bc7f90148c09043f7eddec7125418315a006fb223d6c8b92cd1d4896c7803f2dc1a15ae4'
            '56661cd19f46a1211e7c2c104da61e07b0217c7f296917f0a3d8f62e340c279d3567058f9bb56d64c1c05d2a2c457ce2ffe7c730c790870a75b2c2fdebdbab01'
            '22b885859588bb8e0efd354d153da461a654203729c723156a419bf33fae473e3f7165964aa3cb3b5c969f97c2727f9d87b0d587330e4eeab67f07d4458542a3'
            '5507c637e5a65c44ccf6e32118b6d16647ece865171b9a77dd3c78e6790fbd97e6b219e68d2e27750e22074eb536bccf8d553c295d939066b72994b86b2f251a')
