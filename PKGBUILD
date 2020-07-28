# Contributor: Alex Xu <alex_y_xu@yahoo.ca>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=sshguard-git
pkgver=v2.0.0.r15.g318bf4e
pkgrel=1
pkgdesc="Brute force detector for SSH, Exim, VSFTPD and more."
arch=('i686' 'x86_64')
url="http://www.sshguard.net/"
license=('GPL')
conflicts=('sshguard')
provides=('sshguard')
backup=('etc/sshguard.conf')
install=sshguard.install
source=("git+https://bitbucket.org/sshguard/sshguard.git")
md5sums=('SKIP')

prepare() {
    cd sshguard
    sed -i '/iptables/d;/sample/d' examples/sshguard.service
    autoreconf -i
}

pkgver() {
    cd sshguard
    # cutting off 'foo-' prefix that presents in the git tag
    git describe --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd sshguard
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/sshguard
    make
}

package() {
    cd sshguard
    make DESTDIR="$pkgdir" install
    install -Dm0644 "examples/sshguard.service" "$pkgdir/usr/lib/systemd/system/sshguard.service"
    install -Dm0644 "examples/sshguard.conf.sample" "$pkgdir/etc/sshguard.conf"
    install -dm0755 "$pkgdir/usr/share/doc/"
    cp -a examples "$pkgdir/usr/share/doc/sshguard"
}
