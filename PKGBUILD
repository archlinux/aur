# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=grimd-git
pkgver=r163.533e0e4
pkgrel=1
pkgdesc='Fast dns proxy that can run anywhere, built to black-hole internet advertisements and malware servers'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/looterz/grimd'
license=('MIT')
makedepends=('go' 'git')
provides=('grimd')
conflicts=('grimd')
install="grimd.install"
source=("grimd::git+https://github.com/looterz/grimd.git#branch=master"
        "grimd.install"
        "grimd.service"
        "grimd.sysusers"
        "grimd.tmpfiles")
sha256sums=('SKIP'
            '3719fba967f038048cda5e474822dcc82e96926151660c2ae344d5148d670bbb'
            '368f718bcd74db58f6d38ddbf4a05a62d07801bf7a499723d50121c272961517'
            '532e8565462c20f57f6e620e813ac4558be6839985e8ae8bc602f11b0896eb44'
            '9adaaab6909fe610cf506c43a748aa976619ac42c056d57f705957a44a73b6f4')

pkgver() {
    cd "${srcdir}/grimd"
        (
        set -o pipefail
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}

build() {
    cd "${srcdir}/grimd"
    go build -o "grimd"
}

package() {
    cd "${srcdir}"

    install -D -m755 "grimd/grimd" "${pkgdir}/usr/bin/grimd"
    install -D -m644 "grimd.service" "${pkgdir}/usr/lib/systemd/system/grimd.service"
    install -Dm644 "grimd/LICENSE" "${pkgdir}/usr/share/licenses/grimd/LICENSE"
    install -D -m644 "grimd.sysusers" "${pkgdir}/usr/lib/sysusers.d/grimd.conf"
    install -D -m644 "grimd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/grimd.conf"
    mkdir -p "${pkgdir}/etc/grimd"
    mkdir -p "${pkgdir}/var/lib/grimd"
}
