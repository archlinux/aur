# Maintainer: Denis Saintilma <1068des@gmail.com>
pkgname=plexpy-git
pkgver=1.2.13.r4.6265943
pkgrel=1
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/drzoidberg33/plexpy"
license=('GPL')
depends=('python2')
makedepends=('git')
provides=("plexpy")
conflicts=('plexpy')
install=('plexpy-git.install')
source=("$pkgname::git+https://github.com/drzoidberg33/plexpy/" 'plexpy.service' 'plexpy-git.install' 'welcome.html.patch')
md5sums=('SKIP'
         '9cfa4e18a48b03922242dddd005cdad3'
         '4997e19d54b412105baae7a062f668a5'
         'd4ab675b2351815bdc162b3615ace953')

prepare() {
	patch -p1 < "${srcdir}/welcome.html.patch"
}

pkgver() {
        cd "${srcdir}/${pkgname%-VCS}"
        git describe --long | sed -e 's/\([^-]*-\)g/r\1/;s/-/./g' -e 's/^v//'
}

package() {
        cd "${srcdir}/${pkgname%-VCS}"
        install -Dm755 PlexPy.py "${pkgdir}/opt/plexpy/PlexPy.py"
        install -Dm644 pylintrc CHANGELOG.md  "${pkgdir}/opt/plexpy/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/plexpy/LICENSE"
	
        cp -a data/ lib/ plexpy/ "${pkgdir}/opt/plexpy/"

        install -Dm644 "${srcdir}/plexpy.service" "${pkgdir}/usr/lib/systemd/system/plexpy.service"
}
