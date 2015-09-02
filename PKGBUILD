# Maintainer: M Rawash <mrawash@gmail.com>
# Contributor: olvar <beren dot olvar (at) gmail dot com>
# Contributor: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Jonathan Friedman <jonf@gojon.com>

pkgname=stumpwm-git
pkgver=20110924
pkgrel=1
pkgdesc="A tiling, keyboard-driven window manager written in common lisp"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/stumpwm/"
license=('GPL2')
provides=('stumpwm')

if pacman -Qq sbcl &>/dev/null; then
    depends=('sbcl' 'clx' 'cl-ppcre')
    _lisp=sbcl
elif pacman -Qq clisp-new-clx &>/dev/null; then
  # If somebody compiled this specially, chances are they want to use it
  depends=('clisp-new-clx' 'cl-ppcre' 'cl-asdf')
  _lisp=clisp
  source=(http://common-lisp.net/project/asdf/asdf.lisp)
  md5sums=('0f172cc814e11054c37c29fa2acfbfae')
else
  # No, this isn't redundant.
  depends=('sbcl' 'clx' 'cl-ppcre')
  _lisp=sbcl
fi

makedepends=('git' 'texinfo' 'autoconf')
optdepends=('emacs: Edit and eval stumpwm code with M-x stumpwm-mode'
            'alsa-utils: Use contrib/amixer.lisp to control audio volume'
            'aumix: Use contrib/aumix.lisp to control audio volume'
            'mpd: Use contrib/mpd.lisp to control the mpd'
            'surfraw: Use contrib/surfraw.lisp to surf the Internet')
install=stumpwm.install
options=(!strip)  # Thanks to sidereus for pointing this out

# this is necesary since the AUR packages do not modify the asdf's registry by default
_sbcl_bopt=$(cat sbcl_bopt)
_sbcl_iopt=$(cat sbcl_iopt)

_gitroot="git://git.savannah.nongnu.org/stumpwm.git"
_gitname="stumpwm"

build() {
  msg "Connecting to ${_gitroot}..."

  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${srcdir}/${_gitname} && git pull origin master
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_gitname}-build
  cp -a ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build


  autoconf
  if [ "$_lisp" = "sbcl" ]; then

    ./configure --prefix=/usr \
                --with-lisp=$_lisp \
                --with-ppcre=/usr/share/common-lisp/source/cl-ppcre

    make "$_sbcl_bopt" "$_sbcl_iopt"

  elif [ "$_lisp" = "clisp" ]; then
    _lisp_source=/usr/share/common-lisp/source/
    _ppcre_source=${_lisp_source}cl-ppcre/

    # Sometimes there are no compiled versions of ppcre.
    # in this case we need to compile and use our own, and then we install them
    if [ ! -f ${_ppcre_source}/api.fas ]; then

      _own_fas=1

      mkdir ${srcdir}/cl-ppcre_temp
      mkdir ${srcdir}/cl-ppcre_temp/systems
      mkdir ${srcdir}/cl-ppcre_temp/source

      export ASDF_OUTPUT_TRANSLATIONS="/usr/share/common-lisp/source/:${srcdir}/cl-ppcre_temp/source/"
      # for compiling we use the asdf source we donwloaded
      clisp -norc -K full -on-error exit \
            -x "(require 'asdf '(\"${srcdir}/asdf.lisp\"))" \
            -x "(pushnew #p\"/usr/share/common-lisp/systems/\" asdf:*central-registry* :test #'equal)" \
            -x "(asdf:operate 'asdf:compile-op 'cl-ppcre)"

      # once we have cl-ppcre compiled we copy the necesary files to
      # this new location, and set the necessary options for make
      cp $_ppcre_source/cl-ppcre.asd ${srcdir}/cl-ppcre_temp/source/cl-ppcre/
      cp $_ppcre_source/*.lisp ${srcdir}/cl-ppcre_temp/source/cl-ppcre/
      _ppcre_source=${srcdir}/cl-ppcre_temp/source/cl-ppcre/

      _clisp_bopt="clisp_BUILDOPTS=-K full -on-error exit \
                  -x \"(require 'asdf '(\\\"asdf.lisp\\\"))\" \
                  -x \"(pushnew \\\"${srcdir}/cl-ppcre_temp/systems/\\\" \
                  asdf:*central-registry* \
                  :test #'equal)\" \
                  -x \"(load \\\"./make-image.lisp\\\")\""
    fi

    ./configure --prefix=/usr \
	              --with-lisp=$_lisp \
                --with-ppcre=$_ppcre_source

    if [ -z "$_clisp_bopt" ]; then
		  make
    else
		  make "$_clisp_bopt"
    fi
  fi

  make destdir=$pkgdir install

  rm -f ${pkgdir}/usr/share/info/dir

  # Installation of stumpish, the contributed lisp,
  # and the emacs stumpwm mode.
  install -m 755 ${srcdir}/${_gitname}-build/contrib/stumpish ${pkgdir}/usr/bin

  install -Dm 644 sample-stumpwmrc.lisp ${pkgdir}/etc/stumpwmrc.sample
  install -d ${pkgdir}/usr/share/${_gitname}
  install -m 644 ${srcdir}/${_gitname}-build/contrib/*.lisp ${pkgdir}/usr/share/${_gitname}

  install -Dm 644 ${srcdir}/${_gitname}-build/contrib/stumpwm-mode.el \
    ${pkgdir}/usr/share/emacs/site-lisp/stumpwm-mode.el


  # if we had to compile our own fas files, then we need to install them too.
  if [ "x$_own_fas" = "x1" ]; then
    install -d ${pkgdir}/usr/share/common-lisp/source/cl-ppcre
    install -m 644 ${srcdir}/cl-ppcre_temp/source/cl-ppcre/*.fas \
      ${pkgdir}/usr/share/common-lisp/source/cl-ppcre/
  fi
}

# vim:sw=2 ts=2 et si:
