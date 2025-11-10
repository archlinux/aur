# Maintainer: aisuneko icecat <iceneko@protonmail.ch>
pkgbase=protonmail-bridge-free-bin-git
pkgname=(protonmail-bridge-free-bin-git protonmail-bridge-free-core-bin-git)
pkgver=3.21.2
pkgrel=1
pkgdesc="Integrate ProtonMail account with any program that supports IMAP and SMTP (Git prebuilt binary)"
arch=(x86_64)
url="https://github.com/mnixry/proton-bridge"
license=('GPL-3.0-only')
source=("https://nightly.link/mnixry/proton-bridge/workflows/build-multi-platform/master/build-ubuntu-latest.zip"
		"https://gitlab.archlinux.org/archlinux/packaging/packages/protonmail-bridge/-/raw/03d60b89cfb30580ad1bb8bc5c86e28348fa6ad2/protonmail-bridge.service")
sha256sums=("SKIP"
			'5d273f1245fec8549a3daa3fe76e22bb6c23957cf5bcb51c24f878e19c7a5692')

prepare(){
	cd "$srcdir"
	unzip build-ubuntu-latest.zip
	mkdir -p "$pkgbase"
	tgz_file=$(find . -maxdepth 1 -name "*.tgz" -type f | head -n 1)
    tar -xzf "$tgz_file" -C "$pkgbase"
}

package_protonmail-bridge-free-bin-git() {
	pkgdesc="$pkgdesc (Qt desktop application)"
	depends=(protonmail-bridge-free-core-bin-git abseil-cpp gcc-libs glibc grpc hicolor-icon-theme protobuf qt6-base qt6-declarative qt6-svg sentry-native)
	provides=("protonmail-bridge-free-bin-git")
	conflicts=("protonmail-bridge-free")

	cd "$srcdir/$pkgbase"
	install -Dm644 proton-bridge.desktop "$pkgdir/usr/share/applications/proton-bridge.desktop"
	install -Dm644 logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/protonmail-bridge.svg"

	install -Dm755 bridge-gui "$pkgdir/usr/lib/protonmail/bridge/bridge-gui"
	install -dm755 "$pkgdir/usr/bin"
	ln -s /usr/lib/protonmail/bridge/bridge-gui "$pkgdir/usr/bin/protonmail-bridge"
}

package_protonmail-bridge-free-core-bin-git() {
	pkgdesc="$pkgdesc (core executable and daemon)"
	depends=(glib2 glibc libsecret)
	optdepends=(
	'gnome-keyring: gnome-keyring support'
	'org.freedesktop.secrets: Applications that support Freedesktop secrets api'
	'pass: pass support'
	)
	provides=("protonmail-bridge-free-core-bin-git")
	conflicts=("protonmail-bridge-free-core")

	cd "$srcdir/$pkgbase"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
	install -Dm644 -t "$pkgdir/usr/lib/systemd/user" "$srcdir/protonmail-bridge.service"

	install -Dm755 bridge "$pkgdir/usr/lib/protonmail/bridge/bridge"
	install -dm755 "$pkgdir/usr/bin"
	ln -s /usr/lib/protonmail/bridge/bridge "$pkgdir/usr/bin/protonmail-bridge-core"
}
