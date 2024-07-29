# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=nfauthenticationkey
_commit=387e7439ab85558ffe0ce3ccb13e5b85132e1045
pkgver=1.1.8
pkgrel=1
arch=('any')
pkgdesc="create a Netflix authentican Key, which can be used for the Neflix Kodi addon or somewhere else."
url="https://github.com/CastagnaIT/NFAuthenticationKey/tree/linux"
license=('GPL3')
makedepends=('sed')
optdepends=('chromium' 'google-chrome' 'brave')
depends=('python' 'python-pycryptodomex' 'python-websocket-client')
source=("NFAuthenticationKey-Linux-$pkgver.tar.gz::https://github.com/CastagnaIT/NFAuthenticationKey/archive/$_commit.tar.gz")
sha512sums=('eab9cd9efe94f1f06d58f6d0222965d277b3c647f19cf24e959a533408e5063ad2c96b0440c6b535a9f743944331187aa7a286ebe22670dfea01db9443393379')

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
