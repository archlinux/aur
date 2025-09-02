# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=2.0.4
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
sha256sums=('682940b141bef4b4c58e42eed3aa05e5586e5b179898967d49b3b12029ca9206')
sha256sums_x86_64=('f8c33e8409f041af0663987214cd43e45908cf0792cfe9b0dd5352ae1d9e9895')
sha256sums_aarch64=('6247412b61266394436fbdf8cc5a180c54b881c0ea88b2df9ca07227f4ceea60')
sha256sums_armv7h=('15778364956770db414a3af7f53a24523e0f7a89fd083918f1000e2cd4b2d4b1')
sha256sums_i686=('1f2076574aa8eb43ab29e4a708107866b05100e83396ea3d927bd9314fc8fb56')

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
