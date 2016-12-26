# Contributor: Tom < reztho at archlinux dot us >
#
# Thanks to Alan Heckert from NIST for his support

pkgname=dataplot
pkgver=2016_12_09
pkgrel=2
pkgdesc="Software for scientific visualization, statistical analysis, and non-linear modeling."
arch=('i686' 'x86_64')
url="http://www.itl.nist.gov/div898/software/dataplot.html/"
license=('custom')
depends=('gd' 'gcc-libs' 'fontconfig' 'expat' 'libpng' 'zlib' 'libjpeg' 'libx11' 'freetype2' 'tcsh' 'readline' 'termcap' 'tk')
makedepends=('imagemagick' 'gcc-fortran' 'gendesk')
backup=('usr/share/dataplot/frscript/xdpConfig')
source=("http://www.itl.nist.gov/div898/software/dataplot/ftp/unix/dpsrc_${pkgver}.tar.gz"
        "http://www.itl.nist.gov/div898/software/dataplot/ftp/unix/dplib.tar.gz"
        "dataplot.sh")
noextract=("dpsrc_${pkgver}.tar.gz"
           "dplib.tar.gz")

build() {
  cd ${srcdir}
  gendesk -n -f \
          --pkgname="x${pkgname}" \
          --pkgdesc="${pkgdesc}" \
          --name="xdataplot" \
          --categories="Education;Science;Math;" \
          --exec="/usr/bin/xdataplot" \
          --startupnotify=true
  
  # Make the directory for dataplot source files
  if [ ! -d ${srcdir}/dpsrc ];then
         mkdir -p ${srcdir}/dpsrc
  fi
  cd ${srcdir}/dpsrc
  bsdtar -xf ${srcdir}/dpsrc_${pkgver}.tar.gz

  _build_script=build_linux_gfortran.bash

  # I prefer not to sacrifice precision and/or good behaviour for speed 
  # If you want speed, just comment the next line
  sed -i 's@IOPT="-O1"@#IOPT="-O1"@' ${srcdir}/dpsrc/${_build_script}

  # By default, the build script is for 64 bit machines, so I change it in case of 
  # compiling the package in a 32 bit machine
  if [ "${CARCH}" = "i686" ]; then
   sed -i 's@IBIT=64@#IBIT=64@' ${srcdir}/dpsrc/${_build_script}
   sed -i 's@#IBIT=32@IBIT=32@' ${srcdir}/dpsrc/${_build_script}
  fi

  # Running the build script
  chmod +x ${_build_script}
  ./${_build_script}
}

package() {
  cd ${srcdir}/dpsrc
  
  # Moving the dataplot binary to ${pkgdir}
  install -dm755 ${pkgdir}/usr/bin/
  install -m755 ${srcdir}/dpsrc/dataplot ${pkgdir}/usr/bin/dataplot

  # Preparing the dataplot auxiliary files
  install -dm755 ${pkgdir}/usr/share/dataplot/
  cd ${pkgdir}/usr/share/dataplot/
  bsdtar -xf ${srcdir}/dplib.tar.gz

  # Modifying the xdataplot script
  sed -i 's@#set tcl_prefix = /usr/local/lib@set tcl_prefix = /usr@' frscript/xdataplot
  sed -i "s@/lib/dataplot/@/share/dataplot/@g" frscript/xdataplot
  sed -i "s@/lib/frscript/@/share/dataplot/frscript/@g" frscript/xdataplot
  
  source /usr/lib/tclConfig.sh
  sed -i "s@/lib/tcl@/lib/tcl${TCL_VERSION}@" frscript/xdataplot
  
  source /usr/lib/tkConfig.sh
  sed -i "s@/lib/tk@/lib/tk${TK_VERSION}@" frscript/xdataplot

  # Modifying the config file of xdataplot
  sed -i 's@dataplot unix    /usr/local/bin/dataplot@dataplot unix    /usr/bin/dataplot@' frscript/xdpConfig
  sed -i 's@library  unix    /usr/local/lib/dataplot@library  unix    /usr/share/dataplot@' frscript/xdpConfig

  # Symbolic link for xdataplot in /usr/bin
  ln -s /usr/share/dataplot/frscript/xdataplot ${pkgdir}/usr/bin/xdataplot

  # Icon and .desktop files
  install -dm755 ${pkgdir}/usr/share/pixmaps
  /usr/bin/convert ${pkgdir}/usr/share/dataplot/frscript/xdpIcon.xbm \
  ${pkgdir}/usr/share/pixmaps/xdataplot.png
  install -dm755 ${pkgdir}/usr/share/applications
  install -m644 ${srcdir}/xdataplot.desktop ${pkgdir}/usr/share/applications/

  # Copying dataplot.sh to ${pkgdir}/etc/profile.d so dataplot will know
  # where its files are
  install -dm755 ${pkgdir}/etc/profile.d/
  cp ${srcdir}/dataplot.sh ${pkgdir}/etc/profile.d/
  
  # License/Disclaimer
  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
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

md5sums=('b46dcb3b49487da6ab1d4989f6b84739'
         '0d0c534cf995c1b1119d9437835de068'
         'd212f5842a9bab712d6353dbb66198d8')
