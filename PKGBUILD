# Maintainer: LIghtJUNction <lightjunction.me@gmail.com>

_pkgname=mechrevo-drivers
pkgname=mechrevo-drivers-dkms-git
pkgver=4.24.0.r6.g4bbbdc9
pkgrel=1
pkgdesc='Unofficial MECHREVO laptop platform drivers based on TUXEDO drivers (DKMS, git)'
arch=('x86_64')
url='https://github.com/LIghtJUNction/mechrevo-drivers'
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
optdepends=('linux-headers: build modules for the Arch Linux kernel'
            'linux-lts-headers: build modules for the LTS kernel'
            'linux-zen-headers: build modules for the Zen kernel'
            'linux-hardened-headers: build modules for the hardened kernel'
            'udev-hid-bpf: keyboard fixes for TUXEDO Sirius 16 Gen1/2')
provides=("mechrevo-drivers-dkms=$pkgver"
          "tuxedo-drivers-dkms=$pkgver"
          'tuxedo-keyboard'
          'tuxedo-keyboard-ite'
          'tuxedo-io'
          'clevo-wmi'
          'clevo-acpi'
          'uniwill-wmi'
          'ite_8291'
          'ite_8291_lb'
          'ite_8297'
          'ite_829x')
# These packages install the same module names and/or userspace rules.
# Do not use replaces: the non-git MECHREVO package has another maintainer.
conflicts=('mechrevo-drivers-dkms'
           'tuxedo-drivers'
           'tuxedo-drivers-git'
           'tuxedo-drivers-dkms'
           'tuxedo-drivers-dkms-git'
           'tuxedo-keyboard-dkms'
           'tuxedo-keyboard-dkms-git'
           'tuxedo-keyboard-ite-dkms'
           'tuxedo-keyboard-ite-dkms-git')
options=('!strip' '!debug' '!lto')
source=("${_pkgname}::git+${url}.git#branch=main"
        'dkms.conf')
sha256sums=('SKIP'
            '1e04086ef9bb94ec15878464b6594f7507715c081c4c114e56b7d46731fd7ea6')

pkgver() {
    cd "${srcdir}/${_pkgname}" || return 1
    local tag
    # Only final vX.Y.Z tags are version bases, never upstream RC tags.
    tag=$(git tag --merged HEAD --list 'v[0-9]*' | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -n1)
    if [[ -n $tag ]]; then
        git describe --tags --long --match "$tag" | sed 's/^v//;s/-\([0-9]\+\)-g/.r\1.g/'
    else
        printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

package() {
    local dkmsdir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
    local doc
    install -dm755 "$dkmsdir"
    cp -a "${srcdir}/${_pkgname}/src/." "$dkmsdir/"
    install -m644 "${srcdir}/dkms.conf" "$dkmsdir/dkms.conf"
    sed -i "s/@PKGVER@/${pkgver}/g" "$dkmsdir/dkms.conf"

    install -Dm644 "${srcdir}/${_pkgname}"/files/usr/lib/modprobe.d/*.conf \
        -t "${pkgdir}/usr/lib/modprobe.d/"
    install -Dm644 "${srcdir}/${_pkgname}"/files/usr/lib/udev/rules.d/*.rules \
        -t "${pkgdir}/usr/lib/udev/rules.d/"
    install -Dm644 "${srcdir}/${_pkgname}"/files/usr/lib/udev/hwdb.d/*.hwdb \
        -t "${pkgdir}/usr/lib/udev/hwdb.d/"

    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    while IFS= read -r -d '' doc; do
        install -Dm644 "$doc" \
            "${pkgdir}/usr/share/doc/${pkgname}/docs/${doc#"${srcdir}/${_pkgname}/docs/"}"
    done < <(find "${srcdir}/${_pkgname}/docs" -type f -name '*.md' -print0)
}
