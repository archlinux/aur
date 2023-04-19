# Maintainer: Peter Flynn <peter@flynn.network>
pkgname=foundry-bin
pkgver=0.2.0.r20230419
pkgrel=1
pkgdesc="A blazing fast, portable and modular toolkit for Ethereum application development written in Rust"
arch=('aarch64' 'x86_64')
url="https://github.com/gakonst/foundry"
license=('APACHE')
depends=('gcc-libs' 'openssl')
makedepends=('curl' 'bash')
makedepends_aarch64=('rust')
provides=('foundry')
source=('https://foundry.paradigm.xyz')
md5sums=('SKIP')
prepare() {
	cd "$srcdir"
	mkdir usr
	export FOUNDRY_DIR="$srcdir/usr"
	# Prevent .bashrc modification
	export PATH="$PATH:$srcdir/usr/bin"
	if [ ! -s foundry.paradigm.xyz ]; then
		echo "Foundry failed to download installer."
		exit 1
	fi
	chmod +x foundry.paradigm.xyz
	./foundry.paradigm.xyz
	if [ ! -s usr/bin/foundryup ]; then
		echo "Foundry failed to download installer."
		exit 1
	fi
	usr/bin/foundryup
	rm usr/bin/foundryup
}
pkgver() {
	cd "$srcdir"
	if [ ! -s usr/bin/forge ]; then
		echo "Foundry failed to download tools."
		exit 1
	fi
	_v_str=$(usr/bin/forge -V)
	_exit_status=$?
	if [ $_exit_status -ne 0 ]; then
		echo "Foundry tools returned an error."
		exit $_exit_status
	fi
	_v_str_arr=($_v_str)
	echo ${_v_str_arr[1]}.r$(echo ${_v_str_arr[3]//-} | cut -c1-8)
}
package() {
	cp -R "$srcdir/usr" "$pkgdir/"
}
