# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

_pkgname=fvm
pkgname=${_pkgname}-sourcebuild
pkgver=3.2.1
pkgrel=2
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
	"$_pkgname-$pkgver.tar.gz::https://github.com/leoafarias/fvm/archive/refs/tags/$pkgver.tar.gz"
	"${pkgname}-wrapper")
sha256sums=('d4d524a5e1d7c5160b17ee9c3b2dd4482224d2e1c27c8d494fa0290ae818cd41'
            '4f288030ee4eb9926d00a38a135a4d2a0ed29bc71a2a04921e09f06aaad5535f')

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
		'python-httplib2'
		'python-six'
		'python311'
	)

	cd "$_pkgname-$pkgver"
	install -Dm755 "bin/$_pkgname" "$pkgdir/usr/bin/fvm.real"
	install -Dm755 "${srcdir}/${pkgname}-wrapper" "$pkgdir/usr/bin/fvm"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
