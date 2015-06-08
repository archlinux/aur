# Maintainer: Hendrik R. hendrikr_10 [at] yahoo [dot] de

pkgname=riskofrain-hib
pkgver=1.2.8
_hibver=2015-05-07
pkgrel=1
pkgdesc='A roguelike action platformer/adventure game with randomized elements. (Humble Bundle Version)'
url='http://riskofraingame.com'
arch=('i686' 'x86_64')
license=('custom:commercial')
case ${CARCH} in
  i686 )
    depends=( 'libxrandr'
              'openal'
              'glu')
    ;;
  x86_64 )
    depends=( 'lib32-libxrandr'
              'lib32-openal'
              'lib32-glu')
    ;;
esac
options=()
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_installer="RoR-Linux-${_hibver}.sh"
source=("hib://${_installer}"
        "riskofraingame_com-RiskOfRain_1.desktop")
sha256sums=('75a1d750aeb4b668af0d1e5588ec80f5a9a74c5774c1b0bf5b7d431b3588c8e7'
            'd84193e489e52c80348b77978b549e4f682b4a08a66d515fa588013b37ed5d74')

package() {
  cd $srcdir
  _target="/opt/${pkgname}"
  case $CARCH in i686) _arch=x86;; x86_64) _arch=x86_64;; esac

  # Extract installer
  mkdir -p "${pkgdir}${_target}"
  while read line; do echo -n '.'; done < <(  # show progress as dots
    cd "${pkgdir}${_target}"
    mv "${srcdir}/data/noarch/assets" .
    mv "${srcdir}/data/x86/ROR.bin" .
    mv "${srcdir}/data/x86/ROR.sh" .
    rm -r "${srcdir}/data/x86/lib"
    rmdir "${srcdir}/data/noarch"
    rmdir "${srcdir}/data/x86"
    rmdir "${srcdir}/data"
  ); echo

  # Fix permissions
  find "${pkgdir}" -type f -exec chmod 644 "{}" +
  chown root:root -R "${pkgdir}"

  # Install desktop entry
  install -Dm644 "${srcdir}/riskofraingame_com-RiskOfRain_1.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "${pkgdir}${_target}/assets/icon.png" \
                 "${pkgdir}/usr/share/pixmaps/RiskOfRain.png"

  # Install launcher symlink
  chmod 755 "${pkgdir}${_target}/ROR.sh"
  chmod 755 "${pkgdir}${_target}/ROR.bin"
  install -d "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/riskofrain"
#!/bin/sh
/opt/${pkgname}/ROR.sh
EOF
  chmod 755 "${pkgdir}/usr/bin/riskofrain"
}
