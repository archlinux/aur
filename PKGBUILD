# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: sickhate <sickhate@tux-linux.net>

pkgname=solfege
pkgver=3.23.4
pkgrel=5
pkgdesc="Music education and ear training software"
arch=('x86_64')
url="https://www.gnu.org/software/solfege/"
license=('GPL3')
groups=('pro-audio')
depends=('gtk3' 'python-cairo' 'python-gobject')
makedepends=('docbook-xsl' 'ghostscript' 'itstool' 'lilypond' 'swig' 'texinfo' 'txt2man')
optdepends=('csound: Generate example sounds'
            'timidity++: MIDI playback'
            'mpg123: Mp3 playback'
            'vorbis-tools: Ogg playback'
            'lilypond: Generate print-outs and score sheets'
            'texlive-bin: Generate reports')
source=("https://git.savannah.gnu.org/cgit/solfege.git/snapshot/${pkgname}-${pkgver}.tar.gz"
        'hidden_menubar.patch'
        'fix_css.patch'
        'fix_lilypond_eps_file_mismatch.patch'
        'reproducible-build.patch'
        'do-not-run-xmllint.patch'
        'itstool.patch')
sha512sums=('f2ef7bdb3d1eb15842d803d4d093a177096b6960b211cd3607101f2c03c29fcd3f5151d3b02be4a04236305d18658ba6fa3b5a771b04be4a65f646e27b31914b'
            '1f7340b7ba4224900b94af8060c125f631748938488c87b5c26e20feb2f8b24e927fe5fc8bb9591d6ab87d6b16a11462373b6d3324a9a95c97f1d4352b35de1f'
            '631f5c5d3155927026cd33e75f65561302ec241af2db535e4db351c639812f74c0145940447d5acf58746af20a786c54c8e8aa294aaca8e13b99ad2da6019c53'
            'c264f4b98c5fea78cc071058c6b623a68d98545e1e3b3b21bd9bfe2ffdcd1989876e83c08888d9278e48debb6412f79c5bf99d0a8e9280fd552639dbaf885d2b'
            'f853d37106f079c18fe699ba70ecff6671d3ed5fdc3a45bfd8dd9ccef3737dd209c666ad4ce09278b6beb429cf27d8cb62f771ec5c348130a4073adbfb3bf49e'
            '3eda0a2c845d6f4e82b79542835a9a20658a522c86b162821b0b0a61187505c811710660ee1fa5395709f14607fbd8e95b542263c155284e47950b5178a1854d' SKIP)

prepare() {
  cd "${pkgname}-${pkgver}"

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
  sed -e '28i\ \ \ \ webbrowser.register_standard_browsers()' -i "${pkgname}/mainwin.py"
  
  # fix encoding of the Hungarian translation
  iconv -f ISO-8859-2 -t UTF-8 po/hu.po -o po/hu.po.new
  sed -i 's/charset=iso-8859-2/charset=utf-8/' po/hu.po.new
  mv po/hu.po.new po/hu.po

  # setup version file, so we don't have to use bizarre scripts using git
  echo "version_info ={'git_sha': None}" > "${pkgname}/_version.py"
  # replace wrong cflags assumptions
  sed -E 's|(PYTHON_INCLUDES=).+|\1"$(pkg-config --cflags-only-I python3)"|g' \
      -i acinclude.m4
  aclocal $ACINCLUDE
  autoconf
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
  make update-manual
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  # strip $pkgdir from embedded paths:
  python -m compileall -d "/usr/share/${pkgname}/${pkgname}" \
    "${pkgdir}/usr/share/${pkgname}/${pkgname}"
  python -O -m compileall -d "/usr/share/${pkgname}/${pkgname}" \
    "${pkgdir}/usr/share/${pkgname}/${pkgname}"
}
# vim:set ts=2 sw=2 et:
