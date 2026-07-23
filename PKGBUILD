# Maintainer: Amekiri Studio <info@amekiri.com>
_name=ssh-alertd
pkgname=ssh-alertd-git
pkgver=0.2.0.r0.g0000000
pkgrel=1
pkgdesc="SSH Alert Daemon: sends an alert (Telegram, ...) on every successful SSH login (latest git)"
arch=('x86_64' 'aarch64')
url="https://github.com/Amekiri-Studio/ssh-alertd"
license=('Apache-2.0')
depends=('glibc' 'systemd')
makedepends=('go' 'git')
optdepends=('openssh: the sshd service whose logins are watched')
provides=("$_name")
conflicts=("$_name")
backup=('etc/ssh-alertd/config.json')
install="$_name.install"
# Tracks the default branch (main). For bleeding-edge, append '#branch=dev'.
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	# e.g. 0.2.0.r5.gabc1234 (tag + commits-since + short hash); falls back to
	# rCOUNT.gHASH when there are no tags.
	git describe --long --abbrev=7 --tags 2>/dev/null \
		| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
		|| printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$pkgname"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o "$_name" .
}

check() {
	cd "$srcdir/$pkgname"
	go test ./...
}

package() {
	cd "$srcdir/$pkgname"

	# Binary
	install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"

	# systemd unit (rewrite ExecStart from /usr/local/bin to /usr/bin)
	install -Dm644 deploy/ssh-alertd.service \
		"$pkgdir/usr/lib/systemd/system/$_name.service"
	sed -i 's|/usr/local/bin/ssh-alertd|/usr/bin/ssh-alertd|' \
		"$pkgdir/usr/lib/systemd/system/$_name.service"

	# Dedicated system user + config ownership
	install -Dm644 deploy/ssh-alertd.sysusers \
		"$pkgdir/usr/lib/sysusers.d/$_name.conf"
	install -Dm644 deploy/ssh-alertd.tmpfiles \
		"$pkgdir/usr/lib/tmpfiles.d/$_name.conf"

	# Default config (registered in backup= so pacman keeps local edits)
	install -Dm640 config.example.json "$pkgdir/etc/ssh-alertd/config.json"

	# Example email/Telegram templates (nullglob so a tree without examples/ is
	# skipped rather than aborting the build).
	shopt -s nullglob
	for tmpl in examples/email/*.tmpl examples/telegram/*.tmpl; do
		install -Dm644 "$tmpl" \
			"$pkgdir/usr/share/$_name/templates/$(basename "$tmpl")"
	done
	shopt -u nullglob

	# Docs & license
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_name/README.md"
	install -Dm644 config.example.json \
		"$pkgdir/usr/share/doc/$_name/config.example.json"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
