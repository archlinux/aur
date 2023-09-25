# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net>

_pkgname=fdns
pkgname=${_pkgname}-git
pkgver=0.9.72+g59e3afc
pkgrel=1
pkgdesc="Firejail DNS-over-HTTPS proxy server - git version"
arch=(x86_64)
url="https://github.com/netblue30/fdns"
license=(GPL2)
backup=(
    etc/fdns/list.adblocker
    etc/fdns/list.coinblocker
    etc/fdns/list.fp-trackers
    etc/fdns/hosts
    etc/fdns/list.phishing
    etc/fdns/resolver.seccomp
    etc/fdns/servers
    etc/fdns/list.tld-blacklist
    etc/fdns/list.trackers
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
source=("git+${url}.git"
    "fdns.hardened.service::${url}/raw/39711eac58e60ae2d02052223aabbf22b5379906/etc/${_pkgname}.service")
sha256sums=('SKIP'
            'e7f1f0d58b3333c5fa10740886967a6acc674c28d2bcfe77356254c1dd6ffc62')

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

    # use hardened systemd service
    rm -f "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -D -m 0644 "${srcdir}/${_pkgname}.hardened.service" \
        "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    # license
    install -D -m 0644 "${pkgdir}/usr/share/doc/${_pkgname}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
