# Maintainer: Sam S. <smls75@gmail.com>

pkgname=closure-hib
pkgver=1.1+h20121228
_hibver=1.1-2012-12-28
pkgrel=1
pkgdesc='A puzzle platformer game that centers around light and darkness (Humble Bundle version)'
url='http://closuregame.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('libgl' 'sdl' 'nvidia-cg-toolkit' 'openal' 'freealut')
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_installer="Closure-Linux-${_hibver}.sh"
source=("hib://${_installer}"
        'closure-hib.desktop')
md5sums=('a7c2f7fe17ff67f376da70611abdce97'
         '443054a1154ef9423698d6f010682a9c')

package() {
  cd $srcdir
  _target="${pkgdir}/opt/Closure"
  [ $CARCH == "i686" ] && _arch='x86' || _arch='x86_64'

  # Extract installer
  [[ -d archive ]] && rm -r archive; mkdir archive; mkdir -p ${_target}
  while read line; do echo -n '.'; done < <(  # show progress as dots
    sh "${_installer}" --tar xvf -C archive/
    lzma -d < archive/instarchive_linux_${_arch} | tar xvf - -C "${_target}"
    lzma -d < archive/instarchive_all | tar xvf - -C "${_target}"
  ); echo

  # Fix permissions and remove unused files with encoding problems
  rm -r "${_target}/resources/textures/ui/temp/"
  chown root:root -R "${_target}"

  # Install desktop entry
  install -Dm644 "${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "${_target}/Closure.png" \
                 "${pkgdir}/usr/share/pixmaps/closure.png"

  # Install launch script
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/Closure/Closure.bin.${_arch}" "${pkgdir}/usr/bin/closure"
}
