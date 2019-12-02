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
pkgver=v1.2.5019.r1893.gc0a1f4396e
_gwtver=2.8.2
_ginver=2.1.2
_clangver=3.8.0
pkgrel=1
pkgdesc="A new integrated development environment (IDE) for R programming language"
arch=('i686' 'x86_64')
url="http://www.rstudio.org/"
license=('AGPL3')
depends=('r>=3.0.1' 'boost-libs>=1.69' 'openssl' 'mathjax2' 'pandoc' 'clang')
makedepends=('git' 'cmake>=3.4.3' 'boost>=1.69' 'jdk8-openjdk' 'apache-ant' 'unzip' 'bzip2' 'pango' 'pam' 'zlib' 'wget')
install="${pkgname}.install"
conflicts=('rstudio-server')
source=('git://github.com/rstudio/rstudio.git'
	'rstudio-server.service'
	"https://s3.amazonaws.com/rstudio-buildtools/gin-${_ginver}.zip"
	"https://s3.amazonaws.com/rstudio-buildtools/gwt-${_gwtver}.zip"
)
md5sums=('SKIP'
         'eea28f7865720f6c8d5de12f3f631880'
         'e2617189fe5c138945b8cc95f26bd476'
         'c295406d68c5ef364e445068599aa6d4')
         

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare () {
	cd ${srcdir}/$_gitname

	msg "Extracting dependencies..."
	    cd "${srcdir}/${_gitname}/src/gwt"
	    install -d lib/{gin,gwt}
	    install -d lib/gin/${_ginver}
	    install -d lib/gwt/${_gwtver}
	    unzip -qo "${srcdir}/gin-${_ginver}.zip" -d lib/gin/${_ginver}
	    cp -r "${srcdir}/gwt-${_gwtver}/"* lib/gwt/${_gwtver}

	    cd "${srcdir}/${_gitname}/dependencies/common"
	    install -d pandoc libclang/{3.5,builtin-headers}

	    ln -sfT "/usr/share/mathjax2" mathjax-27
	    ln -sfT "/usr/bin/pandoc" pandoc/pandoc
	    ln -sfT "/usr/bin/pandoc-citeproc" pandoc/pandoc-citeproc
	    ln -sfT "/usr/lib/libclang.so" libclang/3.5/libclang.so
	    ln -sfT "/usr/lib/clang/$_clangver/include" libclang/builtin-headers/3.5

	    ./install-dictionaries
	    msg "Downloading and installing R packages..."
	    ./install-packages
}


build() {
  cd "${srcdir}/$_gitname/dependencies/common"

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
  #cmake -DRSTUDIO_TARGET=Server -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/lib/rstudio-server -DCMAKE_DL_LIBRARIES=/usr/lib64/libdl.so -DCMAKE_LIBR_DOC_DIR=/usr/share/doc/R -DCMAKE_LIBR_EXECUTABLE=/usr/bin/R -DCMAKE_LIBR_HOME=/usr/lib64/R -DCMAKE_LIBR_INCLUDE_DIRS=/usr/include/R -DCMAKE_LIBR_CORE_LIBRARY=usr/lib64/R/lib/libR.so  -DRSTUDIO_USE_SYSTEM_BOOST=Yes ..
  cmake -DRSTUDIO_TARGET=Server -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/lib/rstudio-server -DRSTUDIO_USE_SYSTEM_BOOST=yes -DBoost_NO_BOOST_CMAKE=ON ..

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
  install -d "${pkgdir}/srv/rstudio-server"
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
