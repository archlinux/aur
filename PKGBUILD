#
# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
#
# Note: Apache ant and java must be on the path for make to succeed.
#       If either was installed as a dependency during the build, you
#       will need to log out and then log back in for the changes to
#       your path and JAVA_HOME environment variable to take effect.
#
pkgname=rstudio-server-git
_gitname="rstudio"
pkgver=v1.1.218.r26.g6fd0aac880
pkgrel=1
pkgdesc="A new integrated development environment (IDE) for R programming language"
arch=('i686' 'x86_64')
url="http://www.rstudio.org/"
license=('AGPL3')
depends=('r>=2.11.1' 'boost-libs>=1.5' 'util-linux' 'gcc-libs' 'openssl-1.0')
makedepends=('git' 'cmake>=2.8' 'boost>=1.5' 'java-runtime' 'apache-ant' 'unzip' 'openssl' 'bzip2' 'pango' 'pam' 'zlib' 'wget')
install="${pkgname}.install"
conflicts=('rstudio-server')
source=('git://github.com/rstudio/rstudio.git'
	'rstudio-server.service'
	'socketproxy-openssl.patch'
	'ssl.patch')
md5sums=('SKIP'
         'eea28f7865720f6c8d5de12f3f631880'
         'd571313f511ad4a17014c4aef6d01bbc'
         '9012aeab620b45aa74f6f4db3f192b44')
         

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare () {
	msg "Apply socketproxy-openssl.patch"
	cd ${srcdir}/$_gitname
	patch -p1 < ${srcdir}/socketproxy-openssl.patch
	patch -p1 < ${srcdir}/ssl.patch
}


build() {
  cd "${srcdir}/$_gitname/dependencies/common"
  msg "Downloading and installing dependencies"
  ./install-gwt
  ./install-dictionaries
  ./install-mathjax
  ./install-pandoc
  ./install-libclang
  ./install-packages  

  # Small hack
  # unset user Rprofile.r variable for building
  if [ -n $R_PROFILE_USER ]; then
	  unset R_PROFILE_USER
  fi
  # Configure with cmake in a new buld directory as recommended in the rstudio INSTALL file
  rm -rf ${srcdir}/$_gitname/build
  mkdir "${srcdir}/$_gitname/build"
  cd "${srcdir}/$_gitname/build"
  # Configure cmake 
  cmake -DRSTUDIO_TARGET=Server -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/lib/rstudio-server -DCMAKE_DL_LIBRARIES=/usr/lib64/libdl.so -DCMAKE_LIBR_DOC_DIR=/usr/share/doc/R -DCMAKE_LIBR_EXECUTABLE=/usr/bin/R -DCMAKE_LIBR_HOME=/usr/lib64/R -DCMAKE_LIBR_INCLUDE_DIRS=/usr/include/R -DCMAKE_LIBR_CORE_LIBRARY=usr/lib64/R/lib/libR.so ..

  # Make
  make
}


package() {
# Install
  msg "Installing to pkgdir"
  cd "${srcdir}/$_gitname/build"
  make DESTDIR="$pkgdir" install
# Extras (pam, var)
  msg "Install additional files..."
  install -d "${pkgdir}/etc/pam.d"
  install -Dm 644 "${pkgdir}/usr/lib/rstudio-server/extras/pam/rstudio" "${pkgdir}/etc/pam.d/rstudio"
  # rstudio home directory
  install -d "${pkgdir}/srv/rstudio"
#  mv "${pkgdir}/usr/lib/rstudio-server/www" "${pkgdir}/srv/rstudio"
#  rm -rf "${pkgdir}/usr/lib/rstudio-server/extras"
  install -d "${pkgdir}/usr/lib//systemd/system"
  install -Dm 644 "${srcdir}/rstudio-server.service" "${pkgdir}/usr/lib//systemd/system/rstudio-server.service"
  install -d "${pkgdir}/etc/rstudio"
# vars
mkdir -p ${pkgdir}/run/rstudio-server ${pkgdir}/lock/rstudio-server ${pkgdir}/var/log/rstudio-server ${pkgdir}/var/lib/rstudio-server
# lns
mkdir -p $pkgdir/usr/bin
ln -s /usr/lib/rstudio-server/bin/rserver $pkgdir/usr/bin/rserver
ln -s /usr/lib/rstudio-server/bin/rstudio-server $pkgdir/usr/bin/rstudio-server
}
