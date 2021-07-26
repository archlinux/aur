# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgbase=noto-fonts-vf
pkgname=(noto-fonts{,-slim}-vf)
pkgver=20210725
pkgrel=1
pkgdesc='Google Noto variable fonts'
url='https://www.google.com/get/noto/'
license=(custom:SIL)
arch=(any)
_commit=5444496f4489ba6a4da2d7d7e9faa09ddb735e3b
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/googlefonts/noto-fonts/archive/${_commit}.tar.gz"
        {46,66}-noto-{mono,serif,sans}.conf)
sha256sums=('e27d5d8e8e706481c666953c541ed718ab0a6f53ac71239fa4d0dc53b7234299'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare(){
  cd noto-fonts-*/

  # generate missing font lists
  echo
  echo 'Generating font missing and duplicate (italic) font lists'
  comm -23 \
    <(ls unhinted/variable-ttf | sed 's/-VF.ttf//' | sort) \
    <(ls unhinted/ttf | sort) \
    | grep Italic | sed 's/-Italic//' \
    > var_italic

  comm -13 \
    <(ls unhinted/variable-ttf | sed 's/-VF.ttf//' | sort) \
    <(ls unhinted/ttf | sort) \
    > stat_only

  comm -13 \
    <(ls unhinted/slim-variable-ttf | sed 's/-VF.ttf//' | sort) \
    <(ls unhinted/variable-ttf | sed 's/-VF.ttf//' | sort) \
    | grep -v Italic \
    > missing_var_slim

  echo
  echo 'Removing unneeded italic static fonts...'
  # remove unneeded italic type faces
  while read -r fontname; do
    [ -f unhinted/variable-ttf/${fontname}-VF.ttf ] &&
      continue
    rm -v unhinted/ttf/${fontname}/${fontname}-*Italic*.ttf
  done < var_italic
}


_package(){
  optdepends=('noto-fonts-cjk-vf: CJK characters'
              'noto-fonts-emoji: Emoji characters')
  conflicts=(noto-fonts{,-extra,} ttf-croscore)
  provides=(noto-fonts{,-extra,} ttf-croscore ttf-font)

  cd noto-fonts-*/

  case $pkgname in
    *-slim-vf)
      _vfsrc=unhinted/slim-variable-ttf
      ;;
    *)
      _vfsrc=unhinted/variable-ttf
      ;;
  esac

  pushd $_vfsrc
  for f in *.ttf; do
    install -Dm644 $f \
      "$pkgdir"/usr/share/fonts/noto/${f//-VF.ttf}.ttf
  done
  popd

  ## install missings fonts
  echo
  echo 'Installing static variants of the missing variable fonts..'
  while read -r fontname; do
    if [ -f "${pkgdir}"/usr/share/fonts/noto/${fontname}.ttf ]; then
      echo "  $fontname is already installed as a variable font."
      continue
    fi
    echo "  Installing $fontname static fonts"
    case $pkgname in
      *-slim-vf)
        for face in Regular Medium SemiBold Bold; do
          [ -f unhinted/ttf/${fontname}/${fontname}-${face}.ttf ] &&
            install -v -t "${pkgdir}"/usr/share/fonts/noto/ \
              unhinted/ttf/${fontname}/${fontname}-${face}.ttf
        done
        ;;
      *)
        install -v -t "${pkgdir}"/usr/share/fonts/noto/ \
          unhinted/ttf/${fontname}/${fontname}-*.ttf
        ;;
    esac
  done < stat_only

  ## install missings font in the slim variable fonts package
  if [[ $pkgname == *-slim-vf ]]; then
    echo
    echo 'Installing static variants of the missing slim variable fonts..'
    while read -r fontname; do
      for face in Regular Medium SemiBold Bold; do
        [ -f unhinted/ttf/${fontname}/${fontname}-${face}.ttf ] &&
          install -v -t "${pkgdir}"/usr/share/fonts/noto/ \
            unhinted/ttf/${fontname}/${fontname}-${face}.ttf
      done
    done < missing_var_slim
  fi

  # install configs
  echo
  echo 'Installing configs...'
  install -Dm644 -t "$pkgdir"/usr/share/fontconfig/conf.avail/ \
    ../{46,66}-noto-{mono,serif,sans}.conf
  install -dm755 "$pkgdir"/usr/share/fontconfig/conf.default
  ln -s  -t "$pkgdir"/usr/share/fontconfig/conf.default/ \
    ../conf.avail/{46,66}-noto-{mono,serif,sans}.conf

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

package_noto-fonts-vf(){
  _package
}

package_noto-fonts-slim-vf(){
  pkgdesc+=' (limited type faces)'
  _package
}
