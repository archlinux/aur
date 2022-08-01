# Maintainer: Yann Büchau <nobodyinperson at posteo de>
# Previous Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
#
# Note: Apache ant and java must be on the path for make to succeed.
#       If either was installed as a dependency during the build, you
#       will need to log out and then log back in for the changes to
#       your path and JAVA_HOME environment variable to take effect.
#
pkgname=rstudio-server-git
_gitname="rstudio"
pkgver=v2022.02.3+492.r1692.g7faaa81408
_gwtver=2.8.2
_ginver=2.1.2
_nodever=16.14.0
pkgrel=1
pkgdesc="A new integrated development environment (IDE) for R programming language"
arch=('i686' 'x86_64')
url="http://www.rstudio.org/"
license=('AGPL3')
depends=('r>=3.0.1' 'boost-libs>=1.69' 'openssl' 'mathjax2' 'pandoc' 'clang' 'postgresql-libs' 'sqlite3' 'soci' 'yaml-cpp' 'hunspell-en_US')
makedepends=('git' 'quarto-cli-bin' 'cmake>=3.4.3' 'boost>=1.69' 'jdk8-openjdk' 'apache-ant' 'unzip' 'bzip2' 'pango' 'pam' 'zlib' 'wget' 'yarn')
install="${pkgname}.install"
conflicts=('rstudio-server')
source=('git+https://github.com/rstudio/rstudio.git'
	'rstudio-server.service'
	"https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/google-gin/gin-${_ginver}.zip"
        "https://storage.googleapis.com/gwt-releases/gwt-${_gwtver}.zip"
	"https://nodejs.org/dist/v${_nodever}/node-v${_nodever}-linux-x64.tar.gz"
)
md5sums=('SKIP'
         'eea28f7865720f6c8d5de12f3f631880'
         'e2617189fe5c138945b8cc95f26bd476'
         'c295406d68c5ef364e445068599aa6d4'
         'a46e501a201be6c3c05c0f770c375372')
         

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare () {
    if test "`archlinux-java get`" != "java-8-openjdk";then
        cat<<EOT
    Your default Java version is set to `archlinux-java get`, not java-8-openjdk!

    Fix it with:

        archlinux-java set java-8-openjdk

EOT
        exit 1
    fi

    _rstudio_node_version=$(perl -ne 'print "$1" if(m/RSTUDIO_NODE_VERSION\s*"([^"]+)/)' "$srcdir"/rstudio/src/node/CMakeNodeTools.txt)
    if test "$_nodever" != "$_rstudio_node_version";then
        cat<<EOT
    node version in PKGBUILD ($_nodever) does not match what RStudio server expects ($_rstudio_node_version).

    Fix it by updating the \$_nodever variable in the PKGBUILD:

    ...
    \$_nodever="$_rstudio_node_version"
    ...

    Then clean the PKGBUILD repo (git clean -ffdx), update the pkgsums (updpkgsums) and rebuild (makepkg -sf)

EOT
        exit 1
    fi

	cd ${srcdir}/$_gitname
	# Patching SOCI
	# patch -p1 < ${srcdir}/soci.patch
	# patch -p1 < ${srcdir}/rstudio_boost.patch

	msg "Extracting dependencies..."
	    cd "${srcdir}/${_gitname}/src/gwt"
	    install -d lib/{gin,gwt}
	    install -d lib/gin/${_ginver}
	    install -d lib/gwt/${_gwtver}
	    unzip -qo "${srcdir}/gin-${_ginver}.zip" -d lib/gin/${_ginver}
	    cp -r "${srcdir}/gwt-${_gwtver}/"* lib/gwt/${_gwtver}

	    cd "${srcdir}/${_gitname}/dependencies/common"
	    _pandocver=$(grep -oP "(?<=PANDOC_VERSION=\").*(?=\"$)" install-pandoc)
	    install -d pandoc/${_pandocver}

	    ln -sfT "/usr/share/myspell/dicts" dictionaries
	    ln -sfT "/usr/share/mathjax2" mathjax-27
   	    ln -sfT /opt/quarto quarto
	    ln -sfT "/usr/bin/pandoc" pandoc/${_pandocver}/pandoc
	    ln -sfT "/usr/bin/pandoc-citeproc" pandoc/${_pandocvec}/pandoc-citeproc

	    # Nodejs
	    install -d node/${_nodever}
	    cp -r ${srcdir}/node-v${_nodever}-linux-x64/* node/${_nodever}
	    cd ${srcdir}/${_gitname}/src/gwt/panmirror/src/editor
	    yarn config set ignore-engines true
	    yarn install

	    # Fix links for src/cpp/session/CMakeLists.txt
	    cd "${srcdir}/${_gitname}/dependencies"
	    ln -sfT common/dictionaries dictionaries
   	    ln -sfT common/quarto quarto
	    ln -sfT common/mathjax-27 mathjax-27
	    ln -sfT common/pandoc pandoc

	    cd ${srcdir}/${_gitname}/dependencies/common
	    # ./install-dictionaries
	    msg "Downloading and installing R packages..."
	    ./install-packages
}


build() {
  # Small hack
  # unset user Rprofile.r variable for building
  if [ -n $R_PROFILE_USER ]; then
	  unset R_PROFILE_USER
  fi

  # Configure with cmake in a new build directory as recommended in the rstudio INSTALL file
  rm -rf ${srcdir}/$_gitname/build
  mkdir "${srcdir}/$_gitname/build"
  cd "${srcdir}/$_gitname/build"

  # Configure cmake 
  cmake -DRSTUDIO_TARGET=Server \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr/lib/rstudio-server \
	-DRSTUDIO_USE_SYSTEM_BOOST=yes \
	-DRSTUDIO_USE_SYSTEM_YAML_CPP=yes \
	-DBoost_NO_BOOST_CMAKE=ON \
	-DRSTUDIO_USE_SYSTEM_SOCI=yes ..

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
