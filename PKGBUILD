# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>

pkgname="motioneye-git"
pkgver=0.42.r38.g25ee819
pkgrel=1
pkgdesc="A web frontend for the motion daemon, Python 3 development branch"
url="https://github.com/ccrisan/motioneye.git"
license=("GPL3")
arch=("any")
provides=("motioneye")
conflicts=("motioneye")
depends=("motion"
         "python-jinja"
         "python-pillow"
         "python-pycurl"
         "python-tornado5" # required for @asynchronous handler, deprecated in python-tornaod 5.1 and removed in 6.0
         "python-six")
makedepends=("python-setuptools")
backup=("etc/motioneye/motioneye.conf")
source=("git+$url#branch=python3"
        "motioneye.tmpfiles"
        "motioneye.service")
sha256sums=("SKIP"
            "e7447bf9ab023326e7c396ecad8933eaa3399b16d844a34f288cf55b8c917bfa"
            "68880de868b98c5017e2ab6b87122c241873daf393c084710d81b19c9d0663da")
backup=("etc/motioneye/motioneye.conf")
install="motioneye.install"

pkgver(){
 cd "motioneye"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

prepare(){
 cd "motioneye"
 sed -i "extra/motioneye.conf.sample" \
     -e 's|^run_path /var/run$|run_path /var/lib/motioneye|'
}

build(){
 cd "motioneye"
 python setup.py build
}

package(){
 cd "motioneye"
 python setup.py install --root="$pkgdir" --optimize=1
 # configuration folder must be writable by motioneye
 install -D -m 660 "extra/motioneye.conf.sample" "$pkgdir/etc/motioneye/motioneye.conf"
 install -D -m 644 "$srcdir/motioneye.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/motioneye.conf"
 install -D -m 644 "$srcdir/motioneye.service" "$pkgdir/usr/lib/systemd/system/motioneye.service"
}

