# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Custom Executor Maintainer: Marc Mettke <marc@itmettke.de>

pkgname=gitlab-runner-custom-executors
pkgver=1.10.4
pkgrel=1
pkgdesc="The official GitLab CI runner written in Go with a LXC Executor"
arch=('i686' 'x86_64')
url='https://gitlab.com/gitlab-org/gitlab-ci-multi-runner'
license=('GPL3')
depends=('ca-certificates' 'curl' 'git' 'glibc' 'tar')
makedepends=('git' 'go' 'git' 'go-bindata' 'mercurial')
install='gitlab-runner.install'
backup=('etc/gitlab-runner/config.toml')
noextract=('prebuilt-x86_64.tar.xz'
           'prebuilt-arm.tar.xz')
provides=("${pkgname/-custom-executors}=${pkgver}-${pkgrel}")
conflicts=("${pkgname/-custom-executors}")

# Note: This should be built using git because the runner gets its version information from there and I
# haven't found the place to patch that yet.
source=("git+https://gitlab.com/gitlab-org/gitlab-ci-multi-runner.git#tag=v${pkgver}"
        "https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/master/docker/prebuilt-x86_64.tar.xz"
        "https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/master/docker/prebuilt-arm.tar.xz"
        "gitlab-runner.install"
        "gitlab-runner.service"
        "gitlab-runner.sysusers"
        "gitlab-runner.tmpfiles"
        "config.toml"
        "lxc_executor.patch")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'd5888f378c5b12b84e4238b191ef56a97a81c9073d27dcb47065998f0a1f6caf9f13314ae908e72a06f4d29d1bd1f4f72338c97268391e2c98706216c8281f3e'
            'ed24841242a56a3b10dd80cd23e0c980f6bbe5fd0ebd4c6b46529947e4920cc9c03e4f4b239da8a798c801a6cdd757415113f97e45c1032f2c519fdaec4d3ae0'
            '8aa7f08702e99053c696fcc2aaba83beb9e9cd6f31973d82862db9350ac46df3a095377625d31fe909677525290d2de922d7a97930ed235774cb8f0da8944d40'
            '6751d9fa0b27172d1b419c4138f5ac15cbc7c9147653a7258cf1470216142c637210bb60608c7ed0974e0e4057e5ddeae32225df1bb36e7dd1f20fec71e33cc3'
            'f39c23fc06636f31c3fadb9a630c54527e8255098f18d275772cb30875d0a7463717101704070d432f2b69ab71f076a9538172a439bc307722dad2c7e260f752'
            'f88b8e6a8afb4f11bf61cfb6f680f611946658a8ea9c31588fb0b4be505bc72ac1af30ce819a2e74631d47919d684f121a625c091b3e6e891df5c434ae04acff')

prepare() {
    mkdir -p "${srcdir}/src/gitlab.com/gitlab-org/"
    ln -sf "${srcdir}/gitlab-ci-multi-runner" "${srcdir}/src/gitlab.com/gitlab-org/gitlab-ci-multi-runner"
    cd "${srcdir}/src/gitlab.com/gitlab-org/gitlab-ci-multi-runner"

    msg "Patch add lxc Executor"
    patch -Np1 -i "${srcdir}/lxc_executor.patch"

    export GOPATH="${srcdir}"
    make deps

    ln -sf "${srcdir}/prebuilt-x86_64.tar.xz" prebuilt-x86_64.tar.xz
    ln -sf "${srcdir}/prebuilt-x86_64.tar.xz" prebuilt-arm.tar.xz
}

build() {
    cd "${srcdir}/src/gitlab.com/gitlab-org/gitlab-ci-multi-runner"

    GOPATH="${srcdir}" go-bindata \
        -pkg docker \
        -nocompress \
        -nomemcopy \
        -prefix out/docker/ \
        -o executors/docker/bindata.go \
        prebuilt-x86_64.tar.xz \
        prebuilt-arm.tar.xz

    GOPATH="${srcdir}" go build
}

package() {
    cd "${srcdir}/src/gitlab.com/gitlab-org/gitlab-ci-multi-runner"

    install -Dm644 "${srcdir}/config.toml" "${pkgdir}/etc/gitlab-runner/config.toml"
    install -Dm644 "${srcdir}/gitlab-runner.service" "${pkgdir}/usr/lib/systemd/system/gitlab-runner.service"
    install -Dm644 "${srcdir}/gitlab-runner.sysusers" "${pkgdir}/usr/lib/sysusers.d/gitlab-runner.conf"
    install -Dm644 "${srcdir}/gitlab-runner.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/gitlab-runner.conf"
    install -Dm755 "gitlab-ci-multi-runner" "${pkgdir}/usr/bin/gitlab-ci-multi-runner"
    ln -s /usr/bin/gitlab-ci-multi-runner "${pkgdir}/usr/bin/gitlab-runner"
}
