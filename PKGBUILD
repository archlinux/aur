# Maintainer: Bart Van Loon <bbb at bbbart dot be>

pkgbase='offlinemsmtp'
pkgname=('offlinemsmtp')
_module='offlinemsmtp'
pkgver='0.4.0'
pkgrel=2
pkgdesc='Use msmtp offline by queuing email until you have an internet connection.'
url='https://github.com/sumnerevans/offlinemsmtp'
depends=(
    'python'
    'python-inotify'
    'python-gobject'
)
makedepends=('python-poetry' 'python-installer')
license=('GPL3')
arch=('any')
source=(
    'https://github.com/sumnerevans/offlinemsmtp/archive/refs/tags/v0.4.0.tar.gz'
    'https://raw.githubusercontent.com/sumnerevans/offlinemsmtp/master/systemd/offlinemsmtp.service'
)
noextract=(
    'offlinemsmtp.service'
)
sha256sums=('7289cb88cec96de3156bb86bcda7dcb406ea8d6fff24333e2b4139fdd0ec43e4'
            '4c104ec682190c5459a89d6fc09bdd4a33f80302bd1888d01b7264dfcbdff9a9')
replaces=('python-offlinemsmtp')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    sed -i '/keywords.*/ainclude = [ { path = "offlinemsmtp/*" } ]' pyproject.toml    
    poetry build --format=wheel
}

package() {
    install -Dm644 offlinemsmtp.service "${pkgdir}/usr/lib/systemd/user/offlinemsmtp.service"
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
