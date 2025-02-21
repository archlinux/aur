# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Peter Flynn <peter@flynn.network>
pkgname=foundry-bin
pkgver=1.0.0.e144b82070
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
md5sums=('6d16faeb2fc8f12a0083623be892235e')

prepare() {
	cd "$srcdir"
	mkdir -p usr
	export FOUNDRY_DIR="$srcdir/usr"
	# Prevent .bashrc modification
	export PATH="$PATH:$srcdir/usr/bin"

	if [ ! -s foundry.paradigm.xyz ]; then
		echo "Foundry failed to download installer." >&2
		exit 1
	fi
	chmod +x foundry.paradigm.xyz
	./foundry.paradigm.xyz
	if [ ! -s usr/bin/foundryup ]; then
		echo "Foundry failed to download installer." >&2
		exit 1
	fi
	usr/bin/foundryup
	rm usr/bin/foundryup
}

pkgver() {
	cd "$srcdir"
	if [ ! -s usr/bin/forge ]; then
		echo "Foundry failed to download tools." >&2
		exit 1
	fi
    _v_str=$(usr/bin/forge -V) || {
        echo "Foundry tools returned an error." >&2
        exit 1
    }
    # Extract the version and commit hash
    _version=$(echo "$_v_str" | sed -E 's/^forge ([0-9]+\.[0-9]+\.[0-9]+)-.*$/\1/')
    _commit_hash=$(echo "$_v_str" | sed -E 's/.*\(([a-z0-9]+)\s.*/\1/')

    # Combine version and commit hash in the format: 1.0.0.e144b82070
    echo "${_version}.${_commit_hash}"
}

package() {
	cp -R "$srcdir/usr" "$pkgdir/"
}
