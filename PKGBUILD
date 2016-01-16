# Maintainer: Guatavo Alvarez <sl1pkn07@gmail.com>

pkgname=audiotools-git
pkgver=v3.1.1.117.gb40b6cc
pkgrel=1
pkgdesc="Collection of audio handling programs which work from the command line (GIT Version)"
arch=('i686' 'x86_64')
url="http://audiotools.sourceforge.net"
license=('GPL')
depends=('python'
         'libcdio-paranoia'
         'libpulse'
         'opusfile'
         'twolame'
         'mpg123'
         'lame'
         'wavpack'
         'libdvd-audio-git'
         )
makedepends=('git'
             'python-distribute'
             )
optdepends=('faad2: Decoding AAC'
            'faac: Encoding AAC'
            'neroaacdec: Decoding AAC (preferred)'
            'neroaacenc: Encoding AAC (preferred)'
            'mp3gain: For MP3 Replay Gain support'
            'vorbisgain: For OGG Replay Gain support'
            'python-pillow: for Coverview interface'
            'pygtk: for Coverview interface (GTK)'
            'python-pmw: Coverview interface (Tk)'
            'python-urwid: interactive modes'
            'cdrkit: for CD burning without cuesheets'
            'cdrecord: for CD burning without cuesheets'
            'cdrdao: for CD burning with cuesheets'
            )
conflicts=('audio-tools')
provides=('audio-tools')
source=('git+https://github.com/tuffy/python-audio-tools.git')
sha1sums=('SKIP')

pkgver() {
  cd python-audio-tools
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd python-audio-tools
  sed -e 's|cdio/cdda.h|cdio/paranoia/cdda.h|g' \
      -e 's|cdio/paranoia.h|cdio/paranoia/paranoia.h|g' \
      -i src/cdiomodule.h


  sed -e 's|-m 644|-Dm 644|g' \
      -e 's|all: $(TARGETS)|all: $(MAN_PAGES)|g' \
      -i Makefile -i docs/Makefile
}

build() {
  cd python-audio-tools
  python setup.py build
  cd docs
  make
}

package() {
  cd python-audio-tools
  python setup.py install --root="${pkgdir}" --optimize=1
  cd docs
  make install MAN_PATH="${pkgdir}/usr/share/man"
}
