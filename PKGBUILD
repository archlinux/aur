# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Allonsy < linuxbash8 [at@at] gmail [dot.dot] com >

pkgname=git-town
pkgver=16.4.0
pkgrel=1
pkgdesc='Generic, high-level Git workflow support'
url="https://github.com/$pkgname/$pkgname"
arch=(x86_64)
license=(MIT)
depends=(git)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('99a50ad8c3713c86304f3858facc1e7ed20ae7077e4c9d8b4a324b7c62b97c5d')

build() {
	cd "$_archive"
	local _date=$(date +'%Y/%m/%d' ${SOURCE_DATE_EPOCH:+-d @$SOURCE_DATE_EPOCH})
	local _varpath='github.com/git-town/git-town/src/cmd'
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-X $_varpath.version=$pkgver -X $_varpath.buildDate=$_date -linkmode external -extldflags \"${LDFLAGS}\"" \
		.
	for s in bash fish zsh; do
		./$pkgname completions $s > completions.$s
	done
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 completions.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm0644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
	install -Dm0644 completions.zsh  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
