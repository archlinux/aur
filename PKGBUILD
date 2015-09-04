# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

_pkgname=coreutils
pkgname=coreutils-progress-git
pkgver=8.24.21.ga4b6405
pkgrel=1
pkgdesc='The basic file, shell and text manipulation utilities of the GNU operating system. Patched for an added progress bar for cp'
arch=('i686' 'x86_64')
license=('GPL3')
url='http://www.gnu.org/software/coreutils'
groups=('base')
depends=('glibc' 'acl' 'attr' 'gmp' 'libcap' 'openssl')
provides=('coreutils')
conflicts=('coreutils')
install=$pkgname.install
source=("git+git://git.sv.gnu.org/coreutils.git"
        '0001-copy-Add-a-progress-option.patch'
        '0002-copy-fix-missing-progress-check.patch'
        '0003-copy-fix-two-potential-divs-by-zero.patch')
sha256sums=('SKIP'
            'cc6d3c95e94c12fe718c20e2605dabcb2600c70480263fde1c732ea0d14bdd6d'
            '5494516bcd67c585290acb997300619f235aa30ab12f34ae2e5b57b2a9dfd95c'
            '4d21076ae255094641006fb9ce56d73c379d4d09b83e8a5891e531dc23214ae5')

pkgver() {
    cd $_pkgname
    echo $(git describe | tail -c +2 | sed 's/-/./g')
}

prepare() {
    local _p
    for _p in *.patch; do
        [[ -e $_p ]] || continue
        msg2 "Applying $_p"
        patch -p1 -d $_pkgname < "$_p"
    done
}

build() {
    cd $_pkgname
    ./bootstrap
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --with-openssl \
        --enable-no-install-program=groups,hostname,kill,uptime
    make
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir" install
}
