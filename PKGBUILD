pkgname=openmodelica-dev-omoptim
pkgver=1.13.0
pkgrel=2

pkgdesc="The Open Source Modelica Suite - OpenModelica Model Optimizer"
arch=('i686' 'x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
groups=(openmodelica-dev)

_group=OpenModelica
_name=OMOptim
_commit=6cc37d7b37d9c06f86f27e05656d02bce911d463

depends=('openmodelica-dev-omc' 'java-environment' 'lpsolve' 'hdf5-openmpi' 'omniorb' 'openscenegraph' 'sundials' 'libatomic_ops' 'python' 'gtkglext' 'ruby' 'coin-or-ipopt' 'qjson' 'suitesparse' 'boost-libs' 'qt5-webkit' 'qt5-svg' 'qt5-tools')

makedepends=('gcc-fortran' 'boost' 'clang' 'cmake' 'java-environment' 'antlr2' 'git' 'expat' 'ncurses' 'readline' 'opencl-headers' 'imagemagick')

provides=('openmodelica-omoptim')
conflicts=('openmodelica' 'openmodelica-omoptim' 'openmodelica-git')

source=(  "git+https://github.com/${_group}/${_name}.git#commit=${_commit}"
          'omoptim.desktop')
sha1sums=('SKIP'
          '4ee28e053d8fab275cdf930fbb0482cce1b3548d')

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
  ./configure --prefix=/usr/ CXX=g++
  make
}

package() {
  cd "$srcdir/$_name/build"
  mkdir -p ${pkgdir}/usr/bin
  cp  bin  ${pkgdir}/usr/bin/OMOptim

  cd "$srcdir/$_name"
  mkdir -p "$srcdir/tmp"

  cp "OMOptim/GUI/Resources/omoptim.ico" "$srcdir/tmp/omoptim.ico"

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
