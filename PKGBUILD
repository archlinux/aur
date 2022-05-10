# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributors: PastLeo <chgu82837@gmail.com>
# Contributors: koba1t <kobdotsh at gmail dot com>

pkgname=docker-rootless-extras-bin
pkgver=20.10.15
pkgrel=2
pkgdesc="Extras to run docker as non-root."
arch=('x86_64' 'aarch64')
url="https://docs.docker.com/engine/security/rootless/"
license=('Apache')
depends=('docker' 'rootlesskit')
optdepends=('fuse-overlayfs: overlayfs support'
            'slirp4netns: faster network stack')
provides=('docker-rootless' 'docker-rootless-extras')
conflicts=('docker-rootless' 'docker-rootless-extras')
install=$pkgname.install
source=(
	"docker.socket"
	"99-docker-rootless.conf"
)
source_x86_64=(
	"$pkgname-x86_64-$pkgver.tgz::https://download.docker.com/linux/static/stable/x86_64/docker-rootless-extras-$pkgver.tgz"
)
source_aarch64=(
	"$pkgname-aarch64-$pkgver.tgz::https://download.docker.com/linux/static/stable/aarch64/docker-rootless-extras-$pkgver.tgz"
)

sha256sums=('d8695293e5d4a814763f13e1d36ed37273040666b4b91363d6c33171df8934c7'
            'd0d790d4c3d887b10b2b155b83a58a44980b9fa638f8c0f1faec0739dc0ef473')
sha256sums_x86_64=('c3ce8baa27ed6040d618a97d39ff66ef2c45cb357d901806fe0994a9705f7238')
sha256sums_aarch64=('e451daace8a52c6faca225d325e3ba67e5b2b97a5d2a00724e6b87b6a4a13a35')

package() {
	mkdir -p "$pkgdir/usr/bin/"

	install -Dm755 "$srcdir/docker-rootless-extras/dockerd-rootless.sh" "$pkgdir/usr/bin/"
	install -Dm755 "$srcdir/docker-rootless-extras/vpnkit" "$pkgdir/usr/bin/"
	install -Dm644 "$srcdir/docker.socket" "$pkgdir/usr/lib/systemd/user/docker.socket"
	install -Dm644 "$srcdir/99-docker-rootless.conf" "$pkgdir/usr/lib/sysctl.d/99-docker-rootless.conf"

	# The systemd service file is bundled inside the setup script. The script is
	# unsuitable to run in this PKGBUILD, since it tampers with $HOME and other
	# similar paths, so would mess up the environment for users who run
	# `makepkg` on their host.
	# TODO: Send a patch upstream so we can make the script JUST print this.
	awk '/Unit/,/EOT/' "$srcdir/docker-rootless-extras/dockerd-rootless-setuptool.sh" | \
		head -n-1 | \
		sed 's/^[[:space:]]*//' | \
		sed 's|$BIN|/usr/bin|' | \
		sed 's| $DOCKERD_ROOTLESS_SH_FLAGS||' \
		> "$pkgdir/usr/lib/systemd/user/docker.service"

	# Remove the $PATH override, since this will be dependant on $PATH at build
	# time and is usually undesirable.
	# TODO: Patch this upstream.
	sed -i '/Environment=PATH=/d' "$pkgdir/usr/lib/systemd/user/docker.service"
}
