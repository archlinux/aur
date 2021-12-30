# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=nfauthenticationkey
_commit=2d6303539eda0befccee294942e9489c33770f20
pkgver=1.1.4
pkgrel=2
arch=('any')
pkgdesc="create a Netflix authentican Key, which can be used for the Neflix Kodi addon or somewhere else."
url="https://github.com/CastagnaIT/NFAuthenticationKey/tree/linux"
license=('GPL3')
makedepends=('sed')
optdepends=('chromium' 'google-chrome' 'brave')
depends=('python' 'python-pycryptodomex' 'python-websocket-client')
source=("NFAuthenticationKey-Linux-$pkgver.tar.gz::https://github.com/CastagnaIT/NFAuthenticationKey/archive/$_commit.tar.gz")
sha512sums=('fcc0d38dcfc7ec306e23a1ddc44544d844e0e0d6ee2672e6ae58f72b2e40899552f3609ac20a8dd0d565a988d7b319bdd38e79469c14b6740eb982d398be60ae')

_check_browser()
{
	pacman -qQi $1 &> /dev/null
	test $? -eq 0 || return 1
	echo "found $1"
	echo "use $1 as browser dependency"
	depends+=("$1")
}

_set_browser_dependency()
{
	echo "set browser dependency based on installed browsers"
	_check_browser chromium      && return
	_check_browser brave         && return
	_check_browser google-chrome && return
	echo "no supported browser found"
	echo "use chromium as browser dependency"
	depends+=('chromium')
}

_set_browser_dependency 1>&2

prepare()
{
	sed -i '1i #!/usr/bin/python' "$srcdir/NFAuthenticationKey-$_commit/NFAuthenticationKey.py"
}

package()
{
	install -Dm 755 "${srcdir}/NFAuthenticationKey-$_commit/NFAuthenticationKey.py" "${pkgdir}/usr/bin/nfauthenticationkey"
}
