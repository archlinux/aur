# Maintainer: Mark Collins <tera_1225 hat hotmail.com>

pkgname="go-matrix-skype-bridge-git"
_name="go-skype-bridge"
provides=('go-matrix-skype-bridge')
conflicts=('go-matrix-skype-bridge')
pkgver=r157.59e2790
pkgrel=1
pkgdesc="A Matrix-Skype puppeting bridge"
arch=('x86_64')
makedepends=(
  'git'
  'go'
)
depends=(
  'glibc'
  'libolm'
)
license=('AGPL-3.0-or-later')
url="https://github.com/kelaresg/go-skype-bridge"
source=("${_name}-${pkgver}::git+${url}.git"
        sysusers-${_name}.conf
        ${_name}.tmpfiles
        ${_name}.service
        log-path.diff)
sha256sums=('SKIP'
            '56a18605edcc7a58d478a3a84995ec7f6d139e82577c9d75af3dd08354810f97'
            '4028a34a49874c74becccc034ed25332e1cbcfeac8dcdf56a2ce0bbc493d3706'
            '2928fc3c8141c54cbf282765b52bb33fcaa84a59c1565635502294b9d28e9a92'
            '32f1e72d1f7831b86fd5361fa5e469e91378a3ee054c39f6a2f0fe065515ccf8')
backup=("etc/${_name}/${_name}.yaml")

pkgver() {
  cd "${srcdir}/${_name}-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_name}-$pkgver"
  patch --input="${srcdir}/log-path.diff" "example-config.yaml"
}

build() {
  cd "${srcdir}/${_name}-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "${_name}-${pkgver}/matrix-skype" "$pkgdir/usr/bin/go-skype-bridge"
  install -Dm644 "sysusers-${_name}.conf" "$pkgdir/usr/lib/sysusers.d/${_name}.conf"
  install -Dm644 "${_name}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${_name}.conf"
  install -Dm644 "${_name}.service" "$pkgdir/usr/lib/systemd/system/${_name}.service"
  install -dm755 "$pkgdir/etc/${_name}"
  install -Dm644 "${_name}-${pkgver}/example-config.yaml" "$pkgdir/etc/${_name}/${_name}.yaml"
}
