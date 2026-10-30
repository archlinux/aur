# Maintainer: agony <27015 at riseup dot net>

pkgname=webdav-git
pkgver=r315.614d975
pkgrel=1
pkgdesc='Standalone WebDAV server (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/hacdias/webdav'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('webdav')
conflicts=('webdav')
backup=('etc/webdav/config.yml')
source=("webdav::git+${url}.git"
        'config.yml'
        'webdav.service'
        'webdav.sysusers'
        'webdav.tmpfiles')
sha256sums=('SKIP'
            'd178253eaf9dee6faad783ec9a1d61c0babca6ddced3216ee81957e05873b201'
            'f775c6ec0eb47472b7d7a13a10508b5aedf2fa7a92aeb4a8492484e64dd64b56'
            '2e6ceac8a2cbdd85ceb6ebbb7cae7d1ad00b14fc8a7e131da9c7ef573f3246e0'
            'f236c800ceb469bbb5fe003866f51881f07637ad940a39bf375804e725996642')

pkgver() {
  cd webdav
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd webdav
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd webdav
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  local version
  version=$(git describe --tags | sed 's/^v//')
  go build -v -ldflags="-linkmode=external -X github.com/hacdias/webdav/v5/cmd.version=${version}" -o webdav .
  for shell in bash fish zsh; do
    ./webdav completion "${shell}" > "completion.${shell}"
  done
}

package() {
  install -Dm640 config.yml "${pkgdir}/etc/webdav/config.yml"
  install -Dm644 webdav.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 webdav.sysusers "${pkgdir}/usr/lib/sysusers.d/webdav.conf"
  install -Dm644 webdav.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/webdav.conf"
  cd webdav
  install -Dm755 webdav -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/webdav"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/webdav.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_webdav"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
