# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=kosmozoo-git
_release_ver=0.1.0.r0
pkgver=0.1.0.r3.g6d66ac0
pkgrel=1
pkgdesc="Local ComfyUI image review/curation tool — zero-build SPA + Python stdlib server (git main)"
arch=('any')
url="https://github.com/alexindigo/kosmozoo"
license=('LGPL-3.0-only')
depends=('python')
makedepends=('git')
optdepends=('python-pytorch: local anime face detection (run setup_facedetect.sh with KOZMOZOO_VENV)')
provides=("kosmozoo")
conflicts=("kosmozoo")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # NOTE: capture describe output explicitly — `git describe ... | sed ...`
    # masks describe's exit code (sed exits 0 on empty input), so a pipeline
    # `|| echo fallback` never fires on tagless repos.
    local out
    out=$(git describe --long --tags 2>/dev/null) || out=""
    if [ -n "$out" ]; then
        printf "%s" "$out" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
    else
        echo "${_release_ver}.g$(git rev-parse --short HEAD)"
    fi
}

package() {
    cd "${srcdir}/${pkgname}"

    # app files (served from here; state lives in $XDG_STATE_HOME/kosmozoo
    # because this dir is read-only)
    install -Dm644 server.py index.html detect_worker.py \
        logo-64.png logo-256.png logo-512.png \
        -t "${pkgdir}/usr/lib/kosmozoo/"
    install -Dm755 fetch_vendor.sh setup_facedetect.sh \
        -t "${pkgdir}/usr/lib/kosmozoo/"
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/kosmozoo/README.md"

    # launcher + systemd --user unit
    install -Dm755 "${srcdir}/../kosmozoo" "${pkgdir}/usr/bin/kosmozoo"
    install -Dm644 "${srcdir}/../kosmozoo.service" \
        "${pkgdir}/usr/lib/systemd/user/kosmozoo.service"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
