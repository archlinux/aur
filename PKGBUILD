# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgbase=noto-fonts-vf
pkgname=(noto-fonts{,-slim}-vf)
pkgver=20220327
pkgrel=1
pkgdesc='Google Noto variable fonts'
url='https://www.google.com/get/noto/'
license=(custom:SIL)
arch=(any)
_commit=3ea292d22b86c20d971531b0d9f7eb04afbdda5c
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/googlefonts/noto-fonts/archive/${_commit}.tar.gz"
        {46,66}-noto-{mono,serif,sans}.conf)
sha256sums=('3ad5c3c8505e8e5b543a8620db5535d630698891399c63ff9cae5c456b52b71f'
            'f5c09b37280d7569b6c99a78511639be4ae25b8c5406464422fe0421fe13a884'
            'c94368b24506770767d003e5bcba589a8e402e489c240ee52453bf3ac7e9b5fa'
            '83a8faf6a47954075f97a2d555048e2a6689c38603b2ca00150157bf645f4593'
            '4526289f59654e2a81dc734669a1ae4e416f9a56d0896ec3741c6bf065baf8a8'
            '4459944b63dc083107280f5d7375c69746bf80a09416a4a4909a100e58e5a33a'
            '52684bebf6447be22618d2a04ff37623ec92f9d8ccf6b6f972e5bcbcfee90d69')

prepare(){
  cd noto-fonts-$_commit

  # generate missing font lists

  # variable italic fonts
  echo -e '\nGenerating font missing and duplicate font lists...'
  comm -23 \
    <(ls unhinted/variable-ttf | sed 's/-VF.ttf//' | sort) \
    <(ls unhinted/ttf | sort) \
    | grep Italic | sed 's/-Italic//' \
    > var_italic

  # static only fonts
  # ignore the silly html files in the cjk folders with a font file extension
  comm -13 \
    <(ls unhinted/variable-ttf | sed 's/-VF.ttf//' | sort) \
    <(ls unhinted/ttf | sort) \
    | grep -v 'CJK' \
    > stat_only

  comm -13 \
    <(ls unhinted/slim-variable-ttf | sed 's/-VF.ttf//' | sort) \
    <(ls unhinted/variable-ttf | sed 's/-VF.ttf//' | sort) \
    | grep -v Italic \
    > missing_var_slim

  echo -e '\nRemoving unneeded italic static fonts...'
  # if there is a variable italic variant font, but not a variable non-italic variant,
  # then remove the static italic typefaces, so they won't be copied with the other static typefaces
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

  cd noto-fonts-$_commit

  case $pkgname in
    noto-fonts-slim-vf)
      _vfsrc=unhinted/slim-variable-ttf
      ;;
    noto-fonts-vf)
      _vfsrc=unhinted/variable-ttf
      ;;
  esac

  (
    cd $_vfsrc
    for f in *.ttf; do
      install -vDm644 $f \
        "$pkgdir"/usr/share/fonts/noto/${f//-VF.ttf}.ttf
    done
  )

  # install missings fonts
  echo -e '\nInstalling static variants of missing variable fonts...'
  while read -r fontname; do
    if [ -f "${pkgdir}"/usr/share/fonts/noto/${fontname}.ttf ]; then
      echo "  $fontname already installed as a variable font!"
      continue
    fi
    echo -e "\nInstalling $fontname static fonts..."
    case $pkgname in
      noto-fonts-slim-vf)
        for face in Regular Medium SemiBold Bold; do
          [ -f unhinted/ttf/${fontname}/${fontname}-${face}.ttf ] &&
            install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
              unhinted/ttf/${fontname}/${fontname}-${face}.ttf
        done
        ;;
      noto-fonts-vf)
        install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
          unhinted/ttf/${fontname}/${fontname}-*.ttf
        ;;
    esac
  done < stat_only

  # install missing fonts into the slim variable fonts package
  if [[ $pkgname == noto-fonts-slim-vf ]]; then
    echo -e '\nInstalling static variants of missing slim variable fonts...'
    while read -r fontname; do
      for face in Regular Medium SemiBold Bold; do
        [ -f unhinted/ttf/${fontname}/${fontname}-${face}.ttf ] &&
          install -vDm644 -t "${pkgdir}"/usr/share/fonts/noto/ \
            unhinted/ttf/${fontname}/${fontname}-${face}.ttf
      done
    done < missing_var_slim
  fi

  # install configs
  echo -e '\nInstalling font configs...'
  install -vDm644 -t "$pkgdir"/usr/share/fontconfig/conf.avail/ \
    ../{46,66}-noto-{mono,serif,sans}.conf
  install -vdm755 "$pkgdir"/usr/share/fontconfig/conf.default
  ln -st "$pkgdir"/usr/share/fontconfig/conf.default/ \
    ../conf.avail/{46,66}-noto-{mono,serif,sans}.conf

  echo -e '\nCopying License...'
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}/
}

package_noto-fonts-vf(){
  _package
}

package_noto-fonts-slim-vf(){
  pkgdesc+=' (limited typefaces coverage)'
  _package
}
