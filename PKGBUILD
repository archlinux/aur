# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

_pkgname=fvm
pkgname=${_pkgname}-sourcebuild
pkgver=4.0.4
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
sha256sums=('2d6c2bced4e270ea724fb9ddb2e61422c67f9e981e4271e395c6bfed3aff5206'
            '0fc63820607260487b854bfe3cd76d7164fa22ccbf64eea3bd4470200bff3db1')

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
		'python-pysocks'
		'python-six'
		'python311'
	)

	cd "$_pkgname-$pkgver"
	install -Dm755 "bin/$_pkgname" "$pkgdir/usr/bin/fvm.real"
	install -Dm755 "${srcdir}/${pkgname}-wrapper" "$pkgdir/usr/bin/fvm"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}
