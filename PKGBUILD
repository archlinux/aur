# Maintainer: Stefan Cocora <stefan dot cocora at gmail dot com>
# Contributor:

_pkgauthor=rkt
_upstream_pkgname=rkt
pkgname=rkt-bin
pkgver=1.30.0
pkgrel=1
pkgdesc="rkt is a pod-native container engine for Linux. It is composable, secure, and built on standards."
arch=('x86_64')
_upstream_arch="amd64"
url="https://github.com/rkt/rkt"
license=('apache')
depends=('glibc' 'openssl' 'zlib' 'systemd')
provides=('rkt-bin')
conflicts=('rkt' 'rkt-git')
optdepends=()
makedepends=()
# https://github.com/rkt/rkt/releases/download/v1.30.0/rkt_1.30.0-1_amd64.deb
source=("${_upstream_pkgname}_${pkgver}-1_${_upstream_arch}.deb::https://github.com/${_pkgauthor}/${_upstream_pkgname}/releases/download/v${pkgver}/${_upstream_pkgname}_${pkgver}-1_${_upstream_arch}.deb"
       "${_upstream_pkgname}.sysusers")
sha256sums=('57e1d8ec5075369a0781d1c3aac2dcc032d73f4c2b292bcb61a52a53cd02d301'
           'SKIP')

prepare() {
    cd "${srcdir}"
    /usr/bin/ar p "${_upstream_pkgname}_${pkgver}-1_${_upstream_arch}.deb" data.tar.gz | bsdtar xf -
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}"/usr/bin/rkt "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib/rkt/stage1-images"
  install -m644 "${srcdir}"/usr/lib/rkt/stage1-images/*.aci "${pkgdir}/usr/lib/rkt/stage1-images"
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}"/usr/lib/systemd/system/*.{service,socket,timer} "${pkgdir}/usr/lib/systemd/system"
  install -d "${pkgdir}/usr/lib/tmpfiles.d"
  install -m644 "${srcdir}"/usr/lib/tmpfiles.d/*.conf "${pkgdir}/usr/lib/tmpfiles.d"
  install -d "${pkgdir}/usr/share/man/man1"
  install -m644 "${srcdir}"/usr/share/man/man1/*.1 "${pkgdir}/usr/share/man/man1"
  install -d "${pkgdir}/usr/share/doc"
  install -m644 "${srcdir}"/usr/share/doc/"${_upstream_pkgname}"/*.{dot,gz,md,png,svg} "${pkgdir}/usr/share/doc"
  install -d "${pkgdir}/usr/share/bash-completion/completions"
  install -m644 "${srcdir}"/usr/share/bash-completion/completions/"${_upstream_pkgname}" "${pkgdir}/usr/share/bash-completion/completions"
  install -Dm644 "${srcdir}/${_upstream_pkgname}.sysusers" "$pkgdir/usr/lib/sysusers.d/${_upstream_pkgname}.conf"
}
