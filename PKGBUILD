pkgname=openmodelica-omshell
pkgver=1.13.2
pkgrel=1

pkgdesc="The Open Source Modelica Suite - OpenModelica Shell"
arch=('i686' 'x86_64')
url="https://openmodelica.org"
license=('OSMC-PL')
groups=(openmodelica)

_group=OpenModelica
_name=OMShell
_commit=0cdc045cf0313aa613c65e1db7df2c28654eadb8

depends=('openmodelica-omc' 'java-environment' 'lpsolve' 'hdf5-openmpi' 'omniorb' 'openscenegraph' 'sundials' 'libatomic_ops' 'python' 'gtkglext' 'ruby' 'coin-or-ipopt' 'suitesparse' 'boost-libs' 'qt5-webkit' 'qt5-svg' 'qt5-tools')

makedepends=('gcc-fortran' 'boost' 'clang' 'cmake' 'java-environment' 'antlr2' 'git' 'expat' 'ncurses' 'readline' 'opencl-headers' 'imagemagick')

conflicts=('openmodelica-dev' 'openmodelica-dev-omshell' 'openmodelica-git')

source=(  "git+https://github.com/${_group}/${_name}.git#commit=${_commit}"
          'omshell.desktop')
sha1sums=('SKIP'
          'e2543f90cfaefe2036300e8c14eceb9ebb02413b')

prepare() {
  cd "$srcdir/$_name"
  git checkout "${_commit}"
  sed -i "s,../,https://github.com/${_group}/,g" .gitmodules
  git submodule sync
  git submodule update --init --recursive
  cd "$srcdir"
  cd "$srcdir/$_name"
}

build() {
  cd "$srcdir/$_name"
  autoconf
  export CPPFLAGS="$CPPFLAGS -DH5_USE_18_API"
  ./configure --prefix=/usr/ --with-omniORB  --with-cppruntime --with-lapack='-llapack -lblas'
  make
}

package() {
  cd "$srcdir/$_name/build"
  mkdir -p ${pkgdir}/usr
  cp -r * ${pkgdir}/usr

  cd "$srcdir/$_name"
  mkdir -p "$srcdir/tmp"

  cp "OMShell/OMShellGUI/Resources/omshell.ico" 								 "$srcdir/tmp/omshell.ico"

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
