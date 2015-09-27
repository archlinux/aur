# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=gitlab-ci-multi-runner
pkgver=0.5.5
pkgrel=2
pkgdesc="The official GitLab CI runner written in Go"
arch=('any')
url='https://gitlab.com/gitlab-org/gitlab-ci-multi-runner'
license=('GPLv3')
depends=('glibc' 'ca-certificates' 'git')
makedepends=('git' 'go<2:1.5' 'godep' 'make' 'mercurial')
install='gitlab-runner.install'
backup=('etc/gitlab-runner/config.toml')
source=("${pkgname}-${pkgver}.tar.gz"::"https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/repository/archive.tar.gz?ref=v${pkgver}"
        "gitlab-runner.install"
        "gitlab-runner.service"
        "gitlab-runner.sysusers"
        "gitlab-runner.tmpfiles"
        "config.toml"
        "makefile.patch")
sha512sums=('073653882b4d484538c906392b7d18a07d7403c985e7db553d7fa612a515d5084347c5ba26b6e9d27ac2dceee12d003bd91408372af7568de52377a2766c34cf'
            'd952618713a4ead9e8ac4d28bc5e3b1f9f0e7a36691d3abee40f73aa31d1b7dcff171c5ce62127b51ddf2c52ad490e7fa4bf0d928a3be793b813706588813535'
            'e0db2ecd45ba9472a9e9109b0254c12d1d27571fa28a01329dbd7f9aa32df33c1d8f1583a27a8105b1ee6e26e5ae5a6696248544f1f7a9d399271973d6a21fed'
            '648647fbffbf8dac5558d06d257e460f47ede45dc7e60b183091d03af96546b31fd6e8120b6b2e02af2e49f7aa094e472ef2db266a8b3baa8490a96afd915944'
            '0108ca0d8367295fb3394ecc8ca1f9a7cc52030673fcb08f0b5a09ff69e3db90760501db1423db2342676dc9c3c5af27ec22e8cf6e1a581d3b002aadbf1d3575'
            'f39c23fc06636f31c3fadb9a630c54527e8255098f18d275772cb30875d0a7463717101704070d432f2b69ab71f076a9538172a439bc307722dad2c7e260f752'
            '6d6eaa1f4b8433157745c02c4a66835d419e5d000426124dfa4cae409666d06917c3d0ec4f0a4d95dcfa79e5b370609466dd10955d8e5ea82e390fd17a37adac')

prepare() {
    _srcdir=$(ls "${srcdir}" | grep -E "${pkgname}-v${pkgver}-[0-9a-f]{40}")
    mv "${srcdir}/${_srcdir}" "${srcdir}/${pkgname}"

    cd "${srcdir}/${pkgname}"

    # Patch escaped newlines in common/version.go
    patch -p0 -i "${srcdir}/makefile.patch"

    GOPATH="${srcdir}" godep restore

    make version REVISION=unknown RELEASE=true

    mkdir -p "${srcdir}/src/gitlab.com/gitlab-org/${pkgname}"
    cp -r */ "${srcdir}/src/gitlab.com/gitlab-org/${pkgname}"
}

build() {
    cd "${srcdir}/${pkgname}"
    GOPATH="${srcdir}" go build
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 "${srcdir}/config.toml" "${pkgdir}/etc/gitlab-runner/config.toml"
    install -Dm644 "${srcdir}/gitlab-runner.service" "${pkgdir}/etc/systemd/system/gitlab-runner.service"
    install -Dm644 "${srcdir}/gitlab-runner.sysusers" "${pkgdir}/usr/lib/sysusers.d/gitlab-runner.conf"
    install -Dm644 "${srcdir}/gitlab-runner.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/gitlab-runner.conf"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
