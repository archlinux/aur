# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

_pkgname=solfege
pkgname=solfege-git
pkgver=3.23.5pre2.r14.g966b038
pkgrel=2
pkgdesc="Music education and ear training software"
arch=('x86_64')
url="https://www.gnu.org/software/solfege/"
license=('GPL-3.0-only')
groups=('pro-audio')
depends=('gtk3' 'python-cairo' 'python-gobject' 'bash' 'pango' 'gdk-pixbuf2')
makedepends=('git' 'docbook-xsl' 'ghostscript' 'itstool' 'lilypond' 'swig' 'texinfo' 'txt2man' 'libxslt')
optdepends=('csound: Generate example sounds'
            'timidity++: MIDI playback'
            'fluidsynth: real-time software synthesizer based on the SoundFont 2 specifications (MIDI playback)'
            'mma: Musical MIDI Accompaniment generator'
            'alsa-utils: For ALSA playback and testing'
            'pipewire-alsa: ALSA compatibility layer for PipeWire'
            'pipewire-audio: Core PipeWire audio support (includes ALSA)'
            'pipewire-jack: JACK compatibility over PipeWire'
            'mpg123: Mp3 playback'
            'vorbis-tools: Ogg playback'
            'lilypond: Generate print-outs and score sheets'
            'texlive-bin: Generate reports')
provides=('solfege')
conflicts=('solfege')
source=("git+https://git.savannah.gnu.org/git/${_pkgname}.git#branch=master"
        'do-not-run-xmllint.patch'
        'solfege.install')
b2sums=('SKIP'
        'bbc9b1247f68f36ab2a426972255dee4fa6c2531919df090133c9daf59e964eb6be93bac04f99e88c0d1184f10429b2b3d63b8b7a6eeb8acb089628f25295832'
        'c147ea00556a5424040361b566ec02b29f7e71ea256aed3835245bcb672743940b558864ae32447cc3dcccc33c7ae9822dd1182953c35037bf54fb0d4c759f7a')
install=solfege.install

pkgver() {
  cd solfege
  git describe --long --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd "${_pkgname}"

  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done

  # removing entries that break makeinfo
  sed -e '38,40d' -i topdocs/AUTHORS.texi
  sed -e '169d' -i topdocs/README.texi

  # fix early access of webbrowser module internal, leading to AttributeError:
  # https://bugs.archlinux.org/task/63703
  sed -e '28i\ \ \ \ webbrowser.register_standard_browsers()' -i "${_pkgname}/mainwin.py"
  
  # fix encoding of the Hungarian translation
  iconv -f ISO-8859-2 -t UTF-8 po/hu.po -o po/hu.po.new
  sed -i 's/charset=iso-8859-2/charset=utf-8/' po/hu.po.new
  mv po/hu.po.new po/hu.po

  # Setup a dummy version file to avoid git lookups at runtime
  echo "version_info ={'git_sha': None}" > "${_pkgname}/_version.py"
 
  # Fix Python CFLAGS detection in acinclude.m4
  sed -E 's|(PYTHON_INCLUDES=).+|\1"$(pkg-config --cflags-only-I python3)"|g' \
    -i acinclude.m4

  # Update docbook stylesheet path for makeinfo/html docs
  sed "s|/usr/share/sgml/docbook/stylesheet/xsl/nwalsh/html/chunk.xsl|/usr/share/xml/docbook/xsl-stylesheets-1.79.2/html/chunk.xsl|" \
    -i configure.ac

  # Remove explicit Linux headers from CFLAGS when building soundcard
  sed -i 's|-I/usr/src/linux/include||' solfege/soundcard/Makefile

  aclocal $ACINCLUDE
  autoreconf -fvi
}

build() {
  cd "${_pkgname}"
  ./configure \
      CC="gcc -std=gnu17" \
      --prefix=/usr \
      --sysconfdir=/etc/"${_pkgname}"
  make
  make update-manual
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
  # strip $pkgdir from embedded paths:

  # Python byte-compilation:
  # 1. Normal compilation for runtime speed
  # 2. Optimized compilation (-O) removes asserts, improves performance
  # -d preserves the correct path for import
  python -m compileall -d "/usr/share/${_pkgname}/${_pkgname}" \
    "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"
  python -O -m compileall -d "/usr/share/${_pkgname}/${_pkgname}" \
    "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"
}
# vim:set ts=2 sw=2 et:
