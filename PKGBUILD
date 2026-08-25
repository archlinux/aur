# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=tigerfs-bin
pkgver=0.7.0 # datasource=github-tags depName=timescale/tigerfs
pkgrel=1
pkgdesc='Mount PostgreSQL as a filesystem. Build apps with files, explore databases with ls and cat. Every write is logged and undoable.'
provides=('tigerfs')
conflicts=('tigerfs')
arch=('aarch64' 'x86_64')
url='https://tigerfs.io/'
license=('MIT')

_repo='https://github.com/timescale/tigerfs'

source_aarch64=("tigerfs_${pkgver}_arm64.tgz::${_repo}/releases/download/v${pkgver}/tigerfs_Linux_arm64.tar.gz")
source_x86_64=("tigerfs_${pkgver}_x86_64.tgz::${_repo}/releases/download/v${pkgver}/tigerfs_Linux_x86_64.tar.gz")
source=("LICENSE-${pkgver}::${_repo}/raw/refs/tags/v${pkgver}/LICENSE")

sha256sums=('2a81317d24906a8bca7ac1f6c6f1f775bf4f21c67c51ce9991c123b95b8ef6ce')
sha256sums_aarch64=('3527c554203f8bacc0a2104c1a6905ac60233e980dfa488cb03693ad061e1033')
sha256sums_x86_64=('fe30c217a5467003d4a9c8602d0f46ce2a59fe14ba142934137bffb36f965a7d')

package() {

	local binary=${pkgdir}/usr/bin/tigerfs
	local docs_dir=${pkgdir}/usr/share/docs/${pkgname}

	install -Dm755 "tigerfs" $binary
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mkdir -p $docs_dir
	cp -r docs skills "README.md" $docs_dir
	chmod 644 $docs_dir -R

	$binary completion bash | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgbase.bash"

	$binary completion fish | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgbase.fish"

	$binary completion zsh | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgbase"
}
