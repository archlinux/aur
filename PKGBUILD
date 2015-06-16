# Maintainer: Sigmund Vestergaard <sigmund at gmail dot com>
# Contributor: PKGBUILD 192486 2013-08-13 05:59:14Z bpiotrowski $
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=miro
pkgver=6.0
pkgrel=1
pkgdesc="The free and open source internet TV platform"
arch=('any')
url="http://www.getmiro.com"
license=('GPL2')
depends=('python2-dbus' 'pyrex' 'pygtk' 'gstreamer0.10' 'python2-gconf'
         'python2-pysqlite-legacy' 'pywebkitgtk' 'shared-mime-info'
         'desktop-file-utils' 'gstreamer0.10' 'hicolor-icon-theme'
         'gstreamer0.10-python' 'python2-notify' 'libtorrent-rasterbar'
         'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'python2-pycurl' 
         'gstreamer0.10-ffmpeg' 'ffmpeg' 'mutagen' 'xdg-utils')
makedepends=('boost')
install=miro.install
source=("http://ftp.osuosl.org/pub/pculture.org/${pkgname}/src/${pkgname}-${pkgver}.tar.gz")
sha256sums=('558d194278fe5d602ba4d5d6737035b150e907c57da3344afa2ec462062f026b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cd linux
  python2 setup.py install --root="${pkgdir}"

  # fix miro startup script so --debug works with python2
  sed -i "s|which python|which python2|" "${pkgdir}/usr/bin/miro"
  sed -i "s|./miro.real|/usr/bin/miro.real|" "${pkgdir}/usr/bin/miro"

  # fix python scripts for python2
  sed -i "s|/usr/bin/env python|/usr/bin/env python2|" "${pkgdir}"/usr/share/miro/resources/searchengines/update-icons.py
  for i in usr/share/miro/resources/testdata/echonest-replies/generate.py usr/share/miro/resources/searchengines/update-icons.py \
    usr/share/miro/resources/testdata/7digital-replies/generate.py; do
    sed -i "s|/usr/bin/python|/usr/bin/python2|" "${pkgdir}"/${i} 
  done

  # Fakeroot segfaults on these; remove
  if [ ${CARCH} == "i686" ]; then
    rm -f "${pkgdir}"/usr/bin/codegen.Linux-x86_64 || true
  else
    rm -f "${pkgdir}"/usr/bin/codegen.Linux-i686 || true
  fi
}
