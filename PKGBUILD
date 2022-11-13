# Maintainer: Benjamin Jones <b33n.jamming+aur@gmail.com>
pkgname=gcc4ti
pkgver=0.96b11
pkgrel=1
pkgdesc="A C cross compiler for the TI-89, TI-89T, TI-92+, and TI-V200"
url="https://debrouxl.github.io/gcc4ti/"
depends=('bash')
makedepends=('git')
arch=('x86_64')
license=('GPL')
source=('git+https://github.com/debrouxl/gcc4ti.git')
md5sums=('SKIP')

#The build function updates the source code
#The function does *not* build the package
#The installation script does not separate the build and installation steps
#This is why the package must be built inside of the package step
build(){
	#Navigate to the scripts directory, where patching scripts are located
	cd "$pkgname/trunk/tigcc-linux/scripts"
	#Update the source code
	./updatesrc
	./package_src
}

#Builds and installs the package
package(){
	#Create the installation directories under $pkgdir
	mkdir -p "$pkgdir/usr/share"
	mkdir -p "$pkgdir/usr/bin"

	#The installation script must be run in its own environment
	#I am still not sure why this is the case

	#I pass PATH and the prefix to the new environment
	#The installation script is interactive, so I must pipe in the installation settings
	env -i PATH="$PATH" PREFIX_GCC4TI="$pkgdir/usr/share/gcc4ti" CFLAGS="$LDFLAGS" srcdir="$srcdir" pkgname="$pkgname" pkgver="$pkgver" "../Install.sh"

	#The package does not provide a binary inside of /usr/bin
	#Instead, I created a script tigcc.sh which sets the variable $TIGCC to '/usr/share/gcc4ti' before executing the binary
	#I would copy the binary files to /usr/bin, but there are too many possible conflicts
	#For example, /usr/share/gcc4ti/bin contains an executable named 'cc1'
	cp "$srcdir/../tigcc.sh" "$pkgdir/usr/bin/tigcc" 
}

