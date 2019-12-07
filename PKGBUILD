# Maintainer: Paul Blondel <contact@ixian.ai>
pkgname=treefrog-framework-git
_pkg_major=1.26
_pkg_minor=0
_commit=d4465fd0058fffb16018a7b93a61b80ca742b139
pkgver=$_pkg_major.$_pkg_minor
pkgrel=1
pkgdesc="High-speed C++ MVC Framework for Web Application"
arch=('x86_64' 'x86')
url="https://www.treefrogframework.org"
license=('BSD3')
depends=('mongo-c-driver' 'qt5-tools' 'qt5-xmlpatterns' 'qt5-declarative')
source=("git+https://github.com/treefrogframework/treefrog-framework.git#commit=$_commit")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	echo "Nothing to prepare."
}

build() {
	cd "treefrog-framework"
	
	include_dir="$(pwd)/include"
	include_dir=$(echo $include_dir | sed 's./.\\/.g')

	src_include_dir="$(pwd)/src"
	src_include_dir=$(echo $src_include_dir | sed 's./.\\/.g')

	lib_dir="$(pwd)/src"
	lib_dir=$(echo $lib_dir | sed 's./.\\/.g')
	
	./configure --prefix=/usr --enable-gui-mod --enable-shared-mongoc	i

	# Compile TreeFrog
	cd src
	make

	# Compile TreeFrog tools
	cd ../tools
	
	sed -i s/"\/usr\/include\/treefrog"/"$include_dir"/g "Makefile"	
	sed -i s/"\/usr\/include\/treefrog"/"$include_dir"/g "tfmanager/Makefile"	
	sed -i s/"\/usr\/include\/treefrog"/"$include_dir"/g "tfserver/Makefile"	
	sed -i s/"\/usr\/include\/treefrog"/"$include_dir"/g "tmake/Makefile"	
	sed -i s/"\/usr\/include\/treefrog"/"$include_dir"/g "tspawn/Makefile"	
	
	sed -i s/"-isystem $include_dir"/"-isystem $include_dir -isystem $src_include_dir"/g "tfmanager/Makefile"	
	sed -i s/"-isystem $include_dir"/"-isystem $include_dir -isystem $src_include_dir"/g "tfserver/Makefile"	
	sed -i s/"-isystem $include_dir"/"-isystem $include_dir -isystem $src_include_dir"/g "tmake/Makefile"	
	sed -i s/"-isystem $include_dir"/"-isystem $include_dir -isystem $src_include_dir"/g "tspawn/Makefile"	

	# This generates "reference to $srcdir" warnings (solved during dependency resolving)
	sed -i s/"-L\/usr\/lib"/"-L\/usr\/lib -L$lib_dir"/g "tfmanager/Makefile"	
	sed -i s/"-L\/usr\/lib"/"-L\/usr\/lib -L$lib_dir"/g "tfserver/Makefile"	
	sed -i s/"-L\/usr\/lib"/"-L\/usr\/lib -L$lib_dir"/g "tmake/Makefile"	
	sed -i s/"-L\/usr\/lib"/"-L\/usr\/lib -L$lib_dir"/g "tspawn/Makefile"	
	
	make
}

check() {
	echo "Nothing to check."
}

package() {
	cd "treefrog-framework"
	cd src
	make INSTALL_ROOT="${pkgdir}" install
	cd ../tools/
	make INSTALL_ROOT="${pkgdir}" install
}
