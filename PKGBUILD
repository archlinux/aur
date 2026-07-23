# Maintainer: Amekiri Studio <info@amekiri.com>
pkgname=ssh-alertd
pkgver=0.2.0
pkgrel=1
pkgdesc="SSH Alert Daemon: sends an alert (Telegram, ...) on every successful SSH login"
arch=('x86_64' 'aarch64')
url="https://github.com/Amekiri-Studio/ssh-alertd"
license=('Apache-2.0')
depends=('glibc' 'systemd')
makedepends=('go')
optdepends=('openssh: the sshd service whose logins are watched')
backup=('etc/ssh-alertd/config.json')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8f32be175c98b9f7dbe45d3bc869cead934342121f8a89f29cf84a09e7e88a7e')

build() {
	cd "$pkgname-$pkgver"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o "$pkgname" .
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"

	# Binary
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

	# systemd unit. The shipped unit targets /usr/local/bin for manual installs;
	# the packaged binary lives in /usr/bin, so rewrite the ExecStart path.
	install -Dm644 deploy/ssh-alertd.service \
		"$pkgdir/usr/lib/systemd/system/ssh-alertd.service"
	sed -i 's|/usr/local/bin/ssh-alertd|/usr/bin/ssh-alertd|' \
		"$pkgdir/usr/lib/systemd/system/ssh-alertd.service"

	# Dedicated system user + config ownership (applied by pacman's
	# systemd-sysusers / systemd-tmpfiles hooks on install).
	install -Dm644 deploy/ssh-alertd.sysusers \
		"$pkgdir/usr/lib/sysusers.d/ssh-alertd.conf"
	install -Dm644 deploy/ssh-alertd.tmpfiles \
		"$pkgdir/usr/lib/tmpfiles.d/ssh-alertd.conf"

	# Default config (registered in backup= so pacman keeps local edits)
	install -Dm640 config.example.json "$pkgdir/etc/ssh-alertd/config.json"

	# Example email/Telegram templates (read-only reference; point a
	# *_template_file at one of these, or copy to /etc/ssh-alertd/templates/ to
	# customize). nullglob so an older source tree without examples/ is skipped
	# rather than aborting the build.
	shopt -s nullglob
	for tmpl in examples/email/*.tmpl examples/telegram/*.tmpl; do
		install -Dm644 "$tmpl" \
			"$pkgdir/usr/share/$pkgname/templates/$(basename "$tmpl")"
	done
	shopt -u nullglob

	# Docs & license
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 config.example.json \
		"$pkgdir/usr/share/doc/$pkgname/config.example.json"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
