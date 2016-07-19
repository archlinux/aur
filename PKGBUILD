pkgname=openmodelica-dev
pkgver=1.11.0
pkgrel=1

pkgdesc="The Open Source Modelica Suite"
arch=('i686' 'x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')

_name=OpenModelica
_tag=v${pkgver}-dev

depends=('java-environment' 'lpsolve' 'hdf5-openmpi' 'omniorb' 'openscenegraph' 'sundials' 'libatomic_ops' 'python' 'gtkglext' 'ruby' 'coin-or-ipopt' 'qjson' 'suitesparse' 'boost-libs' 'qt5-webkit' 'qt5-svg' 'qt5-tools')

makedepends=('autoconf' 'automake' 'libtool' 'gcc' 'gcc-fortran' 'boost' 'clang' 'cmake' 'jre7-openjdk' 'antlr2' 'subversion' 'expat' 'ncurses' 'readline' 'opencl-headers' 'imagemagick')

provides=('openmodelica')
conflicts=('openmodelica' 'openmodelica-git')

source=(  'git+https://github.com/OpenModelica/OpenModelica.git' 
					'omedit.desktop' 
					'omnotebook.desktop' 
					'omoptim.desktop' 
					'omplot.desktop' 
					'omshell.desktop') 
sha1sums=('SKIP' 
					'1f0b0978f4199fdd383caa2334dae33721d69c20' 
  				'789786ffaa43e1b2bc5c582cf5e0e6ae9073c8c2' 
				 	'4ee28e053d8fab275cdf930fbb0482cce1b3548d' 
					'37c6459c391f9cf11a5c7565bc6d602087bde4b8' 
					'e2543f90cfaefe2036300e8c14eceb9ebb02413b')

prepare() {
    cd "$srcdir/$_name"
    git checkout "tags/${_tag}"
    sed -i "s,../,https://github.com/${_name}/,g" .gitmodules
    git submodule sync
    git submodule update --init --recursive
    cd "$srcdir"
#    patch -p1 < ${srcdir}/omedit.patch
    cd "$srcdir/$_name"
}

build() {
    cd "$srcdir/$_name"
    autoconf
    export CPPFLAGS="$CPPFLAGS -DH5_USE_18_API"
    ./configure --prefix=/usr/ --without-omc --with-omniORB  --with-cppruntime --with-lapack='-llapack -lblas'
    make
}

#check() {
#   cd "${srcdir}/${_svnmod}"
#   make test
#}

#package() {
#    mkdir -p ${pkgdir}/usr/
#    cd "$srcdir/$pkgname"
#    cp -r build/bin/ ${pkgdir}/usr/bin/
#    cp -r build/include/ ${pkgdir}/usr/include/
#    cp -r build/lib/ ${pkgdir}/usr/lib/
#    cp -r build/share/ ${pkgdir}/usr/share/
#}

package() {  
    cd "$srcdir/$_name"
    make install DESTDIR=${pkgdir}

    mkdir -p "$srcdir/tmp"

    cp "OMEdit/OMEdit/OMEditGUI/Resources/icons/omedit.ico"                "$srcdir/tmp/omedit.ico"
    cp "OMNotebook/OMNotebook/OMNotebookGUI/Resources/OMNotebook_icon.ico" "$srcdir/tmp/omnotebook.ico"
    cp "OMOptim/OMOptim/GUI/Resources/omoptim.ico" 												 "$srcdir/tmp/omoptim.ico"
    cp "OMShell/OMShell/OMShellGUI/Resources/omshell.ico" 								 "$srcdir/tmp/omshell.ico"
    cp "OMPlot/OMPlot/OMPlotGUI/Resources/icons/omplot.ico" 							 "$srcdir/tmp/omplot.ico"
		
		cd "$srcdir/tmp/"
		
		for icon in *.ico; do
		  base=$(basename "${icon}" ".ico")
		  convert "${icon}" "${base}.png"
		  for file in ${base}*.png; do 
		    size=$(file $file | grep -Po "\d+ x \d+" | grep -Po "^\d+")
		    install -D -m644 "$file" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${base}.png"
		  done		
		done
		
		cd "$srcdir"
		
		for file in *.desktop; do
		  install -D -m644 "$file" "${pkgdir}/usr/share/applications/${file}"
		done
}
