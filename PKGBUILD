# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

_pkgname=fvm
pkgname=${_pkgname}-sourcebuild
pkgver=4.1.5
pkgrel=1
provides=(${_pkgname})
conflicts=(${_pkgname})
pkgdesc="Flutter Version Management: A simple CLI to manage Flutter SDK versions. (Build engine from sources)"
arch=('x86_64')
url="https://fvm.app"
license=('MIT')
depends=()
makedepends=('dart')
options=('!strip')
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/leoafarias/fvm/archive/refs/tags/v$pkgver.tar.gz"
	"${pkgname}-wrapper")
sha256sums=('22b259d6e979e26fdcc0b44a823089784abdece1d3e834ffaf7314a0f40a8a06'
            '057207ed41cfaddc0519d0f3a16c410a858750f8b0b65d70b079544a75aead7b')

prepare() {
	cd "$_pkgname-$pkgver"

	# disable analytics
	dart --disable-analytics

	# download dependencies
	dart pub get
}

build() {
	cd "$_pkgname-$pkgver"
	dart compile exe -o bin/fvm bin/main.dart
}

package() {
	depends+=(
		'cmake'
		'ninja'
		'git'
		'clang'
		'python'
		'unzip'
		'gtk3'
		'lld'
		'yq'
		'gn'
		'llvm'
		'pciutils'
		'python311'
	)

	cd "$_pkgname-$pkgver"
	install -Dm755 "bin/$_pkgname" "$pkgdir/usr/bin/fvm.real"
	install -Dm755 "${srcdir}/${pkgname}-wrapper" "$pkgdir/usr/bin/fvm"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
