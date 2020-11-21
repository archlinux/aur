# Maintainer: nobodyinperson <nobodyinperson-at-posteo-de>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Contributor: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname=gitlab-runner-arm64
pkgver=13.5.0
pkgrel=1
pkgdesc="The official GitLab CI runner written in Go"
arch=('x86_64' 'aarch64')
url='https://gitlab.com/gitlab-org/gitlab-runner'
license=('GPL3')
depends=('ca-certificates' 'curl' 'git' 'glibc' 'tar')
makedepends=('git' 'go' 'git' 'mercurial' 'gox')
install=gitlab-runner.install
replaces=('gitlab-ci-multi-runner')
backup=('etc/gitlab-runner/config.toml')
noextract=("prebuilt-${pkgver}-x86_64.tar.xz"
           "prebuilt-${pkgver}-arm.tar.xz")
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/api/v4/projects/gitlab-org%2Fgitlab-runner/repository/archive?sha=v${pkgver}"
        "prebuilt-${pkgver}-x86_64.tar.xz::https://gitlab-runner-downloads.s3.amazonaws.com/v${pkgver}/helper-images/prebuilt-x86_64.tar.xz"
        "prebuilt-${pkgver}-arm.tar.xz::https://gitlab-runner-downloads.s3.amazonaws.com/v${pkgver}/helper-images/prebuilt-arm.tar.xz"
        "gitlab-runner.service"
        "gitlab-runner.sysusers"
        "gitlab-runner.tmpfiles"
        "config.toml")
sha512sums=('57564e2e89c64ec5936d331a1a7fb5ab6e7978b695e4b7423f45bb1bc1a41222ebc663389a25e5061320fa5cb2619ec631a45da749a407fe095e981505677520'
            '94181b9238bdde74c88e05c37f93d6ce242bb5d8abc45158f7f4bf9bec2e09c9beafa8636f4589f9e917ed7f0aafc0858b3d3ffc13936da70981028703ca4016'
            'b62856843fe5d221afbb91e9b0b81071975a2062f36340f9d79af744b759c864f9a37e1b5c796efe8394ce2319b4fac8181a8835a87a8d8c741ae9b35bb6929a'
            '8a5a8b7654d3864722e784b2814c6278c17876f1c0c4fc0676fbcf6817ad2ba4be55501e67ce88c62b5b63ca886b01afc6feac98ba49842acd244abdd1a8296f'
            '8aa7f08702e99053c696fcc2aaba83beb9e9cd6f31973d82862db9350ac46df3a095377625d31fe909677525290d2de922d7a97930ed235774cb8f0da8944d40'
            '6751d9fa0b27172d1b419c4138f5ac15cbc7c9147653a7258cf1470216142c637210bb60608c7ed0974e0e4057e5ddeae32225df1bb36e7dd1f20fec71e33cc3'
            '9718b94bd0ddb09095ffb8c1e60ca1e9649dabb1747e7fc95e58e404b2f9effdeb4cfd759f5b904443dc53a4e18c02003c38f85584713deb49f6a6d1007503de')

_srcdir="gitlab-runner-v${pkgver}-"

prepare() {
  local revision=$(ls -d ${_srcdir}* | rev | cut -c 33-40 | rev)

  cd "${_srcdir}"*

  local version=$(cat VERSION)

  sed -i "s/export VERSION.*/export VERSION := $version/" Makefile
  sed -i "s/REVISION := .*/REVISION := $revision/" Makefile
  sed -i "s/var VERSION.*/var VERSION = \"$version\"/" common/version.go

  make version

  ln -sf "${srcdir}/prebuilt-${pkgver}-x86_64.tar.xz" prebuilt-x86_64.tar.xz
  ln -sf "${srcdir}/prebuilt-${pkgver}-arm.tar.xz" prebuilt-arm.tar.xz
}

build() {
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd "${_srcdir}"*
  go build -o gitlab-runner .
}

package() {
  cd "${_srcdir}"*

  install -Dm644 "${srcdir}/config.toml" "${pkgdir}/etc/gitlab-runner/config.toml"
  install -Dm644 "${srcdir}/gitlab-runner.service" "${pkgdir}/usr/lib/systemd/system/gitlab-runner.service"
  install -Dm644 "${srcdir}/gitlab-runner.sysusers" "${pkgdir}/usr/lib/sysusers.d/gitlab-runner.conf"
  install -Dm644 "${srcdir}/gitlab-runner.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/gitlab-runner.conf"
  install -Dm755 gitlab-runner "${pkgdir}/usr/bin/gitlab-runner"
}

