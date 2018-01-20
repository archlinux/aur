# Maintainer: Paul Taylor <bao7uo at gmail dot com>

pkgname=impacket-git
_gitname=impacket
pkgver=0.9.16.dev
pkgrel=1
pkgdesc="Latest Impacket including new features, particularly in the examples scripts"
arch=('any')
url="https://github.com/CoreSecurity/impacket"
license=('Modified Apache, see LICENSE file')
depends=('python2-crypto' 'python2-pcapy' 'python2-pyasn1' 'python2-pyopenssl' 'python-ldap3')
makedepends=('python2-setuptools')

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
for integ in $(get_integlist)
do
  typeset -n array="${integ}sums"
  array+=('SKIP')
done
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")

pkgver() {
  cd "$_gitname"
  grep -Po "(?<=version=').*(?=',)" setup.py | tr '\n' '.'
printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

