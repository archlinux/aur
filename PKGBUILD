# Maintainer: Your Name <your.email@example.com>
pkgname=slskd
pkgver=0.26.2
pkgrel=1
pkgdesc='A modern client-server application for the Soulseek file sharing network'
url='https://github.com/slskd/slskd'
arch=('x86_64' 'aarch64' 'armv7h')
license=('AGPL3')
depends=(
	'aspnet-runtime'
)
makedepends=(
	'dotnet-sdk'
	'nodejs'
	'npm'
	'git'
)
provides=(${pkgname})
conflicts=(${pkgname}-git ${pkgname}-bin)
options=('!strip' '!debug')
source=(
	"https://github.com/slskd/slskd/archive/refs/tags/${pkgver}.tar.gz"
	'slskd.service'
	'slskd.sysusers'
	'slskd.tmpfiles'
)
sha256sums=('6ce85d49cc6cae4864e1e048079c633c99fd1f1c182b7e901e041d40b1207ac6'
			'SKIP'
			'SKIP'
			'SKIP'
)

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cd src/web

	npm install --no-audit --no-fund
	npm run build

	rm -rf ../slskd/wwwroot
	mkdir ../slskd/wwwroot

	cp -r build/* ../slskd/wwwroot/

	cd ../../src/slskd

	case "$CARCH" in
		x86_64) rid="linux-x64" ;;
		aarch64) rid="linux-arm64" ;;
		armv7h) rid="linux-arm64" ;;
		*) error "Unsupported architecture: $arch"; return 1 ;;
	esac

	dotnet publish \
		   --configuration Release \
		   --runtime "$rid" \
		   -p:AllowMissingPrunePackageData=true \
		   --self-contained false \
		   --output "$srcdir/publish"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/lib/slskd"
	cp -a "$srcdir/publish/." "$pkgdir/usr/lib/slskd/"

	install -dm755 "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/slskd" <<EOF
#!/bin/sh
exec /usr/bin/dotnet /usr/lib/slskd/slskd.dll "$@"
EOF
	chmod 755 "$pkgdir/usr/bin/slskd"

	if [[ -d config ]]; then
		install -dm755 "$pkgdir/usr/share/slskd"
		cp -a config/. "$pkgdir/usr/share/slskd"
	fi

	install -Dm644 "$srcdir/slskd.service" "$pkgdir/usr/lib/systemd/system/slskd.service"
	install -Dm644 "$srcdir/slskd.sysusers" "$pkgdir/usr/lib/sysusers.d/slskd.conf"
	install -Dm644 "$srcdir/slskd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/slskd.conf"
}
