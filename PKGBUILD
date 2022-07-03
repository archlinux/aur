# $Id$
# Maintainer: Max Mazurov <fox.cpp at disroot dot org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>
pkgname='maddy'
pkgver=0.6.2
pkgrel=1
pkgdesc='Composable all-in-one mail server'
arch=('x86_64')
url='https://github.com/foxcpp/maddy'
license=('GPL3')
depends=('glibc')
makedepends=('go' 'git' 'scdoc')
optdepends=()
source=(
    "${pkgname}-${pkgver}.tar.zst::https://maddy.email/builds/${pkgver}/maddy-${pkgver}-src.tar.zst"
    "${pkgname}-${pkgver}.tar.zst.sig::https://maddy.email/builds/${pkgver}/maddy-${pkgver}-src.tar.zst.sig"
    'maddy.sysusers'
    'maddy.tmpfiles'
    '516.patch'
    '0001-test-Fix-Dovecot-interop-tests.patch'
)
backup=('etc/maddy/maddy.conf')
sha512sums=('79c28deaad64bba8fa9d4b4b7f4ee515def9362a4042f3c13e092c41a9afdd508ac97f080fa376fb4958acf40b48c1aadea0b220166e144fb85634eae13ab09f'
            'SKIP'
            '750346110adb8caa61f537560018497f73543dc01ff26aceed2f052f281a35fdc659c9c478cc55775eadf8a3d17b511d5bed86334d1c455732dcb9a273120589'
            'f33135b81129d6ef3006d8e9f410ec0d7e44226ae640dea77d756268d0e97828d8965ac75d0d9b49604a19b8b9e0384d15007d33c4b813f359108d28a10702b5'
            '70ccca2bd74e73a19893d6311deffa9c3538352ff9da6f9286686eea74fa0648e17c169a1a79ec51111e58849cc29faaf1f89f260edd325e84a1a2b817a72cbf'
            '9d17b78fe0628099131b98ba3beb6042eec890e0d161d42c03b5c3f5b885824658fc947ae300591dbebd3b8092154746756f55ca9aac040692a84d87a7ba37de')
validpgpkeys=('3197BBD95137E682A59717B434BB2007081396F4')

prepare() {
    cd "${srcdir}/maddy-${pkgver}-src"
    patch -p1 < "${srcdir}/516.patch" # https://github.com/foxcpp/maddy/pull/516
    patch -p1 < "${srcdir}/0001-test-Fix-Dovecot-interop-tests.patch" # https://github.com/foxcpp/maddy/commit/90f88c89cdb0330ca9840ee518d17a153b6edb0c
}

build() {
    export GOPATH="$PWD/gopath"
    cd "${srcdir}/maddy-${pkgver}-src"

    ./build.sh --version "${pkgver}" --prefix /usr build

    # Module cache is read-only by default. Fix its permissions so it will be
    # easier to clean build directory.
    chmod -R +w ${GOPATH}
}

check() {
    export GOPATH="$PWD/gopath"
    cd "${srcdir}/maddy-${pkgver}-src"

    go test ./...

    cd tests/
    ./run.sh

    chmod -R +w ${GOPATH}
}

package() {
    export GOPATH="$PWD/gopath"
    cd "${srcdir}/maddy-${pkgver}-src"

    ./build.sh \
        --version "v${pkgver}" \
        --prefix /usr \
        --destdir "${pkgdir}" \
        install

    sed -i 's!/usr/local/bin!/usr/bin!g' "${pkgdir}/usr/lib/systemd/system/maddy.service" "${pkgdir}/usr/lib/systemd/system/maddy@.service"
    install -Dm 0644 "${srcdir}/maddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/maddy.conf"
    install -Dm 0644 "${srcdir}/maddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/maddy.conf"
}
