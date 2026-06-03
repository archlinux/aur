# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

_pkgname=fvm
pkgname=${_pkgname}-sourcebuild
pkgver=4.1.0
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
	"$_pkgname-$pkgver.tar.gz::https://github.com/leoafarias/fvm/archive/refs/tags/v$pkgver.tar.gz"
	"${pkgname}-wrapper")
sha256sums=('44f24d6bef61f78fef509415bc8974fcd60c5ffe937f9a4d9b17fe26c55670a2'
            '84323c125aa268adaeaeb16d343b0a8fd3d662d067619b31f4921f26631d6cd3')

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
