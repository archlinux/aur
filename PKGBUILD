# Maintainer: Matt Coffin <mcoffin13@gmail.com>

pkgname=hid-fanatecff-dkms
_pkgname="${pkgname%-*}"
pkgver=0.2.1
pkgrel=1
pkgdesc='Driver to support force feedback and load cells for the FANATEC controller ecosystem'
arch=(any)
url="https://github.com/gotzl/hid-fanatecff"
license=(GPL-2.0-only)
depends=(dkms)
makedepends=(m4 git awk)
source=(
	"$_pkgname::git+https://github.com/gotzl/hid-fanatecff.git#tag=${pkgver}"
	'dkms.conf.m4'
)
b2sums=(
	'SKIP'
	'1e832ebbdc1166b55170f3a01fada8eea2d5c9ccbf69f1e5cd90d26f77ac87e6b94416869a507ff97ca85c6735523826123c639c40c2f09926585b26398c7a7b'
)

prepare() {
	local src
	for src in "${source[@]}"; do
		src="${src%%::*}"
		src="${src##*/)}"
		[[ $src = *.patch ]] || continue
		echo -e "Applying patch: \\033[1;36m$src\\033[0m"
		patch -Np1 < "$srcdir/$src"
	done
}

package() {
	cd "$srcdir"/"$_pkgname"

	[ -d "$pkgdir"/usr/src/"$_pkgname-$pkgver" ] || mkdir -p "$pkgdir"/usr/src/"$_pkgname-$pkgver"

	pushd "$pkgdir"/usr/src/"$_pkgname-$pkgver" 1> /dev/null
	cp -r "$srcdir"/"$_pkgname"/* ./
	local _f
	for  _f in fanatec.rules LICENSE README.md; do
		[ ! -e "$_f" ] || rm "$_f"
	done
	m4 \
		-D__PKGVER__="$pkgver" \
		-D___PKGNAME__="$_pkgname" \
		"$srcdir"/dkms.conf.m4 > dkms.conf \
		&& chmod 0644 dkms.conf
	popd 1> /dev/null

	install -Dm 0644 -T fanatec.rules "$pkgdir"/usr/lib/udev/rules.d/99-fanatec.rules
	install -Dm 0644 -t "$pkgdir"/usr/share/licenses/"$_pkgname" LICENSE
}
