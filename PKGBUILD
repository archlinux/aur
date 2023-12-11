# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=1.27.1
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
sha256sums=('e91671a8291a6d83264f1d1ed731fb6041b25d7259400e5f71cb2d241a48e6a4')
sha256sums_x86_64=('43c5983b9e79c88bbf8971bcf6ee9aedaf11c2c9da3b953d1a806c3c7381ed8a')
sha256sums_aarch64=('39cddfea24e31b339e321bc2011ce2984efc4ca8b093f713ec2ab94145ae3131')
sha256sums_armv7h=('bce93c587b3d3b94563b5ff901c3e177cdcfb9e1297997a733f5508c524c7932')
sha256sums_i686=('f8287589e10a36516b51e258ff37beaf795d145a0c12a7cf94bf2e6099d83a79')

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
