# Maintainer: Geyslan G. Bem <geyslan@gmail.com>

pkgname=pje-office
pkgver=1.0.8
pkgrel=1
pkgdesc="PJeOffice is a software made available by CNJ for electronic signing PJe system's documents"
arch=('i686' 'x86_64')
url='http://www.cnj.jus.br/wiki/index.php/PJeOffice'
license=('BSD')
makedepends=('deb2targz' 'coreutils')
source_i686=('ftp://ftp.cnj.jus.br/pje/programs/pje-office/'$pkgname'_'$pkgver'_i386.deb')
source_x86_64=('ftp://ftp.cnj.jus.br/pje/programs/pje-office/'$pkgname'_'$pkgver'_amd64.deb')
install='pje-office.install'
md5sums_i686=('c7d3df1069a1f9f12be41659ef4f7be7')
md5sums_x86_64=('f971eba91dfa913b5d7e7c404681ba00')

_clean() {
	echo "- Cleaning up $srcdir"
	rm -rf ${srcdir}/*
}

_fix() {
	local _launcher

	echo "- Fixing launcher"
	_launcher=usr/share/pje-office/pjeOffice.sh
	sed -i 's/^DIR=.*/DIR=$( cd "$( dirname $(readlink -f "${BASH_SOURCE[0]}" ) )" \&\& pwd )/' $_launcher

	echo "- Creating symbolic link to /$_launcher"
	mkdir -p usr/bin
	ln -s "/$_launcher" usr/bin/pjeOffice
}

prepare() {
	local _arch
	local _filename

	if [[ $CARCH == "i686" ]]; then
		_srcfile="$(basename $source_i686)"
	else
		_srcfile="$(basename $source_x86_64)"
	fi

	# realpath
	_srcfile="$(realpath ../$_srcfile)"
	# remove extension
	_srcfile="${_srcfile%.*}"

	_clean
	echo "- Converting deb to tar.xz"
	deb2targz "$_srcfile.deb"

	echo "- Extracting tar.xz"
	tar xf "$_srcfile.tar.xz"

	_fix
}

package() {
	cp -R usr/ "$pkgdir"
	chmod 755 "$pkgdir/usr/share/pje-office/pjeOffice.sh"
}
