# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=nfauthenticationkey
_commit=178afcf58b1bc8713d1e0bfb81387e3f6f240095
pkgver=1.1.6
pkgrel=2
arch=('any')
pkgdesc="create a Netflix authentican Key, which can be used for the Neflix Kodi addon or somewhere else."
url="https://github.com/CastagnaIT/NFAuthenticationKey/tree/linux"
license=('GPL3')
makedepends=('sed')
optdepends=('chromium' 'google-chrome' 'brave')
depends=('python' 'python-pycryptodomex' 'python-websocket-client')
source=("NFAuthenticationKey-Linux-$pkgver.tar.gz::https://github.com/CastagnaIT/NFAuthenticationKey/archive/$_commit.tar.gz")
sha512sums=('3a50428e9d8e5f059d48671053c809d3d1434d76c0940997dd6f997380cdc626d0233affdfeaeac5f2d14f77ac5d6a442e91e4471e5a11f5e38dcc0b851f7ac7')

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
