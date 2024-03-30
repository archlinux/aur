# Maintainer: Scott Cheng <aur@chengscott.io>

pkgname=scanlogd
_name="${pkgname}-main"
pkgver=2.2.8
pkgrel=1
pkgdesc="A tool to detect and log TCP port scans"
arch=(any)
url="https://github.com/openwall/scanlogd"
license=("BSD")
source=(
  "${pkgname}.zip"::"${url}/archive/refs/heads/main.zip"
  "scanlogd.service"
  "sysusers.conf"
  "tmpfiles.conf"

)
sha256sums=(
  "SKIP"
  "e8fc8b60385957e90627c1998f9a159f49697172386aef4c81ecf452aa22bb39"
  "f34bf3c7555fa6a1b53f2154c8a7a92868fb3eb5c6060ca3fef1b1bacd622896"
  "f2b287885cdd73b7f0a083c7270c2d6b696624d725e73096975f606c8f7d6c0c"
)
options=(zipman)

prepare() {
    sed -i "s@/var/empty@/var/lib/scanlogd@g" "${_name}/params.h"
}

build() {
    make -C "${_name}" linux
}

package() {
    cd "${_name}"
    install -vDm700 -o199 -g199 scanlogd -t "${pkgdir}/usr/bin"
    setcap cap_setgid,cap_sys_chroot,cap_net_raw,cap_net_admin=eip "${pkgdir}/usr/bin/scanlogd"

    cd "${srcdir}"
    install -vDm644 "${_name}/scanlogd.8" -t "${pkgdir}/usr/share/man/man8"
    install -vDm755 "${_name}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -vDm644 "scanlogd.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -vDm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -vDm644 "tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
