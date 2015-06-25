# Maintainer: Joël Porquet <joel@porquet.org>

pkgname=jpass-web-git
pkgver=r13.62e6c07
pkgrel=1
pkgdesc="JPass password manager - web application"
url="https://joel.porquet.org/wiki/hacking/jpass-web/"
arch=('any')
license=('GPL3')
depends=('jpass-git' 'python' 'python-bottle' 'python-flup-hg')
makedepends=('git')

backup=('etc/webapps/jpass/jpassrc')

source=("${pkgname}::git+https://joel.porquet.org/cgit/cgit.cgi/jpass-web.git/")
md5sums=('SKIP')

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}
    _instdir="$pkgdir"/usr/share/webapps/jpass
    _etcdir="$pkgdir"/etc/webapps/jpass

    # web application
    install -d "$_instdir"

    install -m 0555 *.py "$_instdir/"

    install -d "$_instdir/static/css"
    install -d "$_instdir/static/js"

    install -m 0444 static/css/*.css "$_instdir/static/css"
    install -m 0444 static/js/*.js "$_instdir/static/js"

    install -d "$_instdir/views"

    install -m 0444 views/*.tpl "$_instdir/views"

    # git hook generator
    install -d "$pkgdir/usr/bin"

    install -m 0555 bin/jpass_hook "$pkgdir/usr/bin/"

    # config file
    install -d "$_etcdir"

    install -m 0444 docs/jpassrc.example "$_etcdir/jpassrc"
    ln -s /etc/webapps/jpass/jpassrc "$_instdir/jpassrc"
}
