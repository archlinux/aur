# Maintainer: mrdotx <klassiker@gmx.de>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
_pkgname='iwd'
pkgname=iwd-git
pkgver=r6868.e82dac4
pkgrel=1
pkgdesc='Internet Wireless Daemon'
arch=('i686' 'x86_64')
url='https://git.kernel.org/cgit/network/wireless/iwd.git/'
license=('LGPL')
depends=(
    'glibc'
    'readline'
    'libreadline.so'
)
makedepends=(
    'git'
    'python-docutils'
    'dbus'
    'systemd'
)
backup=('etc/iwd/main.conf')
provides=('iwd')
conflicts=('iwd')
source=(
    'git+https://git.kernel.org/pub/scm/network/wireless/iwd.git'
    'git+https://git.kernel.org/pub/scm/libs/ell/ell.git'
)
sha256sums=('SKIP'
            'SKIP')
changelog=ChangeLog
install=iwd.install

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    ./bootstrap
}

build() {
    cd "$_pkgname"
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-runstatedir=/run \
        --libexecdir=/usr/lib/iwd \
        --enable-wired \
        --enable-ofono \
        --enable-sim-hardcoded \
        --enable-hwsim \
        --disable-tools
    make
}

package() {
    cd "$_pkgname"
    make install DESTDIR="$pkgdir"
    install -Dm 644 README -t "$pkgdir/usr/share/doc/$pkgname"
}
