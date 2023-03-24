# Maintainer: mrdotx <klassiker@gmx.de>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
_pkgname='iwd'
pkgname=iwd-git
pkgver=2.3.r14.ge82dac4b
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
    git describe --long | sed -r 's/^r//;s/([^-]*-g)/r\1/;s/-/./g'
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
