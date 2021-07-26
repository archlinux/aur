# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgbase=noto-fonts-cjk-vf
pkgname=(noto-fonts-{cjk,{cjk-,}{hk,jp,kr,sc,tc}}-vf)
pkgver=20210430
pkgrel=1
pkgdesc='Google Noto CJK variable fonts'
url='https://www.google.com/get/noto/'
license=(custom:SIL)
arch=(any)
_commit=cee7438f5f8e66397090d483c15275d1af3d87c7
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/googlefonts/noto-cjk/archive/${_commit}.tar.gz"
        70-noto-{cjk,hk,jp,kr,sc,tc}.conf)
sha256sums=('e0b2b7d6eca2a336cd66d2a63e7145a961fd442601341075115dbe299fa3ddb5'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
conflicts=(noto-fonts-cjk)
provides=(noto-fonts-cjk)

_faces=(Black
        Bold
        ExtraLight 
        Light 
        Medium
        Regular
        SemiBold)

_langs=(hk jp kr sc tc)

package_noto-fonts-cjk-vf(){
  cd noto-cjk-*/
  for f in NotoSans{,Mono}CJK-VF.otf.ttc; do
    install -Dm644 \
      Sans/Variable/OTC/${f} \
      "$pkgdir"/usr/share/fonts/noto-cjk/${f//-VF.otf}
  done

  for face in "${_faces[@]}"; do
    install -Dm644 \
      -t "$pkgdir"/usr/share/fonts/noto-cjk/ \
      Serif/NotoSerifCJK-${face}.ttc
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

  cd noto-cjk-${_commit}

  install -Dm644 \
    Sans/Variable/OTF/NotoSansCJK${_lang}-VF.otf \
    "$pkgdir"/usr/share/fonts/noto-cjk/NotoSansCJK.otf

  install -Dm644 \
    Sans/Variable/OTF/Mono/NotoSansMonoCJK${_lang}-VF.otf \
    "$pkgdir"/usr/share/fonts/noto-cjk/NotoSansMonoCJK.otf

  # no serif for hk so install the tc instead as the packages conflict
  [ $_lang = hk ] && _lang=tc
  for face in "${_faces[@]}"; do
    install -Dm644 \
      Serif/NotoSerifCJK${_lang}-${face}.otf \
      "$pkgdir"/usr/share/fonts/noto-cjk/NotoSerifCJK-${face}.otf
  done

  install -Dm644 -t "$pkgdir"/usr/share/fontconfig/conf.avail/ \
    ../70-noto-cjk.conf 
  install -dm755 "$pkgdir"/usr/share/fontconfig/conf.default
  ln -s  -t "$pkgdir"/usr/share/fontconfig/conf.default/ \
    ../conf.avail/70-noto-cjk.conf 

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

_package_subset(){
  cd noto-cjk-${_commit}

  # install sans font
  install -Dm644 \
    Sans/Variable/OTF/Subset/NotoSans${_lang^^}-VF.otf \
    "$pkgdir"/usr/share/fonts/noto-cjk/NotoSans${_lang^^}.otf

  # install mono font
  # there are no subset mono fonts, so install the multi-lingual with default locl, and then conflict
  for i in ${_langs[@]}; do
    [ $i = $_lang ] && continue
    conflicts+=(noto-fonts-cjk-${i}-vf)
  done
  install -Dm644 \
    Sans/Variable/OTF/Mono/NotoSansMonoCJK${_lang}-VF.otf \
    "$pkgdir"/usr/share/fonts/noto-cjk/NotoSansMonoCJK.otf

  # install serif font
  if [ ${_lang} != 'hk' ]; then
    for face in "${_faces[@]}"; do
      install -Dm644 \
        -t "$pkgdir"/usr/share/fonts/noto-cjk/ \
        Serif/NotoSerif${_lang^^}-${face}.otf
    done
  fi

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
