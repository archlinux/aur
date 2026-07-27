# Maintainer: John Allen <github@porcnick.com>
pkgname=linearfs-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Mount your Linear workspace as a FUSE filesystem — browse and edit issues as markdown (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/jra3/linear-fuse"
license=('MIT')
depends=('fuse3')
provides=('linearfs')
conflicts=('linearfs')
# The release binary is already stripped (goreleaser -s -w); re-stripping a Go
# binary can drop its build info, so leave it as shipped. !debug because there
# are no debug symbols to split out of a stripped prebuilt binary.
options=('!strip' '!debug')
install="$pkgname.install"
source_x86_64=("linearfs-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/linearfs_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("linearfs-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/linearfs_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('cab935c955fb26c1e655b3e8a2222951e0d04f75466e93b379d0c2cd0bd3f0bd')
sha256sums_aarch64=('0d5ed31b69ffca9f0b54b55617c72bc67f1d47b411e80641145dc0a8ddace2fe')

package() {
	install -Dm755 linearfs "$pkgdir/usr/bin/linearfs"

	# Ship the systemd *user* service, repointed at the packaged binary. The
	# in-repo unit runs from %h/.local/bin (the from-source install location);
	# a pacman-installed binary lives in /usr/bin. Everything else (the
	# %h/.config/linearfs/env EnvironmentFile, the mount preflight) is unchanged.
	sed 's|%h/.local/bin/linearfs|/usr/bin/linearfs|' \
		contrib/systemd/linearfs.service > linearfs.service.pkg
	install -Dm644 linearfs.service.pkg "$pkgdir/usr/lib/systemd/user/linearfs.service"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	for doc in README.md INSTALL.md KNOWN_ISSUES.md; do
		install -Dm644 "$doc" "$pkgdir/usr/share/doc/$pkgname/$doc"
	done
}
