# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>

pkgname=motioneye-git
pkgver=0.42.1.r310.g601bcfb
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
         "python-tornado"
         "python-six")
makedepends=("python-setuptools")
backup=("etc/motioneye/motioneye.conf")
source=("git+$url#branch=dev"
        "motioneye.tmpfiles"
        "motioneye.service")
sha256sums=('SKIP'
            'e7447bf9ab023326e7c396ecad8933eaa3399b16d844a34f288cf55b8c917bfa'
            '55a72fe49d2bacbc1cc9231ef80afab3859a48c558fe030f46ce8c7d3a95341e')
backup=("etc/motioneye/motioneye.conf")
install=motioneye.install

pkgver(){
 cd "motioneye"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

prepare(){
 cd motioneye/motioneye
 sed -i "extra/motioneye.conf.sample" \
     -e 's|^run_path /run/motioneye$|run_path /var/run/motioneye|'
}

package(){
 cd motioneye
 PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps .
 # configuration folder must be writable by motioneye
 install -D -m 660 "motioneye/extra/motioneye.conf.sample" "$pkgdir/etc/motioneye/motioneye.conf"
 install -D -m 644 "$srcdir/motioneye.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/motioneye.conf"
 install -D -m 644 "$srcdir/motioneye.service" "$pkgdir/usr/lib/systemd/system/motioneye.service"
}
