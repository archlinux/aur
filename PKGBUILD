# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('telldus-core-git')
_srcname='telldus'
pkgver='r1'
pkgrel='1'
pkgdesc='Driver and tools for controlling a Telldus Technologies TellStick'
arch=('i686' 'x86_64')
url="https://github.com/telldus/${_srcname}"
license=('LGPL2')

depends=('libftdi-compat' 'confuse')
makedepends=('gcc' 'cmake' 'make' 'git' 'doxygen')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=(
    "${_srcname}::git+${url}.git"
    'telldusd.service'
    'pthread.patch'
    'uucp.patch'
    'bin.patch'
)
sha512sums=(
    'SKIP'
    '04a39fea3c37f797973b0790d6db3038fe40bcc700b87b6e9f774de4a1cd788b11daed5c336555fd8cd69dbebcaf63585699b33d95495920fde7975ce506c163'
    'eb54e6cd62fbb3088827d92bb138b8fc88c2d76b6ec660bc6c88c5fda2b0d2493a2bb3509d24e5a6a871d42d335dff49c07721be955cbdbcda28e51df04bbb74'
    '0888e11a2a1080d0b5bad515534dc127f201ad25db427e45d4bbb981254608bbbdbc490c76b7aeaf65eea7e2699cbb62cab8ebf6f4e4048a9dc668a68d7b6ab5'
    '27178656d147481eb76c820bf49da0339714f7d27c413777e2ecfc0296de5ccfe9425d7e4bc5ea2dfbe530d6fe47a22e111618808cf296b3bfa21569af7512ec'
)

backup=('etc/tellstick.conf')

pkgver() {
    cd "${srcdir}/${_srcname}"

    printf 'r%s.%s.%s\n' \
        "$( git rev-list --count 'HEAD' )" \
        "$( git log --max-count='1' --pretty='format:%ct' )" \
        "$( git rev-parse --short 'HEAD' )"
}

prepare() {
    cd "${srcdir}/${_srcname}"

    git apply "${srcdir}/pthread.patch"
    git apply "${srcdir}/uucp.patch"
    git apply "${srcdir}/bin.patch"
}

build() {
    cd "${srcdir}/${_srcname}/telldus-core"

    export CXXFLAGS="${CXXFLAGS} -Wno-narrowing"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFORCE_COMPILE_FROM_TRUNK=TRUE \
        -DSTATE_INSTALL_DIR='/var/lib/telldus' \
        .
    make -j1
}

package() {
    cd "${srcdir}/${_srcname}/telldus-core"

    make DESTDIR="${pkgdir}" install

    install -D --mode=644 \
        "${srcdir}/telldusd.service" \
        "${pkgdir}/usr/lib/systemd/system/telldusd.service"
}
