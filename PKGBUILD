# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: RunasSudo <aur at yingtongli dot me>
# Contributor: Peter Cai <peter at typeblog dot net>
# Contributor: yhaupenthal <y dot h plus aur at posteo dot de>
# Contributor: Brice Waegeneire <brice dot wge at gmail dot com>
# Contributor: Reventlov <contact+aur@volcanis.me>
# Contributor: mrfaber <lenelsner@uos.de>

pkgname="isso-git"
pkgver=0.13.0.r15.gc558eef
pkgrel=1
pkgdesc="Lightweight commenting server written in Python and JavaScript that aims to be a drop-in replacement for Disqus"
url="http://posativ.org/isso/"
license=("MIT")
arch=("any")
provides=("isso")
conflicts=("isso")
depends=("python-bleach"
         "python-cffi"
         "python-html5lib"
         "python-itsdangerous"
         "python-jinja"
         "python-misaka"
         "python-sphinx"
         "python-werkzeug"
         "sqlite")
makedepends=("python-setuptools" "git")
source=("isso.service"
        "isso.sysusers"
        "isso.tmpfiles"
        "git+https://github.com/posativ/isso")
sha256sums=('e35eb5fb8120401e242a1458702c7d150c0a8e4a7f1d233ab094885deb5e7f59'
            '39345b5ef89efef588cd55ef0e78151043eb09a9c151b8e91a320318abccbdf6'
            'ee074ad981ef46f6f7ac7029477afc18cd2fc62dfea2b03795933b1c1a3c9606'
            'SKIP')
backup=("etc/isso.cfg" "etc/isso.conf")

pkgver(){
 cd "isso"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "isso"
 # build python package
 python setup.py build
 # build static files
 make init all
}

package(){
 cd "isso"
 # install python package
 python setup.py install --root="$pkgdir" --optimize=1
 # copy systemd files
 install -D -m 644 "$srcdir/isso.service" "$pkgdir/usr/lib/systemd/system/isso.service"
 install -D -m 644 "$srcdir/isso.sysusers" "$pkgdir/usr/lib/sysusers.d/isso.conf"
 install -D -m 644 "$srcdir/isso.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/isso.conf"
 # copy default configuration
 install -D -m 640 "contrib/isso-dev.cfg" "$pkgdir/etc/isso.cfg"
}
