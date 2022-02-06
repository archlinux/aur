# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

# hint: use fc-scan to check the contents of variable fonts
pkgbase=noto-fonts-cjk-vf
pkgname=(noto-fonts-{cjk,{cjk-,}{hk,jp,kr,sc,tc}}-vf)
pkgver=20220126
pkgrel=2
pkgdesc='Google Noto CJK variable fonts'
url='https://www.google.com/get/noto/'
license=(custom:SIL)
arch=(any)
conflicts=(noto-fonts-cjk)
provides=(noto-fonts-cjk)
#_commit=473da44c32fec739db7e5458c81a833513cb4084
_sanscommit=165c01b46ea533872e002e0785ff17e44f6d97d8
_sansver=2.004  # commit/165c01b46ea533872e002e0785ff17e44f6d97d8 from 20210430
                # release notes say that this is the same as 20210428 so suppsedly commit/4d113c550935ffcf450d4255f78c71e4284fce7d
_serifver=2.001  # commit/473da44c32fec739db7e5458c81a833513cb4084 from 20220126
#source=("noto-cjk-${pkgver}.tar.gz::https://github.com/googlefonts/noto-cjk/archive/${_commit}.tar.gz"
source=("noto-cjk-sans-${_sansver}.zip::https://github.com/googlefonts/noto-cjk/releases/download/Sans2.004/01_NotoSansCJK-OTF-VF.zip"
        "NotoSansMonoCJK-VF-${_sansver}.otf.ttc::https://github.com/googlefonts/noto-cjk/raw/${_sanscommit}/Sans/Variable/OTC/NotoSansMonoCJK-VF.otf.ttc"
        "noto-cjk-serif-${_serifver}.zip::https://github.com/googlefonts/noto-cjk/releases/download/Serif2.001/02_NotoSerifCJK-OTF-VF.zip"
        70-noto-{cjk,hk,jp,kr,sc,tc}.conf)
sha256sums=('c3d297e0ca1a78b1f8965b65bac9da4402185dbb02f75111f834fa9b9b290d60'
            '3a73c225abcfd5742ab84e613b427fb5b40c9e59b70fe3d1683f9b1da96568a0'
            'bedeb86226fefd5fd69b54ed4660415861864f879c0b7da08b1fd71ca35a78b0'
            '357e9ed6553087567ec5a28f835db5c43d3cd68a688e4677f759cca465379a32'
            '70f5ad3bd3e3d90c98c6a9ea2f3a28c2564fe18f0d7b8d78926a284cec398fd0'
            '0b5bd14a869234e50b735505e96257cd8e0851031a02735353895b7408abd313'
            '233846410004447b718545aa83a5375400d5e3a0219e79ff0ab50a430aec765b'
            '099e5f2fff526d0d38d57ce5aa0ebd92e0886aaa937f77812f85d63d3e01e53c'
            '42d6a448bae63daba8eb6123a7b5e56683536f82709ed448a0b29c12bdf18e02')
noextract=(noto-cjk-{sans,serif}-*.zip)

_langs=(hk jp kr sc tc)

prepare() {
  mkdir -p noto-cjk/{Sans,Serif}
  bsdtar -xf noto-cjk-sans-${_sansver}.zip -C noto-cjk/Sans --exclude=../LICENSE
  # variable mono otc is missing https://github.com/googlefonts/noto-cjk/issues/214
  cp NotoSansMonoCJK-VF-${_sansver}.otf.ttc noto-cjk/Sans/Variable/OTC/NotoSansMonoCJK-VF.otf.ttc
  bsdtar -xf noto-cjk-serif-${_serifver}.zip -C noto-cjk/Serif --exclude=../LICENSE
  bsdtar -Oxf noto-cjk-sans-${_sansver}.zip ../LICENSE  > noto-cjk/LICENSE
}

package_noto-fonts-cjk-vf(){
  cd noto-cjk
# cd noto-cjk-${_commit}

  for _font in Sans Serif; do
    install -Dm644 \
      ${_font}/Variable/OTC/Noto${_font}CJK-VF.otf.ttc \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto${_font}CJK.ttc

    # mono is available only for sans
    [ "${_font}" = "Sans" ] || continue
    install -Dm644 \
      ${_font}/Variable/OTC/Noto${_font}MonoCJK-VF.otf.ttc \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto${_font}MonoCJK.ttc
  done

  install -Dm644 -t "$pkgdir"/usr/share/fontconfig/conf.avail/ \
    ../70-noto-cjk.conf 
  install -dm755 "$pkgdir"/usr/share/fontconfig/conf.default
  ln -s  -t "$pkgdir"/usr/share/fontconfig/conf.default/ \
    ../conf.avail/70-noto-cjk.conf 

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

_package_locl(){
  conflicts+=(noto-fonts-cjk-vf)
  provides+=(noto-fonts-cjk-vf)

  cd noto-cjk
# cd noto-cjk-${_commit}

  for _font in Sans Serif; do
    install -Dm644 \
      ${_font}/Variable/OTF/Noto${_font}CJK${_lang}-VF.otf \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto${_font}CJK.otf

    # mono is available only for sans
    [ "${_font}" = "Sans" ] || continue
    install -Dm644 \
      ${_font}/Variable/OTF/Mono/Noto${_font}MonoCJK${_lang}-VF.otf \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto${_font}MonoCJK.otf
  done

  install -Dm644 -t "$pkgdir"/usr/share/fontconfig/conf.avail/ \
    ../70-noto-cjk.conf 
  install -dm755 "$pkgdir"/usr/share/fontconfig/conf.default
  ln -s  -t "$pkgdir"/usr/share/fontconfig/conf.default/ \
    ../conf.avail/70-noto-cjk.conf 

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

_package_subset(){
  # the conflict is due to the multi-lingual mono font
  conflicts+=(noto-fonts-cjk-vf)
  provides+=(noto-fonts-cjk-vf)

  cd noto-cjk
# cd noto-cjk-${_commit}

  for _font in Sans Serif; do
    install -Dm644 \
      ${_font}/Variable/OTF/Subset/Noto${_font}${_lang^^}-VF.otf \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto{_font}${_lang^^}.otf

    # mono is available only for sans
    [ "${_font}" = "Sans" ] || continue
    # there are no subset mono fonts, so install the multi-lingual with default locl
    install -Dm644 \
      ${_font}/Variable/OTF/Mono/Noto${_font}MonoCJK${_lang}-VF.otf \
      "$pkgdir"/usr/share/fonts/noto-cjk/Noto${_font}MonoCJK.otf
  done

  install -Dm644 -t "$pkgdir"/usr/share/fontconfig/conf.avail/ \
    ../70-noto-${_lang}.conf 
  install -dm755 "$pkgdir"/usr/share/fontconfig/conf.default
  ln -s  -t "$pkgdir"/usr/share/fontconfig/conf.default/ \
    ../conf.avail/70-noto-${_lang}.conf 

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

package_noto-fonts-cjk-hk-vf(){
  pkgdesc+=' - Traditional Chinese HK as default language (OpenType locl)'

  _lang=hk
  _package_locl
}

package_noto-fonts-cjk-jp-vf(){
  pkgdesc+=' - Japanese as default language (OpenType locl)'

  _lang=jp
  _package_locl
}

package_noto-fonts-cjk-kr-vf(){
  pkgdesc+=' - Korean as default language (OpenType locl)'

  _lang=kr
  _package_locl
}

package_noto-fonts-cjk-sc-vf(){
  pkgdesc+=' - Simplified Chinese as default language (OpenType locl)'

  _lang=sc
  _package_locl
}

package_noto-fonts-cjk-tc-vf(){
  pkgdesc+=' - Traditional Chinese as default language (OpenType locl)'

  _lang=tc
  _package_locl
}

package_noto-fonts-hk-vf(){
  pkgdesc='Google Noto Traditional Chinese HK variable fonts'

  _lang=hk
  _package_subset
}

package_noto-fonts-jp-vf(){
  pkgdesc='Google Noto Japanese variable fonts'

  _lang=jp
  _package_subset
}

package_noto-fonts-kr-vf(){
  pkgdesc='Google Noto Korean variable fonts'

  _lang=kr
  _package_subset
}

package_noto-fonts-sc-vf(){
  pkgdesc='Google Noto Simplified Chinese variable fonts'

  _lang=sc
  _package_subset
}

package_noto-fonts-tc-vf(){
  pkgdesc='Google Noto Traditional Chinese variable fonts'

  _lang=tc
  _package_subset
}
