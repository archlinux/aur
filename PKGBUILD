# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=gitlab-ci-multi-runner
pkgver=0.5.1
pkgrel=1
pkgdesc="The official GitLab CI runner written in Go"
arch=('i686' 'x86_64')
url='https://gitlab.com/gitlab-org/gitlab-ci-multi-runner'
license=('GPLv3')
depends=('glibc' 'ca-certificates' 'git')
makedepends=('go' 'godep' 'make')
install='gitlab-runner.install'
source=("${pkgname}.tar.gz"::"https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/repository/archive.tar.gz?ref=v${pkgver}"
        "gitlab-runner.install"
        "gitlab-runner.service"
        "gitlab-runner.sysusers"
        "gitlab-runner.tmpfiles"
        "godeps.patch"
        "makefile.patch")
sha512sums=('bb275f3e667cfb74f7e7d4529492851465999f1d4c0dd18f4faf25c342fd9a9c2e1fcba4bd63f066911844cf6b83691131fa64e27edf710f706630903b155e40'
            'd952618713a4ead9e8ac4d28bc5e3b1f9f0e7a36691d3abee40f73aa31d1b7dcff171c5ce62127b51ddf2c52ad490e7fa4bf0d928a3be793b813706588813535'
            'e0db2ecd45ba9472a9e9109b0254c12d1d27571fa28a01329dbd7f9aa32df33c1d8f1583a27a8105b1ee6e26e5ae5a6696248544f1f7a9d399271973d6a21fed'
            '648647fbffbf8dac5558d06d257e460f47ede45dc7e60b183091d03af96546b31fd6e8120b6b2e02af2e49f7aa094e472ef2db266a8b3baa8490a96afd915944'
            '0108ca0d8367295fb3394ecc8ca1f9a7cc52030673fcb08f0b5a09ff69e3db90760501db1423db2342676dc9c3c5af27ec22e8cf6e1a581d3b002aadbf1d3575'
            '12d31bab9dc650a235cc55a355741b8b5565ae1cd61631e53515a311d369d72b35d748f0218fd6c44e11c6bdec6600a2bf8b26320341a40b2a3e50c4da45d8f2'
            '6d6eaa1f4b8433157745c02c4a66835d419e5d000426124dfa4cae409666d06917c3d0ec4f0a4d95dcfa79e5b370609466dd10955d8e5ea82e390fd17a37adac')

prepare() {
    cd "${srcdir}/${pkgname}.git"

    # Patch invalid revisions in Godeps/Godeps.json
    patch -p0 -i "${srcdir}/godeps.patch"

    # Patch escaped newlines in common/version.go
    patch -p0 -i "${srcdir}/makefile.patch"

    GOPATH="${srcdir}" godep restore

    make version REVISION=unknown RELEASE=true

    mkdir -p "${srcdir}/src/gitlab.com/gitlab-org/${pkgname}"
    cp -r */ "${srcdir}/src/gitlab.com/gitlab-org/${pkgname}"
}

build() {
    cd "${srcdir}/${pkgname}.git"
    GOPATH="${srcdir}" go build
    echo "concurrent = 4" > "config.toml"
}

package() {
    cd "${srcdir}/${pkgname}.git"
    install -Dm644 "config.toml" "${pkgdir}/etc/gitlab-runner/config.toml"
    install -Dm644 "${srcdir}/gitlab-runner.service" "${pkgdir}/etc/systemd/system/gitlab-runner.service"
    install -Dm644 "${srcdir}/gitlab-runner.sysusers" "${pkgdir}/usr/lib/sysusers.d/gitlab-runner.conf"
    install -Dm644 "${srcdir}/gitlab-runner.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/gitlab-runner.conf"
    install -Dm755 "${pkgname}.git" "${pkgdir}/usr/bin/${pkgname}"
}
