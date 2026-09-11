# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgbase=protonmail-bridge-free
pkgname=(protonmail-bridge-free protonmail-bridge-free-core)
pkgver=3.27.0
pkgrel=1
pkgdesc="Integrate ProtonMail account with any program that supports IMAP and SMTP"
arch=(x86_64)
url="https://github.com/ProtonMail/proton-bridge"
license=('GPL-3.0-only')
makedepends=(abseil-cpp cmake libgcc libstdc++ git glib2 glibc go grpc libfido2 libsecret ninja protobuf qt6-base qt6-declarative qt6-svg sentry-native)
source=("$pkgbase::git+$url#tag=v$pkgver"
	"https://gitlab.archlinux.org/archlinux/packaging/packages/protonmail-bridge/-/raw/03d60b89cfb30580ad1bb8bc5c86e28348fa6ad2/protonmail-bridge.service"
	"remove-vcpkg-dependency.patch"
	"fix-wayland-icon.patch"
	# Patches from https://github.com/mnixry/proton-bridge. They make the app work for free users and only require the patches from this fork to work
	"1.patch::https://github.com/mnixry/proton-bridge/commit/c9f2dd7383ad2b1c0d9ca97c7a0701124f475156.patch"
	"2.patch::https://github.com/mnixry/proton-bridge/commit/3e18e82603030749fc1357b7d7e65444d45d9dd9.patch"
	"3.patch::https://github.com/mnixry/proton-bridge/commit/0276c2eb378647ee035a677c169b41dec9991bab.patch"
	"4.patch::https://github.com/mnixry/proton-bridge/commit/286c87f7e416e237927ffed7afec823996ce58d5.patch"
	"5.patch::https://github.com/mnixry/proton-bridge/commit/e1f61f262548c50b2ca9bd88f9c2e54160bf5bc3.patch"
)
noextract=()
sha256sums=('aebe2a33e65c5854aa54c21ae4b764a36d443eda266e745fa27ba18f7fc3fad4'
            '5d273f1245fec8549a3daa3fe76e22bb6c23957cf5bcb51c24f878e19c7a5692'
            '87c01adf8bfc3d3f4ee346d0bc83997a8b8e83104a7d5e53b91de58e3b13b3d7'
            '869bcdb550e2899de1fffec8288fffea8c5ce1949322982d6c22f744814aed9c'
            '82fd6ae3c03b9c5c23a933ebfa48272b0590a2c0385e1867b3075b4530e5b4b9'
            'f5910692eff580dc28239283b233b57f56ede18c3989b360025d260b7e656c9c'
            'b14eab75d97b0c1e73aab426a782b3d97ef9b2edacbaaa81d2831375ccbe50aa'
            '15ed4d2b6a64f87dcda1fef16857e2f5d0347a578f5d1be424307142a45a469e'
            '55ae933ca6eca4dde44cf16bf9a49e6d2cf1c21998d4bd89d302f6ba25deaac0')
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
	-compressdwarf=false \
	-X 'github.com/ProtonMail/proton-bridge/v3/internal/constants.BuildEnv=Arch Linux' \
	-X 'github.com/ProtonMail/proton-bridge/v3/internal/constants.FullAppName=Proton Mail Bridge' \
	-X github.com/ProtonMail/proton-bridge/v3/internal/constants.BuildTime=NOTSET \
	-X github.com/ProtonMail/proton-bridge/v3/internal/constants.Revision=$commit \
	-X github.com/ProtonMail/proton-bridge/v3/internal/constants.Tag=$tag \
	-X github.com/ProtonMail/proton-bridge/v3/internal/constants.Version=$pkgver \
	"
	go build -v \
	-ldflags "$ld_flags" \
	-tags libsqlite3 \
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
	depends=(protonmail-bridge-free-core abseil-cpp libgcc libstdc++ glibc grpc hicolor-icon-theme protobuf qt6-base qt6-declarative qt6-svg sentry-native)
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
	depends=(glib2 glibc libfido2 libsecret)
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
