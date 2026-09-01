# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor: Pierre-Marie de Rodat  <pmderodat@kawie.fr>

pkgname='python-e3-core'
_pkgname=${pkgname#python-}
pkgver=22.10.0
pkgrel=3
pkgdesc="Framework to ease the development of portable automated build systems"

arch=('x86_64' 'aarch64')
url="https://github.com/AdaCore/e3-core"
license=('GPL-3.0-only')

depends=('glibc'
         'python'
         'python-colorama'
         'python-distro'
         'python-dateutil'
         'python-netifaces'
         'python-psutil'
         'python-requests'
         'python-requests-toolbelt'
         'python-stevedore>1.20.0'
         'python-tqdm'
         'python-yaml')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
conflicts=('python2-e3-core')

# PyPI publishes no sdist for e3-core, so build from the upstream tag instead of
# the wheel.
source=(
  "${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
)
sha256sums=('496b630569579c0b544e5455681076baeb6195d9ed03b4a7c7add9618d9e7127')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}" || exit
    # Upstream keeps only "<major>.<minor>" in VERSION and fills the patch
    # number in at release time (build_wheel.py counts the commits since the
    # minor bump), so stamp the released version in to match the sdist-less
    # wheel PyPI publishes.
    echo "${pkgver}" >VERSION

    # Upstream vendors prebuilt rlimit helpers for eleven platforms. Shipping
    # them fills the package with machine code for architectures it will never
    # run on, and the copies that would run here were built without any of the
    # distribution's hardening flags. get_rlimit() only ever reaches for the
    # build platform's copy, so drop the lot and compile the one this package
    # needs from the source upstream ships alongside them.
    rm -f src/e3/os/data/rlimit-*
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}" || exit

    # tools/rlimit/README.txt documents this exact invocation; the name has to
    # match what get_rlimit() derives from e3.env.Env().build.platform.
    case "${CARCH}" in
        x86_64) _platform='x86_64-linux' ;;
        aarch64) _platform='aarch64-linux' ;;
        *) echo "no rlimit platform name for ${CARCH}" >&2; exit 1 ;;
    esac
    # shellcheck disable=SC2086
    gcc ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} \
        -o "src/e3/os/data/rlimit-${_platform}" tools/rlimit/rlimit.c

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}" || exit
    install -Dm0644 COPYING3 "${pkgdir}/usr/share/licenses/${pkgname}/COPYING3"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
