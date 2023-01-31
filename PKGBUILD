# Maintainer: Zach Himsel <zach [at] himsel [dot] net>

pkgname=hacompanion
_pkgname=hacompanion
_reponame=tobias-kuendig/hacompanion
pkgdesc="Daemon that sends local hardware information to Home Assistant"
url="https://github.com/${_reponame}"
license=('MIT')

pkgver=1.0.5
pkgrel=1
arch=('any')

conflicts=('hacompanion-git')
makedepends=('git' 'go')

source=("${_pkgname}::git+https://github.com/${_reponame}.git#tag=v${pkgver}"
        "hacompanion.install"
        "hacompanion.service"
        "hacompanion.sysusers"
        "hacompanion.tmpfiles"
        "0001-Save-registration-file-to-var-lib-hacompanion.patch")
sha256sums=('SKIP'
            '8d0bdc24a666302edb64759dcc82ba10f70de2fa06e489cd663362907aaf7c92'
            '2d00d05d5f39769f9285d473b787b847ea82b918252f4c960a2dacd4cdb259ac'
            'a6cf94385c30eee6de74caa6b63a5ca6ebcbf9451a95bcff7765d9972434af5d'
            'b4242c4051c71ea275376d8a753a36c9816a1bab08eed8205ce97b2d958a9b4b'
            'ae0d021f4b08f36151ff5c0c2497b8ab55cf5f101e29100b04a2d8b39b90fe9d')

backup=(
    'etc/hacompanion/config.toml'
    )

prepare() {
  repodir="${srcdir}/${_pkgname}"
  cd "${repodir}"

  patch --strip=1 --forward --input ../0001-Save-registration-file-to-var-lib-hacompanion.patch
}

build() {
  repodir="${srcdir}/${_pkgname}"
  cd "${repodir}"

  CGO_ENABLED=0 \
  GOOS=linux \
  go build \
    -ldflags "-s -w -X main.version=v${pkgver}" \
    -o hacompanion
}

package() {
  repodir="${srcdir}/${_pkgname}"

  # binary
  install -D -m755 "${repodir}/hacompanion" "${pkgdir}/usr/bin/hacompanion"

  # configuration files
  install -D -m755 "${repodir}/hacompanion.toml" "${pkgdir}/etc/hacompanion/config.toml"

  # license
  install -D -m644 "${repodir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # service
  install -D -m644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

  # systemd user and home directory
  install -D -m644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -D -m644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
