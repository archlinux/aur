# Maintainer: Wallun <wallun AT disroot DOT org>
pkgname=karma-dashboard
_pkgname=karma
pkgver=0.115
pkgrel=1
pkgdesc="Alert dashboard for Prometheus Alertmanager"
arch=(x86_64)
url="https://github.com/prymitive/karma"
license=('Apache')
makedepends=('coreutils' 'glibc' 'go' 'npm' 'yarn')
provides=(karma)
conflicts=(karma-dashboard-bin)
backup=(etc/karma/karma.yml)
source=(karma.service
        karma.yml
        karma.sysusers
        "${_pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha512sums=('b71a5c1f5ecc5a82dc612bc4a9a84810e8a185b33036c00bb8af822a557d86297c1c600bd2dcf6e2c3deb137fa66c58136f221f7d5d0369f286ff3dbc150a4af'
            '0416eb6d18bf3c44deb0946d8b6b73edcd49ea5b1999d69d8ae32986691d5851ae8935a97e5fd3d31f84386c4d665879e56f24234347d4b6589a1bcd79659e76'
            '008b496aad7b92fe1f884cd89a55b15eb320dfff5ce277eea0c05777f3e5c3044310c16bb6f40153f8e9ed2d1af633fbd0cfff46bb04a96e2df35dba17815d95'
            'ad64c79f0d9d5ed9c06cb8f671a7ac86c23ebf7e5c16439d73735c64d07617998ae30a9a74132145535d02dcdc39d9452a832998b91f848caf99a9651c7d3969')

prepare() {
  cd "$srcdir/${_pkgname}-$pkgver" || exit 1
  export GOPATH="srcdir/go"
  mkdir -p "$GOPATH/src/github.com/prymitive/"
  rm -f "$GOPATH/src/github.com/prymitive/${_pkgname}"
  ln -sr "$srcdir/${_pkgname}-$pkgver" "$GOPATH/src/github.com/prymitive/${_pkgname}"
}

build() {
  export GOPATH="$srcdir/go"
  export PATH=$PATH:$GOPATH/bin
  cd "${_pkgname}-$pkgver"
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  # Install binary
  install -D -m0775 "$srcdir/${_pkgname}-$pkgver/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  # Install example configuration
  install -D -m0644 "$srcdir/${_pkgname}.yml" \
    "${pkgdir}/etc/${_pkgname}/${_pkgname}.yml"

  # Install systemd service file
  install -D -m0644 "${srcdir}/${_pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

  # Install sysusers
  install -D -m0644 "${srcdir}/${_pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}
