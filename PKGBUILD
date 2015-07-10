# Maintainer: Sam S. <smls75@gmail.com>

pkgname=torchlight-hib
pkgver=1.15+h20130521
_hibver=2013-05-21
pkgrel=1
pkgdesc='A hack and slash action role-playing game (Humble Bundle version)'
url='http://www.torchlightgame.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('mesa' 'glu' 'freeglut' 'libxaw' 'libxft' 'freeimage' 'util-linux'
         'zziplib' 'pcre' 'libtxc_dxtn')
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_installer="Torchlight-${_hibver}.sh"
source=("hib://${_installer}"
        'torchlight-hib.desktop')
md5sums=('a747a31547202d7dc85c8a6cd9b47c9f'
         '36903fc0f19910870440b68ac4cd22a4')

package() {
  cd $srcdir
  _target="/opt/Torchlight"
  case $CARCH in i686) _arch=x86;; x86_64) _arch=x86_64;; esac

  # Extract installer
  [[ -d archive ]] && rm -r archive; mkdir archive; mkdir -p "${pkgdir}${_target}"
  while read line; do echo -n '.'; done < <(  # show progress as dots
    sh "${_installer}" --tar xvf -C archive/
    lzma -d < archive/instarchive_linux_${_arch} | tar xvf - -C "${pkgdir}${_target}"
    lzma -d < archive/instarchive_all | tar xvf - -C "${pkgdir}${_target}"
    lzma -d < archive/subarch | tar xvf - -C archive
    for i in archive/deps/{CEGUI,Ogre,SDL2,fmod,pcre}/*${_arch}; do
      lzma -d < $i | tar xvf - -C "${pkgdir}${_target}"
    done
  ); echo

  # Fix permissions
  find "${pkgdir}" -type f -exec chmod 644 "{}" +
  chown root:root -R "${pkgdir}"

  # Install desktop entry
  install -Dm644 "${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "${pkgdir}${_target}/Torchlight.png" \
                 "${pkgdir}/usr/share/pixmaps/torchlight.png"

  # Install launcher symlink
  chmod 755 "${pkgdir}${_target}/Torchlight.bin.${_arch}"
  install -d "${pkgdir}/usr/bin"
  ln -s "${_target}/Torchlight.bin.${_arch}" "${pkgdir}/usr/bin/torchlight"

  # Install license file
  install -Dm644 "archive/config/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
