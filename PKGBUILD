# Based on an older PKGBUILD by: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=('python2-pywikibot-git')
pkgver=2171.e644b32
pkgrel=1
pkgdesc="Python library that interfaces with the MediaWiki API"
arch=('any')
url="https://www.mediawiki.org/wiki/Manual:Pywikibot"
license=('MIT')
makedepends=('python2-setuptools' 'git')
depends=('python2-httplib2')
install=install
source=("core::git+https://git.wikimedia.org/git/pywikibot/core.git" 'user-config.py')
md5sums=('SKIP' '0f7c5edb33017b4bbea2f80f13fe4843')

pkgver() {
	 cd "${srcdir}/core"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

prepare() {
  # This is really a pain : interactive setup to create a per-user config file...
  # We just provide a sample config file in /usr/share/pywikibot/user-config.py
	 sed -i '/generate_user_files.py/Id' "${srcdir}/core/setup.py"
}

package() {
	 cd "${srcdir}/core"
	 python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

    # This is _really_ a pain... It installs itself in
    #  /usr/lib/python2.7/site-packages/tests
    #  /usr/lib/python2.7/site-packages/scripts
    # These are likely to collide with others python packages...
    # => This has to be fixed upstream
    rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests

    # Copy our example config file
    mkdir -p $pkgdir/usr/share/pywikibot
    install ${srcdir}/user-config.py $pkgdir/usr/share/pywikibot
}
