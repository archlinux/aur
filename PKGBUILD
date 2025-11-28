# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgbase=protonmail-bridge-free
pkgname=(protonmail-bridge-free protonmail-bridge-free-core)
pkgver=3.21.2
pkgrel=9
pkgdesc="Integrate ProtonMail account with any program that supports IMAP and SMTP"
arch=(x86_64)
url="https://github.com/ProtonMail/proton-bridge"
license=('GPL-3.0-only')
makedepends=(abseil-cpp cmake gcc-libs git glib2 glibc go grpc libsecret ninja protobuf qt6-base qt6-declarative qt6-svg sentry-native)
source=("$pkgbase::git+$url#tag=v$pkgver"
	"https://gitlab.archlinux.org/archlinux/packaging/packages/protonmail-bridge/-/raw/03d60b89cfb30580ad1bb8bc5c86e28348fa6ad2/protonmail-bridge.service"
	"https://gitlab.archlinux.org/archlinux/packaging/packages/protonmail-bridge/-/raw/03d60b89cfb30580ad1bb8bc5c86e28348fa6ad2/remove-vcpkg-dependency.patch"
	"fix-wayland-icon.patch::$url/commit/75e7bba6e62ef4b0a58334f2bcc7c56b7769c69c.patch"
	# Patches from https://github.com/mnixry/proton-bridge. They make the app work for free users and only require the patches from this fork to work
	"1.patch::https://github.com/mnixry/proton-bridge/commit/c9f2dd7383ad2b1c0d9ca97c7a0701124f475156.diff"
	"2.patch::https://github.com/mnixry/proton-bridge/commit/3e18e82603030749fc1357b7d7e65444d45d9dd9.diff"
	"3.patch::https://github.com/mnixry/proton-bridge/commit/0276c2eb378647ee035a677c169b41dec9991bab.diff"
	"4.patch::https://github.com/mnixry/proton-bridge/commit/286c87f7e416e237927ffed7afec823996ce58d5.diff"
	"5.patch::https://github.com/mnixry/proton-bridge/commit/e1f61f262548c50b2ca9bd88f9c2e54160bf5bc3.diff"
)
noextract=()
sha256sums=('17e8014f0d30da4720492d2b68d941ddf6d2be12eb337677acf111a003956bc6'
            '5d273f1245fec8549a3daa3fe76e22bb6c23957cf5bcb51c24f878e19c7a5692'
            '436a9a293424fb7d48a8fd61fff7d63985dec56d6170cd2fbae24fe03ef98136'
            '45a68688cf2a06539d60e3e35b112a67319c58c23c35ec4cf3712d2f0cb50cb2'
            '7438f711a6762a34614bc10be8b54c00691bc72743e14767f0b72e9a11051327'
            '795a17dadbd0ae8b9225c9a279b74097e153c9aea0dd8ec55b1c877864805323'
            'c5c13843be7b9389882bdedf3e020bcf59d53189fb2eaf3416d2f2c16582e390'
            '11f4edd80f8910abded7e88a98919e4f00d37332f3bbc1f361cda667826fd1c5'
            '7c6333253c9b98e35e56b7d60077921b32ee2fd55ce9132f602cf86a805d5415')
validpgpkeys=()

prepare() {
	cd "$srcdir/$pkgbase"
	patch -Np1 < "$srcdir/remove-vcpkg-dependency.patch"
	patch -Np1 < "$srcdir/fix-wayland-icon.patch"
	patch -Np1 < "$srcdir/1.patch"
	patch -Np1 < "$srcdir/2.patch"
	patch -Np1 < "$srcdir/3.patch"
	patch -Np1 < "$srcdir/4.patch"
	patch -Np1 < "$srcdir/5.patch"

	# Use system qt because bundling it is cringe n lame
	cat /dev/null > internal/frontend/bridge-gui/bridge-gui/DeployLinux.cmake

	GOPATH="${srcdir}" go mod download -modcacherw

	# Fix build with Qt 6.10
	sed -e 's|FILENAME_VARIABLE|OUTPUT_SCRIPT|' -i internal/frontend/bridge-gui/bridge-gui/CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgbase"
	
	pushd utils
	./credits.sh bridge
	popd

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export GOPATH="$srcdir"

	local tag="$(git describe --tag --abbrev=0)"
	local commit="$(git rev-parse HEAD)"

	local ld_flags=" \
	-X 'github.com/ProtonMail/proton-bridge/v3/internal/constants.BuildEnv=Arch Linux' \
	-X 'github.com/ProtonMail/proton-bridge/v3/internal/constants.FullAppName=Proton Mail Bridge' \
	-X github.com/ProtonMail/proton-bridge/v3/internal/constants.BuildTime=NOTSET \
	-X github.com/ProtonMail/proton-bridge/v3/internal/constants.Revision=$commit \
	-X github.com/ProtonMail/proton-bridge/v3/internal/constants.Tag=$tag \
	-X github.com/ProtonMail/proton-bridge/v3/internal/constants.Version=$pkgver \
	"
	go build -v \
	-ldflags "$ld_flags" \
	-o bridge \
	"$srcdir/$pkgbase/cmd/Desktop-Bridge"

	cd "$srcdir"
	cmake -B build -S "$srcdir/$pkgbase/internal/frontend/bridge-gui/bridge-gui" \
	-GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_SKIP_RPATH=YES \
	-DBRIDGE_APP_FULL_NAME='Proton Mail Bridge' \
	-DBRIDGE_VENDOR='Proton AG' \
	-DBRIDGE_REVISION="$commit" \
	-DBRIDGE_TAG="$tag" \
	-DBRIDGE_DSN_SENTRY= \
	-DBRIDGE_BUILD_ENV='Arch Linux' \
	-DBRIDGE_APP_VERSION=$pkgver

	cmake --build build
}

package_protonmail-bridge-free() {
	pkgdesc="$pkgdesc (Qt desktop application)"
	depends=(protonmail-bridge-free-core abseil-cpp gcc-libs glibc grpc hicolor-icon-theme protobuf qt6-base qt6-declarative qt6-svg sentry-native)
	provides=("${pkgbase::-5}")
	conflicts=("${pkgbase::-5}")

	cd "$srcdir/$pkgbase"
	install -Dm644 dist/proton-bridge.desktop "$pkgdir/usr/share/applications/proton-bridge.desktop"
	install -Dm644 dist/bridge.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/protonmail-bridge.svg"

	install -Dm755 "$srcdir/build/bridge-gui" "$pkgdir/usr/lib/protonmail/bridge/bridge-gui"
	install -dm755 "$pkgdir/usr/bin"
	ln -s /usr/lib/protonmail/bridge/bridge-gui "$pkgdir/usr/bin/protonmail-bridge"
}

package_protonmail-bridge-free-core() {
	pkgdesc="$pkgdesc (core executable and daemon)"
	depends=(glib2 glibc libsecret)
	optdepends=(
	'gnome-keyring: gnome-keyring support'
	'org.freedesktop.secrets: Applications that support Freedesktop secrets api'
	'pass: pass support'
	)
	provides=("${pkgbase::-5}-core")
	conflicts=("${pkgbase::-5}-core")

	cd "$srcdir/$pkgbase"
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
	install -Dm644 -t "$pkgdir/usr/lib/systemd/user" "$srcdir/protonmail-bridge.service"

	install -Dm755 bridge "$pkgdir/usr/lib/protonmail/bridge/bridge"
	install -dm755 "$pkgdir/usr/bin"
	ln -s /usr/lib/protonmail/bridge/bridge "$pkgdir/usr/bin/protonmail-bridge-core"
}
