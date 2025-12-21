# Maintainer: robertfoster
pkgname=local-ai-git
pkgver=3.8.0.r155.g38cde81ff
pkgrel=1
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first"
arch=('x86_64')
url="https://github.com/mudler/LocalAI"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/${pkgname%-git}/${pkgname%-git}.conf")
makedepends=(
  'go'
  'make'
  'unzip'
)
source=("${pkgname%-git}::git+${url}.git"
  "${pkgname%-git}.conf"
  "${pkgname%-git}.tmpfiles"
  "${pkgname%-git}.sysusers"
  "${pkgname%-git}.service"
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  export GOPATH="${srcdir}"
  export PATH="${GOPATH}/bin:${PATH}"

  make build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm775 "${pkgname%-git}" -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"

  install -D -m644 "${srcdir}/${pkgname%-git}.conf" \
    "${pkgdir}/etc/${pkgname%-git}/${pkgname%-git}.conf"

  install -d "${pkgdir}/usr/share/${pkgname%-git}/backends"

  # systemd
  install -D -m644 "${srcdir}/${pkgname%-git}.service" \
    -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 "${srcdir}/${pkgname%-git}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
  install -D -m644 "${srcdir}/${pkgname%-git}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-git}.conf"
}

sha256sums=(
  'SKIP'
  '8153bc015f138655e08a49183c36d00f7fb661a2b9367110f44af844eab815ae'
  'dd51cf954b60d75e0521a6e58188bcb06981e87d7ca8ac22d7dc4d46a362a671'
  '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
  '6e4c0e2a2694867a5c27e21855e530a9327ae3658dbaa9b18fe028ab96df915a'
)
