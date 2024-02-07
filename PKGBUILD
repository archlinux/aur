# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=1.27.3
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing: binary."
url="https://syncthing.net/"
arch=(x86_64 aarch64 armv7h i686)
license=('MPL2')
provides=('syncthing=${pkgver}')
conflicts=('syncthing')
install=${_realname}.install
source=("${_realname}-${pkgver}.tar.gz::https://github.com/syncthing/syncthing/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("https://github.com/syncthing/${_realname}/releases/download/v${pkgver}/${_realname}-linux-amd64-v${pkgver}.tar.gz")
source_aarch64=("https://github.com/syncthing/${_realname}/releases/download/v${pkgver}/${_realname}-linux-arm64-v${pkgver}.tar.gz")
source_armv7h=("https://github.com/syncthing/${_realname}/releases/download/v${pkgver}/${_realname}-linux-arm-v${pkgver}.tar.gz")
source_i686=("https://github.com/syncthing/${_realname}/releases/download/v${pkgver}/${_realname}-linux-386-v${pkgver}.tar.gz")
sha256sums=('fa2edae90c7999a6f667bba26a6c63c7165647f77c02c83860237c6d08ee4bbd')
sha256sums_x86_64=('734ac805e74f780761cc4ab6e7b3b22aefd4589e9dadbdb55eeb0cf122aebfdb')
sha256sums_aarch64=('d5c20e3fe3732a4560673ec037462978acafb67ed53c0e2d58eaa8b98b372b01')
sha256sums_armv7h=('6c37db6329b995134aa5d589b0193e48712581a690b3197ef8141c77744644ac')
sha256sums_i686=('b1815f35faba2895217c5bfb1c99153c8dad801d9bd109f47df7ef2888b7c676')

package() {
case "$CARCH" in
	arm64) _pkgarch="arm64"
		;;
	armv*) _pkgarch="arm"
		;;
	i686) _pkgarch="386"
		;;
	x86_64) _pkgarch="amd64"
		;;
esac

    cd "${_realname}-linux-${_pkgarch}-v${pkgver}"
    install -D -m 755 ${_realname} "${pkgdir}/usr/bin/${_realname}"
    install -D -m 644 README.txt "${pkgdir}/usr/share/doc/${_realname}/README.md"
    install -D -m 644 "etc/linux-systemd/system/${_realname}@.service" \
                      "${pkgdir}/usr/lib/systemd/system/${_realname}@.service"
    install -D -m 644 "etc/linux-systemd/user/${_realname}.service" \
                      "${pkgdir}/usr/lib/systemd/user/${_realname}.service"
    install -D -m 644 "etc/linux-sysctl/30-${_realname}.conf" \
                      "${pkgdir}/usr/lib/sysctl.d/30-${_realname}.conf"
    install -D -m 644 "etc/firewall-ufw/${_realname}" \
                      "${pkgdir}/etc/ufw/applications.d/ufw-${_realname}"

    # man pages
    cd "${srcdir}/${_realname}-${pkgver}/man"
    install -Dm644 ${_realname}.1 "${pkgdir}"/usr/share/man/man1/${_realname}.1
    for file in $(find . -name '*.5' -print); do
      install -Dm644 $file "${pkgdir}"/usr/share/man/man5/$file
    done
    for file in $(find . -name '*.7' -print); do
      install -Dm644 $file "${pkgdir}"/usr/share/man/man7/$file
    done
}

# vim:set ts=2 sw=2 et:
