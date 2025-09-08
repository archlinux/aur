# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=2.0.8
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
sha256sums=('78d38211b1f02bae0882dd9bf5c3cb976deff50124024a22eb922613d53238db')
sha256sums_x86_64=('a516ff64a1bf52b867016ecb069886b9db8d3126d49e58865b4c64d638523dc5')
sha256sums_aarch64=('30c00ffd5a286d18d82ae262b02dac7f5a1592d3c5fa0c0c6986aa4621cc6ede')
sha256sums_armv7h=('1a3a5cd96d7ca07a21e62f1eb2ab9d31ea15ec2684f0bbdeb084c6e4b1bfdb64')
sha256sums_i686=('ba00826078d795da5f41d7fc8c54f39d7b8a1284f244f27c7dcc904366a05b06')

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
