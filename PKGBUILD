# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net>

_pkgname=fdns
pkgname=${_pkgname}-git
pkgver=0.9.69+g3e5c7cd
pkgrel=1
pkgdesc="Firejail DNS-over-HTTPS proxy server - git version"
arch=(x86_64)
url="https://github.com/netblue30/fdns"
license=(GPL2)
backup=(
    etc/fdns/adblocker
    etc/fdns/coinblocker
    etc/fdns/fp-trackers
    etc/fdns/resolver.seccomp
    etc/fdns/servers
    etc/fdns/trackers
)
depends=(
    libseccomp
    openssl
)
makedepends=(
    git
)
optdepends=('apparmor: support for apparmor profiles'
    'bash-completion: bash completion'
    'firejail: seamless integration support'
    'systemd: run fdns as a systemd service')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/netblue30/fdns.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    #git describe --tags | sed -e 's/-/+/g' -e 's/^v//'
    _version="$(grep "PACKAGE_VERSION=" configure | awk '{split($0,a,"="); print a[2]}' | sed "s/'//g")"
    _tag="$(git describe --tags | sed -e 's/-/+/g' -e 's/^v//' | awk '{split($0,a,"+"); print a[3]}')"
    echo "${_version}+${_tag}"
}

build() {
    cd "$_pkgname"
    ./configure --prefix=/usr --enable-apparmor --with-systemd=/usr/lib/systemd/system
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install

    # license
    install -Dm644 "${pkgdir}/usr/share/doc/${_pkgname}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
