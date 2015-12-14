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

_zipcode_rel=201511
_mozcver=2.17.2106.102
_utdicver=20151130
_protobuf_rev=172019c40bf548908ab09bfd276074c929d48415
_gyp_rev=cdf037c1edc0ba3b5d25f8e3973661efe00980cc
_jsoncpp_rev=11086dd6a7eba04289944367ca82cea71299ed70
_japanese_usage_dictionary_rev=10
_mozc_rev=3648b9bf06d5d9b36bed2425640bfd18ae05b588
_fonttools_rev=5ba7d98a4153fad57258fca23b0bcb238717aec3
_jsr305_ver=2.0.2

_pkgbase=mozc
pkgname=fcitx-mozc-ut
pkgdesc="Fcitx Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input) with Mozc UT Dictionary (additional dictionary)"
pkgver=${_mozcver}.${_utdicver}
_fcitx_patchver=2.17.2102.102.1
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.geocities.jp/ep3797/mozc_01.html"
license=('custom')
depends=('qt4' 'fcitx' 'zinnia')
makedepends=('pkg-config' 'python2' 'curl' 'gtk2' 'mesa' 'subversion' 'ninja' 'ruby' 'git' 'clang')
replaces=('mozc-fcitx' 'fcitx-mozc')
conflicts=('mozc' 'mozc-server' 'mozc-utils-gui' 'mozc-fcitx' 'mozc-ut' 'fcitx-mozc')
source=(mozc-${_mozcver}::git+https://github.com/google/mozc.git#commit=${_mozc_rev}
        jsoncpp::git+https://github.com/open-source-parsers/jsoncpp.git#commit=${_jsoncpp_rev}
        japanese_usage_dictionary::svn+http://japanese-usage-dictionary.googlecode.com/svn/trunk#revision=$_japanese_usage_dictionary_rev
        gyp::git+https://chromium.googlesource.com/external/gyp#commit=${_gyp_rev}
        protobuf::git+https://github.com/google/protobuf.git#commit=${_protobuf_rev}
        fontTools::git+https://github.com/googlei18n/fonttools.git#commit=${_fonttools_rev}
        "x-ken-all-${_zipcode_rel}.zip::http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=naoina&DownloadId=1527310&FileTime=130941443058430000&Build=21031"
        "edict-${_utdicver}.gz::http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=naoina&DownloadId=1527309&FileTime=130941443051900000&Build=21031"
        "jigyosyo-${_zipcode_rel}.zip::http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=naoina&DownloadId=1527311&FileTime=130941443059370000&Build=21031"
        mozcdic-ut-${_utdicver}.tar.bz2::http://osdn.jp/frs/chamber_redir.php?f=%2Fusers%2F9%2F9619%2Fmozcdic-ut-${_utdicver}.tar.bz2
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
  for dep in jsoncpp gyp protobuf japanese_usage_dictionary fontTools
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
            'SKIP'
            'bacb68bc64dd62322d332f38babf3c9933bf4a113081d795c8bc7e33a8e8e4e3e47320fd520f522c55830f519337c828c115ddb3275ace3076ebff4480b20805'
            'ded925d2b921c228911b3f8c1d63276ce764e670b2654f6c11a8792cf860f9439910ae7276ff2a10d798af6d836ce3ff1520fb99f365125f311dde64e99e4dba'
            '9ebc0565366533ade36c5af19e47165641bb4d75393f87ba971e27d5bed038795731cb7426d769740ebf6cc3b91ca7c1f5cab200ac82097a3f880414a220d166'
            'dde61d78c2ecd65f6029dfe72e4f9cc26318c8e5f41eaf7dbe981fbd2b066fbc09bf4763c77d11effa54e45a378f50273a53ce494969ef78659b9a93a9d8b430'
            '4899c7ee01e387c7c5c628356a0b32e7ba28643580701b779138361ca657864ec17ae0f38d298d60e44093e52a3dfe37d922f780b791e3bd17fc4f056f22dbbb'
            '4668967b324261b4643cf4876a65f82a7157df140ca9fa0aa89d5cd39c87961eeabfbe63b20a2acc393acdff6c6284477d47f5a1d4967db64e0521c65ef9c0e4'
            'b3b832489ef9249b22d8a0b9d6eee1895c9d93ef53d5968724a65184cb3f04e17cc74938128b98916da7829c6566be0bc6d60fa8801248cc24620730a060eac6'
            '096673f036d236d262c05d7b0625504024899d8208c7c4ecd1250dff05dcedb2f066e8c96e05241f66c846931dab6ac466927f1a0339467c7ef4808883a36ee1'
            '5507c637e5a65c44ccf6e32118b6d16647ece865171b9a77dd3c78e6790fbd97e6b219e68d2e27750e22074eb536bccf8d553c295d939066b72994b86b2f251a')
