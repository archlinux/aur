# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=2.0.0
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
sha256sums=('e5bdc6cbc9d671d6c1bfcc0c778bd4d591ebb491fe07d5f7a1c19916c8742df6')
sha256sums_x86_64=('a30a4e92724607cb3f4efd9569a21c520eab16e8a3e7de4ce0fef49487f24640')
sha256sums_aarch64=('039d001f2e178ff1495d6495e1ee16582ff1fcc27c016fed5272d19be8fe626d')
sha256sums_armv7h=('09c7acec8a179377f3a052f6c1b31acf6f4504194d0bf9cb2688df92f4624364')
sha256sums_i686=('1a1a8c5b7ddcb5ac7664c8fae6700fec5a20febb352520e769ac030364660ca6')

package() {
case "$CARCH" in
	aarch64) _pkgarch="arm64"
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
