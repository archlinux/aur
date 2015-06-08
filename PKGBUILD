# Maintainer: Ainola
# Contributor: <fero dot kiraly at gmail.com>

pkgname=pd-extended
pkgver=0.43.4
pkgrel=5
pkgdesc="A visual programming language. Contains an extra assembly of libraries, extensions, and documentation atop regular Pure Data."
url="http://puredata.info/"
arch=('i686' 'x86_64')
license=('custom:Modified BSD')
depends=('fftw' 'jack' 'tk' 'libquicktime' 'libdv' 'gsl' 'imagemagick' \
         'ftgl' 'lua51' 'libdc1394' 'libiec61883' 'desktop-file-utils')
makedepends=('dssi' 'libv4l' 'tcllib' 'swig' 'automake' 'ladspa')
conflicts=('pdp' 'pd-zexy' 'pd' 'pd-vanilla' 'puredata-utils')
provides=('pd' 'pd-gem' 'pdp' 'zexy')
options=('!makeflags' '!libtool')
install=('pd-extended.install')
source=("${pkgname}.tar.bz2::http://downloads.sourceforge.net/project/pure-data/pd-extended/${pkgver}/Pd-extended_${pkgver}-source.tar.bz2"
        'change_gem_configure_file.patch'
        's_inter.c.patch'
        'tclpd.Makefile.patch')
sha256sums=('087f23cbc955b308c8e1b9bbc37746d96837f96c6c3c7a199f52ee47d625bf87'
            '0db840450831f8a5745ac21eee876d8f8ba41283d598177c90c60b43d2a0b562'
            '594b614392776df8c2fe8d047ccba40ff1b11f8d192e88634efae6976213ef61'
            'a4f8af85533bb08403f1a87e356d960e4468fa06e85199a8884e41c81d17713c')

prepare(){
  #FIXES -----------------------------------------------------------------------------
  #GEM configure.ac
  patch  "${srcdir}/${pkgname}/externals/Gem/configure.ac" ./change_gem_configure_file.patch
  #repair wish8.6 (for tcl8.6)
  patch  "${srcdir}/${pkgname}/pd/src/s_inter.c" ./s_inter.c.patch
  #repair version of tcl (8.6)
  patch  "${srcdir}/${pkgname}/externals/loaders/tclpd/Makefile" ./tclpd.Makefile.patch
 
  # 64-bit architecture (labeled experimental by upstream)----------------------------
  if [ "$CARCH" = "x86_64" ]; then
    # fix -fPIC issue in PDP
    sed -e "s|CFLAGS =|CFLAGS = -fPIC|" \
      -i "${srcdir}/${pkgname}/externals/pdp/opengl/Makefile.config"
    # fix -fPIC issue in pddp
    sed -e "s|DEFINES =|DEFINES = -fPIC|" \
      -i "${srcdir}/${pkgname}/externals/miXed/Makefile.common"
    # setting additional variable
    FPIC_FLAG="-fPIC"
  else
    FPIC_FLAG=""
  fi
}

build(){
  unset CFLAGS
  unset LDFLAGS
  unset INCLUDES
 
  cd "${srcdir}/${pkgname}/packages/linux_make"

  make BUILDLAYOUT_DIR="${srcdir}/${pkgname}/packages" \
       GEM_EXTRA_CXXFLAGS="$FPIC_FLAG" \
       prefix=/usr \
       install
}

package(){
  cp -urv "${srcdir}/${pkgname}/packages/linux_make/build/usr" "$pkgdir/"
  cd "${srcdir}/${pkgname}/"

# PD License
  install -Dm644 pd/LICENSE.txt "${pkgdir}/usr/share/licenses/pd-extended/LICENSE.txt"
  cd packages/
  install -Dm644 linux_make/default.pdextended "${pkgdir}/usr/lib/pd-extended"

# icons/.desktop
  install -Dm644 linux_make/pd-extended.png       "${pkgdir}/usr/share/icons/hicolor/128x128/apps/pd-extended.png"
  install -Dm644 linux_make/48x48/pd-extended.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/pd-extended.png"
  install -Dm644 linux_make/pd-extended.desktop   "${pkgdir}/usr/share/applications/pd-extended.desktop"

# mime
  install -Dm644 linux_make/pd-extended.xml     "${pkgdir}/usr/share/mime/packages/pd-extended.xml"
  install -Dm644 linux_make/text-x-puredata.png "${pkgdir}/usr/share/icons/hicolor/128x128/mimetypes/text-x-puredata.png"
 
# files for /etc
  cd "${srcdir}/${pkgname}"

# allow tab completion for 'pd' commands (it expects pdextended or pd-extended)
  echo "complete -o default -F _pdextended pd" >> scripts/bash_completion/pdextended
  install -Dm644 scripts/bash_completion/pdextended "${pkgdir}/etc/bash_completion.d/pdextended"
# emacs mode for .pd files
  install -Dm644 scripts/pd-mode.el "${pkgdir}/usr/share/emacs/site-lisp/pd-mode.el"
# Pd-related scripts
  install -Dm755 scripts/pd-diff "${pkgdir}/usr/bin/pd-diff"
  install -Dm755 scripts/config-switcher.sh "${pkgdir}/usr/bin/config-switcher"
}

# vim:set ts=2 sw=2 et:
