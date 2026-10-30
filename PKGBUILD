# Maintainer: agony <27015 at riseup dot net>

pkgname=webdav
pkgver=5.17.3
pkgrel=1
pkgdesc='Standalone WebDAV server'
arch=('x86_64' 'aarch64')
url='https://github.com/hacdias/webdav'
license=('MIT')
depends=('glibc')
makedepends=('go')
backup=('etc/webdav/config.yml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'config.yml'
        'webdav.service'
        'webdav.sysusers'
        'webdav.tmpfiles')
sha256sums=('326b3ceac4dfe8980b6afc6592076afc2a5b753c8586e615e5f5f13af3147e2c'
            'd178253eaf9dee6faad783ec9a1d61c0babca6ddced3216ee81957e05873b201'
            'f775c6ec0eb47472b7d7a13a10508b5aedf2fa7a92aeb4a8492484e64dd64b56'
            '2e6ceac8a2cbdd85ceb6ebbb7cae7d1ad00b14fc8a7e131da9c7ef573f3246e0'
            'f236c800ceb469bbb5fe003866f51881f07637ad940a39bf375804e725996642')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -v -ldflags="-linkmode=external -X github.com/hacdias/webdav/v5/cmd.version=${pkgver}" -o webdav .
  for shell in bash fish zsh; do
    ./webdav completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm640 config.yml "${pkgdir}/etc/webdav/config.yml"
  install -Dm644 webdav.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 webdav.sysusers "${pkgdir}/usr/lib/sysusers.d/webdav.conf"
  install -Dm644 webdav.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/webdav.conf"
  cd "${pkgname}-${pkgver}"
  install -Dm755 webdav -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/webdav"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/webdav.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_webdav"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
