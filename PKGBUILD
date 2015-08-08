# Maintainer: Niluge_KiWi <kiwiiii@gmail.com>

pkgname=runner2
pkgver=1.0
_hibver=1388171186
pkgrel=3
pkgdesc="BIT.TRIP Presents... Runner2: Future Legend of Rhythm Alien"
url="http://www.runner2.com/"
arch=('i686' 'x86_64')
license=('custom')
depends=('sdl' 'libgl' 'zlib')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

case $CARCH in
  i686)
    _archive_arch='i386'
    _archive_md5='ea105bdcd486879fb99889b87e90eed5' ;;
  x86_64)
    _archive_arch='amd64'
    _archive_md5='2f7ccdb675a63a5fc152514682e97480' ;;
esac
_archive="runner2_${_archive_arch}_${_hibver}.tar.gz"

source=("hib://${_archive}")
md5sums=("${_archive_md5}")

# don't compress the generated package as it's just a transient package
PKGEXT='.pkg.tar'

package()
{
  cd "${pkgname}-1.0/"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  mv "${pkgname}"/* "${pkgdir}/opt/${pkgname}/"
  
  # Install launcher script
  echo -e "#!/bin/sh\ncd /opt/${pkgname} && ./${pkgname}" \
        > "launcher.sh"
  install -Dm755 "launcher.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install desktop entry
  # patch the included desktop entry paths
  sed -i 's|/usr/local/bin|/usr/bin|' "${pkgname}.desktop"
  sed -i 's|/usr/local/share/gaijin_games|/opt|' "${pkgname}.desktop"
  install -Dm644 "${PWD}/${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  mv "README"* "${pkgdir}/usr/share/doc/${pkgname}"

  # cleanup
  rm -rf "${pkgdir}/opt/tmp/"
}
