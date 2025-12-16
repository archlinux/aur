# Maintainer: Edmund Lodewijks <edmund@proteamail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: sickhate <sickhate@tux-linux.net>

pkgname=solfege
pkgver=3.23.4
pkgrel=12
pkgdesc="Music education and ear training software"
arch=('x86_64')
url="https://www.gnu.org/software/solfege/"
license=('GPL-3.0-only')
groups=('pro-audio')
depends=('gtk3' 'python-cairo' 'python-gobject' 'bash' 'pango' 'gdk-pixbuf2')
makedepends=('docbook-xsl' 'ghostscript' 'itstool' 'lilypond' 'swig' 'texinfo' 'txt2man')
optdepends=('csound: Generate example sounds'
            'timidity++: MIDI playback'
            'fluidsynth: real-time software synthesizer based on the SoundFont 2 specifications (MIDI playback)'
            'mma: Musical MIDI Accompaniment generator'
            'alsa-utils: for aplay'
            'mpg123: Mp3 playback'
            'vorbis-tools: Ogg playback'
            'lilypond: Generate print-outs and score sheets'
            'texlive-bin: Generate reports')
source=("https://alpha.gnu.org/gnu/solfege/${pkgname}-${pkgver}.tar.gz"{,.sig}
        'hidden_menubar.patch'
        'fix_css.patch'
        'fix_lilypond_eps_file_mismatch.patch'
        'reproducible-build.patch'
        'do-not-run-xmllint.patch'
        'itstool.patch'
        'rm-linux-headers-from-CFLAGS.patch'
        'solfege.install')
b2sums=('8543aaa659f753af87f7b911401ee38713aa51afcf3dc33d4bfacbc880c8088aff78a81ce03369ba0b58d14a4b6965d78d97486ac2c3481f066591db0f29743d'
        'SKIP'
        '284817806aaf27b17f7733b5bbcf149ba5b2d9be3b2b6bcb77127bcb04ef7ad7647df4a78f807312237dae478a789c1426753791f3131f52ecb55c30c865c1fc'
        'fe9265d1f62535060119961afc1234696d7b48028e8b8f0eda62a66feda152e3d3ed2903acf08bfc227d352c26badeeab4a71866aa2b2e150a55d177f328e3e7'
        '7f85a88b69d574ca9d7fce7393f644a1a720b6d64601417a8b27b66a71caad2c456e78573908f09fa71294b986f3f830dfcb5faf384c5a24c01121815929f580'
        '97c57c0b0645054916ff463f00a61bdf405ffdd0064c40de525a8330e8768eb7a8828f955aa4feca4047904ff1c1156e577f14f9801093e0ff922f1b65cfaa2e'
        'bbc9b1247f68f36ab2a426972255dee4fa6c2531919df090133c9daf59e964eb6be93bac04f99e88c0d1184f10429b2b3d63b8b7a6eeb8acb089628f25295832'
        '0f0fe564fea7ab8396fb597257bccf90ca7760d36d1c4e780243220b0f356353ca188f4a7bb87c2bef94d6b031ee27277d479ca4c3de304ad3672e09f2ba01c9'
        '357e3bd1e73f41f446352f9b3de1185a3e47ee794606575749cc7dedfa5842ea6167ebfbe541e2c1ff25d8535f1517b59486d4c440ca684a8209dd6541073b3d'
        'c147ea00556a5424040361b566ec02b29f7e71ea256aed3835245bcb672743940b558864ae32447cc3dcccc33c7ae9822dd1182953c35037bf54fb0d4c759f7a')
validpgpkeys=(
  'D1820E3CCB05255CCD9855988143F7EEA5E43EA3' # Tom Cato Amundsen - gpg --keyserver hkps://keyserver.ubuntu.com --recv-keys 8143F7EEA5E43EA3
)
install=solfege.install

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
