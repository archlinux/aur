# Maintainer: robertfoster
pkgname=local-ai
pkgver=4.5.5 # renovate: datasource=github-tags depName=mudler/LocalAI
pkgrel=2
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first"
arch=('x86_64')
url="https://github.com/mudler/LocalAI"
license=('MIT')
backup=("etc/${pkgname}/${pkgname}.conf")
makedepends=(
  'git'
  'go'
  'make'
  'nodejs'
  'npm'
  'unzip'
)
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
  "${pkgname}.conf"
  "${pkgname}.tmpfiles"
  "${pkgname}.sysusers"
  "${pkgname}.service"
)

build() {
  cd "${srcdir}/${pkgname}"
  export GOPATH="${srcdir}"
  export PATH="${GOPATH}/bin:${PATH}"

  make build
}

package() {
  cd "${srcdir}/${pkgname}"
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

sha256sums=('8b461b041afb940d99925c3b98bfd08283a662f4c54231bff80e30e8d5da0258'
            '9d22535eaf1f2f9d3c65c4afcda492f5f3c69d04098344ec6e32b67077791321'
            'd7e620a65a98e6341c1e16e731ebd1aec636b229e81e043d44caf6607cba0147'
            '97ba21355c50ec658e220bc0558f506227b3dc77cc51f343b6f5657b0d77a19b'
            '6e4c0e2a2694867a5c27e21855e530a9327ae3658dbaa9b18fe028ab96df915a')
