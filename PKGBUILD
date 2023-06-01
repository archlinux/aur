# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net>

_pkgname=fdns
pkgname=${_pkgname}-git
pkgver=0.9.69+gd5aa86c
pkgrel=2
pkgdesc="Firejail DNS-over-HTTPS proxy server - git version"
arch=(x86_64)
url="https://github.com/netblue30/fdns"
license=(GPL2)
backup=(
    etc/fdns/adblocker
    etc/fdns/coinblocker
    etc/fdns/fp-trackers
    etc/fdns/phishing
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
source=("git+https://github.com/netblue30/fdns.git"
    "openssl3.patch::https://github.com/netblue30/fdns/pull/80.diff")
sha256sums=('SKIP'
            'cc20a0553e6a21fd78a221e2669f40b1fef1310d1643c025787bf88a377e504a')

pkgver() {
    cd "$_pkgname"
    #git describe --tags | sed -e 's/-/+/g' -e 's/^v//'
    _version="$(grep "PACKAGE_VERSION=" configure | awk '{split($0,a,"="); print a[2]}' | sed "s/'//g")"
    _tag="$(git describe --tags | sed -e 's/-/+/g' -e 's/^v//' | awk '{split($0,a,"+"); print a[3]}')"
    echo "${_version}+${_tag}"
}

prepare() {
    cd "$_pkgname"
    # revert https://github.com/netblue30/fdns/commit/b7b98a1e33d07795a2482ecd23f56157adac71c6
    # this commit drops all the hardenings from fdns.service and only affects Debian 11
    git revert --no-commit b7b98a1e33d07795a2482ecd23f56157adac71c6
    # fix for https://github.com/netblue30/fdns/issues/79
    patch -Np1 -i ../openssl3.patch
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
