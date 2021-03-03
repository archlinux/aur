# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=nfauthenticationkey
_commit=eef806798f0b211dd87cdb1f949956801a812eb7
pkgver=1.1.3
pkgrel=2
arch=('any')
pkgdesc="create a Netflix authentican Key, which can be used for the Neflix Kodi addon or somewhere else."
url="https://github.com/CastagnaIT/NFAuthenticationKey/tree/linux"
license=('GPL3')
makedepends=('sed')
optdepends=('chromium' 'google-chrome' 'brave')
depends=('python' 'python-pycryptodomex' 'python-websocket-client')
source=("NFAuthenticationKey-Linux-$pkgver.tar.gz::https://github.com/CastagnaIT/NFAuthenticationKey/archive/$_commit.tar.gz")
sha512sums=('639203cf05bb2c71b7ad7aa21e129b01b89ac91578aa59ad2aa31a8601b07ceb82854201207b2cc501e4a0c16ee188b61f2e1b507e63b72ca55f75ccd991730d')

_check_browser()
{
	pacman -qQi $1 > /dev/null
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
