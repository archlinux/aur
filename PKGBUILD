pkgname=argus-bin
_pkgname=argus
pkgver=0.29.3
pkgrel=3
pkgdesc='Lightweight monitor to notify of new software releases via Gotify/Slack/other messages and/or WebHooks.'
arch=('x86_64' 'aarch64')
url='https://release-argus.io/'
licence=('Apache License 2.0')
provides=("$_pkgname")
source=('config.yml'
		'argus.service'
		'tmpfiles.conf'
		'sysusers.conf')
# source_x86_64=("https://github.com/release-argus/Argus/archive/Argus-$pkgver.linux-amd64")
# source_aarch64=("https://github.com/release-argus/Argus/archive/Argus-$pkgver.linux-arm64")
backup=('etc/argus/config.yml')

sha256sums=('7ea09ebc9ae76e3b57c47a566b26ee11e0aab12dde11c3aa594fd3d351df5d22'
            '73e249a0bf4ad7f14d28371001307882b33d17f6a34116449c3a84ff0bd768c7'
            '73699eccca0aa9e134ea6e930ac87ab8441108fdd9d950b662ea4dc1c4a7ad9e'
            'b0da219ff1c738c17e449984702740870cdb2d369e7dc50e655f5d2ae83e7287')
sha256sums_x86_64=('3a663a095f81abc8101f84721a7a8bfc710e923cf93710cea1800a9038228204')
sha256sums_aarch64=('191b9c6e3bed5b224249b2d612a13fd17908939ad7c960b8f0f372473b1d7052')

declare -xA _arches
_arches['x86_64']=amd64
_arches['aarch64']=arm64

# Add sources for the supported architectures.
for key in "${!_arches[@]}"
do
  declare -n source_x="source_${key}"
  source_x=("Argus-${pkgver}.linux-${_arches[$key]}::https://github.com/release-argus/Argus/releases/download/${pkgver}/Argus-${pkgver}.linux-${_arches[$key]}")
done

_exe_name=Argus-${pkgver}.linux-${_arches[$CARCH]}
package() {
	install -Dm755 "${_exe_name}" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$srcdir/config.yml" "$pkgdir/etc/argus/config.yml"
	install -Dm644 "$srcdir/argus.service" "$pkgdir/usr/lib/systemd/system/argus.service"
	install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
	install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
}
