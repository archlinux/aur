# Maintainer: Laura Demkowicz-Duffy <laura@demkowiczduffy.co.uk>
pkgname=osabie-git
_pkgname=osabie
pkgver=r872.c31668b
pkgrel=1
pkgdesc="An esoteric code golfing language"
arch=('any')
url="https://github.com/Adriandmen/05AB1E"
license=('MIT')
makedepends=(elixir git)
depends=('erlang>=1.9.0')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git#branch=master"
		"ssl_verify_fun_bump.patch")
noextract=()
sha256sums=('SKIP'
            'b8cec5248bee838a9e97997cb81e912b9c9e3811995fc9d1a178eb1dca2535f9')

prepare() {
	cd "$_pkgname"
	patch -p2 -i ../ssl_verify_fun_bump.patch
}

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	mix local.hex --force
	mix deps.get
	MIX_ENV=prod mix escript.build
}

package() {
	cd "$_pkgname"
	install -Dm0755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
