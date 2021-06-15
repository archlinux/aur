# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: RunasSudo <aur at yingtongli dot me>
# Contributor: Peter Cai <peter at typeblog dot net>
# Contributor: yhaupenthal <y dot h plus aur at posteo dot de>
# Contributor: Brice Waegeneire <brice dot wge at gmail dot com>
# Contributor: Reventlov <contact+aur@volcanis.me>

pkgname="isso-git"
pkgver=0.12.5.r9.ga7c1069
pkgrel=1
pkgdesc="Lightweight commenting server written in Python and JavaScript"
url="http://posativ.org/isso/"
license=("MIT")
arch=("any")
provides=("isso")
conflicts=("isso")
depends=("python-bleach" "python-cffi" "python-flask-caching" "python-gevent" "python-html5lib" "python-itsdangerous" "python-jinja" "python-misaka" "python-six" "python-werkzeug" "sqlite")
makedepends=("python-libsass" "python-setuptools" "python-sphinx" "git")
source=("isso.service"
        "isso.sysusers"
        "isso.tmpfiles"
        "git+https://github.com/posativ/isso")
sha256sums=("680a475e5df18877b702e6b0309bea12aa5a1fc3d2bf1d3d269e5d2cfac5989e"
            "39345b5ef89efef588cd55ef0e78151043eb09a9c151b8e91a320318abccbdf6"
            "f7ea4de770ea5c2c3cf7ccea51c2078cbcd5329ac30b72a88f7d0d2cd5ea7c8e"
            "SKIP")
backup=("etc/isso.conf")

pkgver(){
 cd "isso"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare(){
 sed -i "isso/share/isso.conf" \
     -e "s|dbpath = /tmp/comments.db|dbpath = /var/lib/isso/comments.db|" \
     -e "s|http:///localhost:1234/|http://localhost:1234/|"
}

build(){
 cd "isso"
 npm install node-sass
 python setup.py build
 # build static files
 make init all
}

package(){
 install -D -m 644 "isso.service" "$pkgdir/usr/lib/systemd/system/isso.service"
 install -D -m 644 "isso.sysusers" "$pkgdir/usr/lib/sysusers.d/isso.conf"
 install -D -m 644 "isso.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/isso.conf"
 cd "isso"
 install -D -m 640 "share/isso.conf" "$pkgdir/etc/isso.conf"
 install -D -m 644 "man/man1/isso.1" "$pkgdir/usr/share/man/man1/isso.1"
 install -D -m 644 "man/man5/isso.conf.5" "$pkgdir/usr/share/man/man5/isso.conf.5"
 python setup.py install --root="$pkgdir" --optimize=1
}
