# Contributor: Tom < reztho at archlinux dot us >
#
# Thanks to Alan Heckert from NIST for his support

pkgname=dataplot
pkgver=2009_08_21
pkgrel=4
pkgdesc="Software for scientific visualization, statistical analysis, and non-linear modeling."
arch=('i686' 'x86_64')
url="http://www.itl.nist.gov/div898/software/dataplot.html/"
license=('custom')
depends=('gd' 'gcc-libs' 'fontconfig' 'expat' 'libpng' 'zlib' 'libjpeg' 'libx11' 'freetype2' 'tcsh')
#'readline'
makedepends=('imagemagick' 'gcc-fortran')
backup=('usr/share/dataplot/frscript/xdpConfig')
_dplibver=2009_07_15
_dcommandver=2009_06_21
source=("ftp://ftp.nist.gov/pub/dataplot/unix/dpsrc_${pkgver}.tar.gz"
	"ftp://ftp.nist.gov/pub/dataplot/unix/dplib.${_dplibver}.tar.gz"
	"ftp://ftp.nist.gov/pub/dataplot/unix/dataplot_command.${_dcommandver}.tar.gz"
	"dataplot.sh"
	"xdataplot.desktop")
noextract=("dpsrc_${pkgver}.tar.gz"
	       "dplib.${pkgver}.tar.gz")

build() {

  # I make the directory for the dataplot source files
  if [ ! -d ${srcdir}/dpsrc ];then
	  mkdir -p ${srcdir}/dpsrc
  fi
  cd ${srcdir}/dpsrc
  bsdtar -xf ${srcdir}/dpsrc_${pkgver}.tar.gz
  
  # Copy the build script...
  _build_script=build_linux_gfortran.bash
  cp ${srcdir}/command/${_build_script} ${srcdir}/dpsrc/ || return 1

  # ...and configure it:
  # - Changing the build directory
  sed -i "s@/usr/local/src/dataplot@${srcdir}/dpsrc@g" ${srcdir}/dpsrc/${_build_script}

  # - I prefer not to sacrifice precision and/or good behaviour for speed 
  # If you want speed, just comment the next line
  sed -i 's@IOPT="-O2"@#IOPT="-O2"@' ${srcdir}/dpsrc/${_build_script}

  # - Enabling readline support
#  sed -i 's@HAVE_RL=off@#HAVE_RL=off@' ${srcdir}/dpsrc/${_build_script}
#  sed -i 's@#HAVE_RL=on@HAVE_RL=on@' ${srcdir}/dpsrc/${_build_script}
#  sed -i 's@-ltermcap@@g' ${srcdir}/dpsrc/${_build_script}

  # - By default, the build script is for i686 machines, so I change it in case of 
  # compiling the package in a 64 bit machine
  if [ "${CARCH}" = "x86_64" ]; then
   sed -i 's@IBIT=32@#IBIT=32@' ${srcdir}/dpsrc/${_build_script}
   sed -i 's@#IBIT=64@IBIT=64@' ${srcdir}/dpsrc/${_build_script}
  fi

  # Running the build script
  chmod +x ${_build_script}
  ./${_build_script}
}

package() {
  cd ${srcdir}/dpsrc
  
  # Moving the dataplot binary to ${pkgdir}
  mkdir -p ${pkgdir}/usr/bin/
  mv ${srcdir}/dpsrc/dataplot ${pkgdir}/usr/bin/ || return 1

  # Preparing the dataplot auxiliary files
  mkdir -p ${pkgdir}/usr/share/dataplot/
  cd ${pkgdir}/usr/share/dataplot/
  bsdtar -xf ${srcdir}/dplib.${_dplibver}.tar.gz

  # - Modifying the xdataplot script
  sed -i 's@/usr/local/lib/dataplot@/usr/share/dataplot@' frscript/xdataplot
  sed -i 's@/usr/share/dataplot/tcl@/usr/lib/tcl8.5/@' frscript/xdataplot
  sed -i 's@/usr/share/dataplot/tk@/usr/lib/tk8.5/@' frscript/xdataplot

  # - Modifying the xdp script
 # sed -i 's@#!/itl/links/generic/bin/wish@#!/usr/bin/tclsh -f@' frscript/xdp

  # - Modifying the config file of xdataplot
  sed -i 's@dataplot unix    /usr/local/bin/dataplot@dataplot unix    /usr/bin/dataplot@' frscript/xdpConfig
  sed -i 's@library  unix    /usr/local/lib/dataplot@library  unix    /usr/share/dataplot@' frscript/xdpConfig

  # - Symbolic link for xdataplot in /usr/bin
  ln -s /usr/share/dataplot/frscript/xdataplot ${pkgdir}/usr/bin/xdataplot

  # Icon and .desktop files
  mkdir -p ${pkgdir}/usr/share/pixmaps
  /usr/bin/convert ${pkgdir}/usr/share/dataplot/frscript/xdpIcon.xbm \
  ${pkgdir}/usr/share/pixmaps/xdataplot.png || return 1
  mkdir -p ${pkgdir}/usr/share/applications
  install -m 644 ${srcdir}/xdataplot.desktop ${pkgdir}/usr/share/applications/ || return 1

  # Copying dataplot.sh to ${pkgdir}/etc/profile.d so dataplot will know
  # where its files are
  mkdir -p ${pkgdir}/etc/profile.d/
  cp ${srcdir}/dataplot.sh ${pkgdir}/etc/profile.d/
  
  # License/Disclaimer
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cat > ${pkgdir}/usr/share/licenses/${pkgname}/${pkgname}.txt << EOF
http://www.itl.nist.gov/div898/software/dataplot/disclaim.htm

DATAPLOT Disclaimer

This software was developed at the National Institute of Standards and Technology by 
employees of the Federal Government in the course of their official duties. Persuant 
to title 17 section 105 of the United States Code this software is not subject to
copyright protection and is in the public domain. Dataplot is an experimental system.
NIST assumes no responsibility whatsoever for its use by other parties, and makes no
guarantees, expressed or implied, about its quality, reliability, or any other
characteristic. 
EOF

  # Correcting the permissions and user/group owners
  find ${pkgdir}/ -type f -exec chmod 644 {} \;
  find ${pkgdir}/ -type d -exec chmod 755 {} \;
  chown -R root:root ${pkgdir}/*
  chmod 755 ${pkgdir}/etc/profile.d/dataplot.sh
  chmod 755 ${pkgdir}/usr/bin/dataplot
  chmod 755 ${pkgdir}/usr/share/dataplot/frscript/xdataplot
  chmod 755 ${pkgdir}/usr/share/dataplot/frscript/xdp
}

md5sums=('d69caec4a853043dc6c4390da61cc34f'
         '6f978d7df658207bf64a08c1edb57b6b'
         'ba4d5a06ca69fa8878c559f4ad6ba73b'
         'd212f5842a9bab712d6353dbb66198d8'
         '5cd4b7779bbfb926bf9daf27d0bd5faf')
