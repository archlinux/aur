# Maintainer: Zach Himsel <zach [at] himsel [dot] net>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Adam S Levy <adam@aslevy.com>


pkgname='telegraf-git'
_pkgname='telegraf'
pkgver=r4693.cd1cd54e0
pkgrel=1
pkgdesc='Plugin-driven server agent for reporting metrics into InfluxDB'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://influxdb.org/'
license=('MIT')
makedepends=('make' 'go' 'git')
provides=('telegraf')
conflicts=('telegraf')
backup=('etc/telegraf/telegraf.conf')
install="${_pkgname}.install"
options=('!buildflags')
source=("${_pkgname}::git+https://github.com/influxdata/telegraf.git#branch=master"
        "${_pkgname}.install"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('SKIP'
            'b8494d35b868a256eace5f7baa7caa9d8561ee506aded3c47bd6b2ee031b0745'
            'ef54a27c036f11c44f32a42c81787dd0253f84e77170c2e8f9e268aca8773c33'
            'acf95397a51077b7684e8e4f4db7266c42cf82f24bc969ef2bc112a0f914f4cd'
            '95284d1e92f812c4c301cd1f35692850ae127397e33b910a5af7f54bbeb8986e')

pkgver() {
  cd "${srcdir}/${_pkgname}"
    (
     set -o pipefail
     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  repodir="${srcdir}/${_pkgname}"

  # binary
  install -D -m755 "${repodir}/telegraf" "${pkgdir}/usr/bin/telegraf"

  # configuration files
  install -dD -m755 "${pkgdir}/etc/telegraf/telegraf.d"
  "${repodir}/telegraf" -sample-config > "${pkgdir}/etc/telegraf/telegraf.conf"

  # license
  install -Dm644 "${repodir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # service
  install -D -m644 "${repodir}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

  # systemd user and home directory
  install -D -m644 "${repodir}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -D -m644 "${repodir}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
}
