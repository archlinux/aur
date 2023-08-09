# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='juicity'
pkgname=(${pkgbase}-{client,server})
pkgver=0.1.2
pkgrel=2
pkgdesc='A quic-based proxy protocol and implementation, inspired by tuic.'
url='https://github.com/juicity/juicity'
license=('AGPL3')
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv64')
depends=('glibc')
makedepends=('go')

source=("${pkgbase}-${pkgver}-full-src.zip"::"${url}/releases/download/v${pkgver}/${pkgbase}-full-src.zip"
        '0001-chore-bump-quic-go-to-v0.37.4-to-support-go1.21-81.patch')

sha512sums=('e87354656e2c2ac0498d69df73d08d3f4a5e41efcea6f9aa4707680bbbd84f72ccdb81fb5fd9442c88664df3f03d99d67e9fd2bd83dce7e005c978d663d5a09e'
            '3d5ccf3dad6e9e0a17763c043921f1d84392ff0e7aae5171d12080ea949cfb934318890910371a4f3c43387b4bd0dd3876af56e4469b5c36197027578845126a')

prepare() {
  patch --directory="${srcdir}" --forward --strip=1 --input="${srcdir}/0001-chore-bump-quic-go-to-v0.37.4-to-support-go1.21-81.patch"
}

build() {
  GOFLAGS='-trimpath -modcacherw' GOMODCACHE="${srcdir}/go-mod" VERSION="${pkgver}" make -C "${srcdir}"
}

_package() {
  pkgdesc+=" (${pkgname#*-})"
  provides=("${pkgname}")
  conflicts=("${pkgname}")
  backup=("etc/${pkgbase}/${pkgname#*-}.json")

  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/install/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/install/example-${pkgname#*-}.json" "${pkgdir}/etc/${pkgbase}/${pkgname#*-}.json"
}

for _pkgname in "${pkgname[@]}"; do
  eval "package_${_pkgname}() {
    $(declare -f "_package")
    _package
  }"
done
