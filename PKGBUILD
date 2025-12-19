# Maintainer: B-Silent <ben10ruitenbeek@gmail.com>

pkgname="docker-compose-bin"
pkgver="5.0.1"
pkgrel=4
pkgdesc="Official Docker Compose build; docker compose version shows the real version."
url="https://github.com/docker/compose"
arch=("x86_64")
license=("MIT")
depends=('docker')
conflicts=('docker-compose')
options=(!debug)

_binary=docker-compose-linux-x86_64

source=("$_binary-$pkgver::$url/releases/download/v$pkgver/$_binary" "LICENSE::$url/raw/refs/tags/v$pkgver/LICENSE")
sha256sums=("cdc1df64412ed009312afbc044b3625144d06c07736e2f7a77fb0460531b9327" "58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd")

package() {
	chmod +x "${srcdir}/$_binary-$pkgver"

	# Install binary
	install -Dm755 "${srcdir}/$_binary-$pkgver" "${pkgdir}/opt/$pkgname/$_binary"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/$pkgname/LICENSE"

	# Symlink binary for user
	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/opt/${pkgname}/${_binary}" "$pkgdir/usr/bin/docker-compose"

	# Symlink the binary to Docker CLI plugin directory
	install -dm755 "$pkgdir/usr/lib/docker/cli-plugins"
	ln -sf "/opt/${pkgname}/${_binary}" "$pkgdir/usr/lib/docker/cli-plugins/docker-compose"

	# Symlink license
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	ln -sf "../../opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
