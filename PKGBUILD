pkgname=openmodelica-dev-omplot
pkgver=1.13.0
pkgrel=1

pkgdesc="The Open Source Modelica Suite - OpenModelica Plot"
arch=('i686' 'x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
groups=(openmodelica-dev)

_group=OpenModelica
_name=OMPlot
_commit=7f2c3327a03328c0686b9f97331a83a35d2bb80c

depends=('openmodelica-dev-omc' 'openmodelica-dev-qwt' 'java-environment' 'lpsolve' 'hdf5-openmpi' 'omniorb' 'openscenegraph' 'sundials' 'libatomic_ops' 'python' 'gtkglext' 'ruby' 'coin-or-ipopt' 'qjson' 'suitesparse' 'boost-libs' 'qt5-webkit' 'qt5-svg' 'qt5-tools')

makedepends=('openmodelica-dev-qwt' 'gcc-fortran' 'boost' 'clang' 'cmake' 'java-environment' 'antlr2' 'git' 'expat' 'ncurses' 'readline' 'opencl-headers' 'imagemagick')

provides=('openmodelica-omplot')
conflicts=('openmodelica' 'openmodelica-omplot' 'openmodelica-git')

source=(  "git+https://github.com/${_group}/${_name}.git#commit=${_commit}"
          'omplot.desktop')
sha1sums=('SKIP'
          '37c6459c391f9cf11a5c7565bc6d602087bde4b8')

prepare() {
  cd "$srcdir/$_name"
  git checkout "${_commit}"
  sed -i "s,../,https://github.com/${_group}/,g" .gitmodules
  git submodule sync
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_name"
  autoconf
  export CPPFLAGS="$CPPFLAGS -DH5_USE_18_API"
  ./configure --prefix=/usr/ --with-omniORB  CXX=clang++
  make mkbuilddirs
  make -C OMPlot/OMPlotGUI -f Makefile.unix
	cp -a OMPlot/OMPlotGUI/*.h build/include/omplot
}

package() {
  cd "$srcdir/$_name/build"
  mkdir -p ${pkgdir}/usr
  cp -r * ${pkgdir}/usr

  cd "$srcdir/$_name"
  mkdir -p "$srcdir/tmp"

  cp "OMPlot/OMPlotGUI/Resources/icons/omplot.ico"  "$srcdir/tmp/omplot.ico"

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
