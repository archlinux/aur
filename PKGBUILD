# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Ross KD5LPB <minorsecond at gmail dot com>

# If the most current revision cannot be built,
# checkout the most recent version that can.

_svnrev=''
#_svnrev='#revision=3868'
#_svnrev='#revision=5846'

# Getting the most recent revision to build was an adventure, and here's the
# map in case you'd like to see how it was done or build an old version.

# svn log -l 1
# Python 3.4.3
# Python 2.7.10
#  9.1.r2405:r2405 2011-04-20 works
#  9.2.r2459:r2459 2012-05-21 works
#  9.4.r2988:r2988 2013-01-28 works
#  9.4.r2989:r2989 2013-01-28 No rule to make target 'gen24.o', needed by 'WsjtMod/Audio.so'
#  (this appears to be too many commits during transitions while files are mismatched)
#  9.5.r3500:r3281 2013-05-17 works
#  9.6.r3634:r3634 2014-01-13 works
#  9.7.r3635:r3635 2014-01-14 No rule to make target 'gendiana.f90', needed by 'WsjtMod/Audio.so'
#  9.7.r3700:r3639 2014-01-15 make: *** No rule to make target 'gendiana.f90', needed by 'WsjtMod/Audio.so'
# 10.0.r3784:r3784 2014-02-20 works
# 10.0.r3785:r3785 2014-02-20 works, now requires pyinstaller
# 10.0.r3800:r3795 2014-02-21 works
# 10.0.r3817:r3817 2014-02-27 works
# 10.0.r3818:r3818 2014-02-28 error invisible to due make -s
# 10.0.r3819:r3818 2014-02-28 last version with pdf files, make: *** No rule to make target 'ftsky.o', needed by 'WsjtMod/Audio.so'

# Moving past this point you MUST delete the local repo. svn will not sync it properly.

# 10.0.r3831:r3831 2014-03-04 works, first working version after the big transition at 3819
# 10.0.r3868:r3866 2014-03-12 works, this is the last revision that builds with Python 2 before the big transition
# 10.0.r3869:r3869 2014-03-14 first version for error: import py2exe; ImportError: No module named py2exe
# 10.0.r3873:r3870 2014-03-14 last version with setup.py; import py2exe; ImportError: No module named py2exe
# 10.0.r3899:r3897 2014-03-19 first version that crashes on something earlier than pyinstaller
# 10.0.r3900:r3900 2014-03-19 first version that crashes on: /bin/sh: f2py3.2: command not found
# 10.0.r3907:r3906 2014-03-24 f2py3.2: command not found, last version with pyinstaller
# 10.0.r3908:r3908 2014-03-24 Transition to Python 3, install target & pyinstaller removed from Makefile, f2py3.2: command not found; Python 3.x with numpy, PIL, Pmw.
#  (As of Python 3 the installer has been moved to a separate package: jtsdk)
# 10.0.r4000:r3937 2014-03-27 f2py3.2: command not found; Python 3.x with numpy, PIL, Pmw
# 10.0.r4071:r4068 2014-04-29 p2py3.2 removed from Makefile

# Revisions 3869-4071 are not tested.
# Revisions 4072-5845 have not been tested but may work with the new jtsdk installer.

# 10.0.r4072:r4072 2014-04-30 compiles, first version with: Python 3.x, numpy-1.8.1, PIL, Pmw-2.0.0+; python: can't open file '/usr//bin/wsjt.py': [Errno 2] No such file or directory
# 10.0.r5000:r4991 2015-02-27 compiles
# 10.0.r5846:r5770 2015-08-07 works

set -u

_pkgname='wsjt'
pkgname="${_pkgname}-svn"
pkgver=10.0.r5952
pkgrel=1
pkgdesc='Weak Signal Amateur Hamradio Communication by K1JT'
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h')
url='http://physics.princeton.edu/pulsar/K1JT/wsjt.html'
license=('GPL')
# http://physics.princeton.edu/pulsar/k1jt/wsjtx-doc/dev-guide-main.html#_linux_2
# https://sourceforge.net/projects/jtsdk/files/linux/2.0.0/
depends=('python-imaging' 'tk' 'libsamplerate' 'portaudio' 'fftw')
makedepends=('subversion' 'gcc-fortran')
if [ ! -z "${_svnrev}" ] && [ "${_svnrev##*=}" -lt 3908 ]; then
  if [ "${_svnrev##*=}" -ge 3785 ] && [ "${_svnrev##*=}" -le 3907 ]; then
    makedepends+=('pyinstaller')
  fi
  depends+=('python2' 'python2-numpy')
else
  makedepends+=('lsb-release' 'python-setuptools' 'asciidoc')
  depends+=('python-pmw' 'python-pillow' 'portaudio')
  #if [ ! -z "${_svnrev}" ] && [ "${_svnrev##*=}" -lt 4072 ]; then
  #  depends+=('python<3.4.3' 'python-numpy'{'>=1.8.0','<1.8.1'}) # This is only a guess. These commits have not been tested.
  #else
    depends+=('python>=3.4.3' 'python-numpy>=1.9.2-2') # https://bugs.archlinux.org/task/44345 Apparently 1.9.2-1 was build with Python 3.4.2
  #fi
fi
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_srcdir="${pkgname^^}"
_jtsdk='jtsdk-nix-2.0.14'
source=("${_srcdir}::svn://svn.code.sf.net/p/wsjt/wsjt/trunk${_svnrev}"
        "http://iweb.dl.sourceforge.net/project/jtsdk/linux/2.0.0/${_jtsdk}.tar.gz" # https://sourceforge.net/p/wsjt/mailman/message/34414230/
        "${pkgname}"{.png,.desktop})
sha256sums=('SKIP'
            'bdcefbe6f73a81eb0b77e20cc3b5f36fc44c39ed5c1088dd4ad1c1d2bea0a475'
            '20391217d7eb7170c218e5dd04cea744c5f110c03865267c140f2a7c68a0fb3e'
            '94dc4953cf922cd48799b568b58704b6aca68cd15bd5b4921e9654f62be62a73')

pkgver() {
  set -u
  cd "${_srcdir}"
  local _vcsver
  if :; then
    # Use this to label the revision according to the screen and published lists
    _vcsver="$(svn info | grep "Last Changed Rev:" |awk '{print $4}')"
  else
   # Use this to label the revision accord to what _svnrev needs.
    _vcsver="$(svnversion)"
    _vcsver="${_vcsver//:/.}" # when svn screws up it can return revision nnnn:nnnn
  fi
  local _srcver="$(sed -ne 's:^Version="\([0-9\.]\+\) r.*$:\1:p' 'wsjt.py')"
  printf '%s.r%s' "${_srcver}" "${_vcsver//[[:alpha:]]}"
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  #unset CFLAGS
  if [ ! -z "${_svnrev}" ] && [ "${_svnrev##*=}" -lt 3908 ]; then
# This patch gets f2py2e from python2-numpy
    install -Dm644 <(cat << EOF
from numpy.f2py import f2py2e
f2py2e.main()
EOF
    ) 'f2py.py'
    # Set the build environment to python2
    # Make problems can sometimes be fixed by replacing g95 with gfortran
    #F2PY='/usr/bin/python2 f2py.py' LDFLAGS='' ./configure --prefix='/usr' --enable-g95
    F2PY='/usr/bin/python2 f2py.py' LDFLAGS='' ./configure --prefix='/usr' --enable-gfortran
  else
    if [ ! -z "${_svnrev}" ] && [ "${_svnrev##*=}" -ge 3900 ] && [ "${_svnrev##*=}" -le 4070 ]; then
      if :; then
        #sed -i -e 's:f2py3.2:f2py:g' 'Makefile.in' # Python 3
        sed -i -e 's:Audio.cpython-32mu.so:Audio.cpython-34m.so:g' 'Makefile.in' # Python 3.2.x -> 3.4.x
      else
        sed -i -e 's:f2py3.2:f2py2:g' 'Makefile.in' # Python 2
        sed -i -e 's:Audio.cpython-32mu.so:Audio.so:g' 'Makefile.in' # Python 3.2.x -> 2.7.x
      fi
    elif [ ! -z "${_svnrev}" ] && [ "${_svnrev##*=}" -le 4072 ]; then
      # This is not expected to build
      #LDFLAGS='' ./configure --prefix='/usr' --enable-g95
      LDFLAGS='' ./configure --prefix='/usr' --enable-gfortran
    else
      cd "${srcdir}/${_jtsdk}"
      sed -i -e '# No colors' \
             -e 's:^\(C_[A-Z]\{1,2\}\)=.*$:\1="":g' \
             -e "# It's rude to clear screens" \
             -e 's,^\(\s*\)\(clear\)$,\1: #\2,g' \
        'autogen.sh'
      ./autogen.sh --with-f2py3='/usr/bin/f2py'
      cd 'src'
      # Fix this install script to be package compatible
      sed -i -e '# Set the folders' \
             -e 's:^\(HOMEDIR\)=.*$'":\1=${srcdir}:g" \
             -e 's:^\(SRCD\)=.*$:\1="$HOMEDIR/'"${_srcdir}"'":g' \
             -e 's:^\(APP_SRC\)=.*$:'"\1='${srcdir}/${_srcdir}':g" \
             -e '# No colors' \
             -e 's:^\(C_[A-Z]\{1,2\}\)=.*$:\1="":g' \
             -e "# Fix the lib folders to native. If we were to enable multilib we wouldn't do it that way." \
             -e 's:\(--with-portaudio-lib-dir=/usr/lib/\).*-linux-gnu:\1:g' \
             -e "# Disable SVN retrieval that we've done already" \
             -e 's:^check_svn$:#&:g' \
             -e "# Separate into parts, and it's rude to clear screens" \
             -e 's:^clear$:_fn_configure() {:g' \
             -e '# Then make' \
             -e 's:^echo -e ${C_Y}'"'"'COMPILE and INSTALL.*$:}\n_fn_make() {\ncd "$APP_SRC":g' \
             -e '# Then install' \
             -e 's:^mkdir -p "\$INSTALLD":}\n_fn_install() {\ncd "$APP_SRC"\n&:g' \
             -e '# Disable the rest' \
             -e 's:^chown -R "\$USER":}\n_fn_junk() {\n&:g' \
        'jtsdk-wsjt'
      echo '}; _fn_$1' >> 'jtsdk-wsjt'
      chmod 755 'jtsdk-wsjt'
      mkdir -p "${srcdir}/"{tmp,logs}
      LDFLAGS='' './jtsdk-wsjt' configure
    fi
  fi

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  unset LDFLAGS
  unset CFLAGS
  if [ ! -z "${_svnrev}" ] && [ "${_svnrev##*=}" -lt 3908 ]; then
    set +u; msg2 'Building threaded make'; set -u
    make -s -j "$(nproc)"
  else
    if ! :; then
      # Their make isn't threaded. I suppose we could sed that in place though.
      "${srcdir}/${_jtsdk}/src/jtsdk-wsjt" make
    else
      set +u; msg2 'Building threaded make'; set -u
      make -s -j "$(nproc)" 'libjt.a' # The big part can be a threaded make
      set +u; msg2 'Building non threaded make'; set -u
      make -s all
    fi
  fi
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  rm -rf 'build/'
  if [ ! -z "${_svnrev}" ] && [ "${_svnrev##*=}" -lt 3908 ]; then
    python2 'setup.py' install --root="${pkgdir}"
    make PYTHON='true' PREFIX="${pkgdir}/usr" install # Makefile doesn't allow for --root
    sed -i -e 's:python:python2:g' "${pkgdir}/usr/bin/wsjt"
    if [ "${_svnrev##*=}" -le 3819 ]; then
      install -Dpm0644 *.pdf -t "${pkgdir}/usr/share/wsjt/"
    fi
    cp -pra 'RxWav/Samples'/*.[Ww][Aa][Vv] "${pkgdir}/usr/share/wsjt/" # between 3831 and 3868 these changed from .WAV -> .wav
    install -Dpm0644 *.TXT -t "${pkgdir}/usr/share/wsjt/"
  else
    INSTALLD="${pkgdir}/usr/share/${_pkgname}" "${srcdir}/${_jtsdk}/src/jtsdk-wsjt" install
    chmod 644 "${pkgdir}/usr/share/${_pkgname}/"{wsjtrc,kvasd.dat}
    # Why are we leaving Windows DLL files in?
    rm -f "${pkgdir}/usr/share/${_pkgname}/WsjtMod"/*.dll
    # If we don't compile the specjt screen doesn't come up until root runs once to generate the pyc
    python3 -m compileall "${pkgdir}/usr/share/${_pkgname}/"
    # Make a package compatible launcher
    install -Dm755 <(cat << EOF
#!/usr/bin/bash
set -u
mkdir -p ~/.${_pkgname}/RxWav/Samples
cd /usr/share/${_pkgname}/RxWav/Samples
for _sample in *.[Ww][Aa][Vv]; do
  if [ ! -f ~/".wsjt/RxWav/Samples/\${_sample}" ]; then
    ln -s "/usr/share/${_pkgname}/RxWav/Samples/\${_sample}" ~/".wsjt/RxWav/Samples/\${_sample}"
  fi
done
cd ~/.${_pkgname}
python3 /usr/share/wsjt/wsjt.py
EOF
    ) "${pkgdir}/usr/bin/wsjt"
  fi

  # Install a menu item with icon. In XFCE this shows as Other and launches a console window.
  # Placement in the start menu could be better
  install -Dpm644 "${srcdir}/${pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  # Set Terminal=false to supress the terminal screen.
  install -Dpm644 "${srcdir}/${pkgbase}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  set +u
}
set +u
