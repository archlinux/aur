# Maintainer: Strykar <strykar@hotmail.com>

pkgname=infnoise-provider-git
pkgver=r102.16b2a95
pkgrel=1
pkgdesc="OpenSSL 3.x provider for the Infinite Noise TRNG (git master)"
arch=('x86_64')
url="https://github.com/Strykar/infnoise-provider"
license=('GPL-2.0-or-later')
# libinfnoise must carry per-context Keccak state and signed-int32_t
# readData().  Both landed in upstream master via
# waywardgeek/infnoise#121 and #122 on 2026-05-15.  The current AUR
# `infnoise` 0.3.3 release predates these and fails the provider's
# #ifndef INFNOISE_KECCAK_STATE_SIZE / #error guard.  Use `infnoise-git`
# (which tracks upstream master) or build libinfnoise from
# waywardgeek/infnoise master until a tagged release ships.
depends=('openssl' 'libftdi' 'libinfnoise')
makedepends=('git' 'pandoc' 'pkgconf')
optdepends=('python: run examples/python_demo.py'
            'python-cryptography: run examples/python_demo.py')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/ssl/infnoise-provider.cnf')
source=("git+https://github.com/Strykar/infnoise-provider.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

# The example shipped under /usr/share/doc executes against the user's
# OpenSSL config; any drift in its pre-flight assertions matters.  Pin
# the file's sha256 here so a change in upstream forces the packager
# to re-read the new version before building.  Update _demo_sha256 in
# this file (after reviewing the diff) to release a new -git tag.
_demo_sha256=ce3521d82741a92ebc9aeda3eba6c2bd5590b2a1279c4d647d17b36837baba89

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    local actual
    actual=$(sha256sum examples/python_demo.py | awk '{print $1}')
    if [[ $actual != "$_demo_sha256" ]]; then
        printf >&2 'examples/python_demo.py sha256 mismatch:\n'
        printf >&2 '  expected: %s\n' "$_demo_sha256"
        printf >&2 '  actual:   %s\n' "$actual"
        printf >&2 'Review the file at HEAD and update _demo_sha256 in the PKGBUILD.\n'
        return 1
    fi
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    make
    make man
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="${pkgdir}" install install-man

    install -Dm 644 conf/infnoise-provider.cnf \
        "${pkgdir}/etc/ssl/infnoise-provider.cnf"
    install -Dm 644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/share/doc/${pkgname}/examples"
    install -m 644 examples/python_demo.py \
        "${pkgdir}/usr/share/doc/${pkgname}/examples/"
    install -m 644 examples/systemd-drop-in.conf \
        "${pkgdir}/usr/share/doc/${pkgname}/examples/"
}
