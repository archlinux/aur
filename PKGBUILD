# Maintainer: robertfoster
pkgname=local-ai
pkgver=3.6.0 # renovate: datasource=github-tags depName=mudler/LocalAI
pkgrel=1
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first"
arch=('x86_64')
url="https://github.com/mudler/LocalAI"
license=('MIT')
backup=("etc/${pkgname}/${pkgname}.conf")
makedepends=(
  'go'
  'make'
)
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
  "${pkgname}.conf"
  "${pkgname}.tmpfiles"
  "${pkgname}.sysusers"
  "${pkgname}.service"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}"
  export PATH="${GOPATH}/bin:${PATH}"

  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm775 "${pkgname}" -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -D -m644 "${srcdir}/${pkgname}.conf" \
    "${pkgdir}/etc/${pkgname}/${pkgname}.conf"

  install -d "${pkgdir}/usr/share/${pkgname}/backends"

  # systemd
  install -D -m644 "${srcdir}/${pkgname}.service" \
    -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 "${srcdir}/${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -D -m644 "${srcdir}/${pkgname}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

sha256sums=('d4412859c114f6714223ff4bf8050323fb1d1d05e4436256532fc9be116e3f6e'
            '8153bc015f138655e08a49183c36d00f7fb661a2b9367110f44af844eab815ae'
            'dd51cf954b60d75e0521a6e58188bcb06981e87d7ca8ac22d7dc4d46a362a671'
            '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
            '6e4c0e2a2694867a5c27e21855e530a9327ae3658dbaa9b18fe028ab96df915a')
