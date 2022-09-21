# Maintainer: Sven Yannick Klein <syk42 dot arch at gmail dot com>
pkgname=firefly
pkgver=2.0.3
pkgrel=2
pkgdesc='A C++ library to perform rational function interpolation over finite fields with a rational number reconstruction to promote the coefficients to Q. Usage of the optional dependencies flint and jemalloc is highly advised.'
arch=('x86_64')
url='https://gitlab.com/firefly-library/firefly.git'
license=('GPL3')
depends=('gmp>=6.1.2', 'zlib>=1.2.11')
makedepends=('cmake>=3.1')
optdepends=('flint>=2.5: faster modular arithmetic', 'jemalloc: better memory allocation')
source=("https://gitlab.com/firefly-library/firefly/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('a368e6cda5c6a5dc35c9369e8d20d4fe5a7e9a9ef8faa03e1f35cd6508e310a9f9bc205216a1e89f63e61b22475c0862eea0b63f906ccb45143e4d7744f128d8')

prepare() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p build
	cd build

	flint=false
	jemalloc=false
	mpi=false
	firefly_exe=true

	echo "Checking for FLINT."
	if [[ "$(pacman -Q flint || true)" == "" ]]; then
		echo "pacman could not find FLINT. FLINT is disabled."
	elif [[ "$(pacman -Q flint | sed 's/flint //')" < "2.5" ]]; then
		echo "Version $(pacman -Q flint | sed 's/flint //') of FLINT is installed but version 2.5 is required at least. FLINT is disabled."
	else
		flint=true
		echo "FLINT is installed. Enabling FLINT for modular arithmetic."
	fi

	echo "Checking for jemalloc."
	if [[ "$(pacman -Q jemalloc || true)" == "" ]]; then
		echo "pacman could not find jemalloc. jemalloc is disabled."
	else
		jemalloc=true
		echo "jemalloc is installed. Enabling jemalloc for memory allocation."
	fi

	#echo "Checking for MPI support."
	#echo "Checking for MPICH."
	#if [[ "$(pacman -Q mpich || true)" == "" ]]; then
	#	echo "pacman could not find MPICH."
	#elif [[ "$(pacman -Q mpich | sed 's/mpich //')" < "3" ]]; then
	#	echo "Version $(pacman -Q mpich | sed 's/flint //') of MPICH is installed but version 3 is required at least"
	#else
	#	mpi=true
	#	firefly_exe
	#	echo "MPICH is installed. Enabling MPI support."
	#fi

	#if [[ "$mpi" == "false" ]]; then
	#	echo "Checking for OpenMPI."
	#	if [[ "$(pacman -Q openmpi || true)" == "" ]]; then
	#		echo "pacman could not find OpenMPI. MPI support is disabled."
	#	elif [[ "$(pacman -Q openmpi | sed 's/openmpi //')" < "3" ]]; then
	#		echo "Version $(pacman -Q openmpi | sed 's/openmpi //') of OpenMPI is installed but version 3 is required at least. MPI support is disabled."
	#	else
	#		mpi=true
	#		firefly_exe=false
	#		echo "OpenMPI is installed. Enabling MPI support."
	#	fi
	#fi

	if [ "$firefly_exe" == "true" ]; then
		cmake .. -DFIREFLY_EXECUTABLE=true -DWITH_FLINT="$flint" -DWITH_JEMALLOC="$jemalloc" -DWITH_MPI="$mpi"
	else
		cmake .. -DWITH_FLINT="$flint" -DWITH_JEMALLOC="$jemalloc" -DWITH_MPI="$mpi"
	fi
}

build() {
	cd $srcdir/$pkgname-$pkgver
	cd build
	make -j$(grep -c '^processor' /proc/cpuinfo)


	echo -e "\n\n\033[1;34mFireFly uses third party code and uses several interpolation\nalgorithms. Please refer to https://gitlab.com/firefly-library/firefly\nfor further information. When using FireFly in a scientific\npublication, please refer to the papers given on the website.\033[0m\n\n"
}

check() {
	cd $srcdir/$pkgname-$pkgver
	cd build
	make check
}

package() {
	#install the binaries
	install -Dm755 "$srcdir/$pkgname-$pkgver/build/ff_insert" "$pkgdir/usr/bin/ff_insert"
	install -Dm755 "$srcdir/$pkgname-$pkgver/build/firefly" "$pkgdir/usr/bin/firefly"

	#install the libraries
	install -Dm755 "$srcdir/$pkgname-$pkgver/build/libfirefly.a" "$pkgdir/usr/lib/libfirefly.a"
	install -Dm755 "$srcdir/$pkgname-$pkgver/build/libfirefly.so" "$pkgdir/usr/lib/libfirefly.so"

	#install the packageconfig file
	install -Dm644 "$srcdir/$pkgname-$pkgver/build/firefly.pc" "$pkgdir/usr/lib/pkgconfig/firefly.pc"

  #install the header files
  install -dm755 "$pkgdir/usr/include/$pkgname/"
  install -m644 $srcdir/$pkgname-$pkgver/source/include/$pkgname/*.hpp "$pkgdir/usr/include/$pkgname/"
  install -m644 $srcdir/$pkgname-$pkgver/source/include/$pkgname/*.h "$pkgdir/usr/include/$pkgname/"
  install -Dm644 "$srcdir/$pkgname-$pkgver/build/include/$pkgname/version.hpp" "$pkgdir/usr/include/$pkgname/version.hpp"
  install -Dm644 "$srcdir/$pkgname-$pkgver/build/include/$pkgname/config.hpp" "$pkgdir/usr/include/$pkgname/config.hpp"

	#install the manual (the firefly papers)
	install -Dm644 "$srcdir/$pkgname-$pkgver/pdf/firefly.pdf" "$pkgdir/usr/share/doc/$pkgname/firefly.pdf"
	install -Dm644 "$srcdir/$pkgname-$pkgver/pdf/firefly-2.pdf" "$pkgdir/usr/share/doc/$pkgname/firefly-2.pdf"

	#install the license
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
