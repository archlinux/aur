pkgname='slskd-bin'
pkgver=0.19.5
pkgrel=1
pkgdesc='A modern client-server application for the Soulseek file-sharing network.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/slskd/slskd/'
license=('AGPL3')
options=("!strip")
options=("!strip")

depends=(
)

optdepends=(
)

source_x86_64=("https://github.com/slskd/slskd/releases/download/${pkgver}/slskd-${pkgver}-linux-x64.zip")
source_aarch64=("https://github.com/slskd/slskd/releases/download/${pkgver}/slskd-${pkgver}-linux-arm64.zip")
source_armv7h=("https://github.com/slskd/slskd/releases/download/${pkgver}/slskd-${pkgver}-linux-arm.zip")

source=(
  'slskd.service'
  'slskd.sysusers'
  'slskd.tmpfiles'
)

noextract=()
sha256sums=(
  '4081ba91465bcd9784542d9b46313e4803ee464a0cca6c51fc3c6341d5355c01'
  '69545412a47b0d60b4af33faf61499168016202cd1a60da0c15f17f6da3c900b'
  '2f1d645115bbcf225be3e585aaeb598f1710277f17c41c64e0308eb25b8ed4f4'
)
sha256sums_x86_64=('9b135004689b4137e0e8612b9e7ca73a15119f31e34b7bf001f0fd195efc90a0')
sha256sums_aarch64=('42864fda749b32b9dd6286b1597182f474db6aee0a171c42891f41498495d847')
sha256sums_armv7h=('f243982f7d342752431436465c540fb567a4a6ed8e5c3d966a3ac30371baee03')

pkgver() {
#	cd ${pkgname}
	curl -s https://api.github.com/repos/slskd/slskd/releases/latest | grep tag_name | sed 's/.*: "\([^"]\+\)".*/\1/'
	# Not updating pkgver for some reason
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/slskd"
  cp -dpr --no-preserve=ownership "${srcdir}/slskd" "${pkgdir}/usr/lib/slskd/"
  cp -dpr --no-preserve=ownership "${srcdir}/wwwroot" "${pkgdir}/usr/lib/slskd/"
  cp -dpr --no-preserve=ownership "${srcdir}/config" "${pkgdir}/usr/lib/slskd/"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/slskd/slskd ${pkgdir}/usr/bin/slskd

  install -D -m 644 "${srcdir}/slskd.sysusers" "${pkgdir}/usr/lib/sysusers.d/slskd.conf"
  install -D -m 644 "${srcdir}/slskd.service" "${pkgdir}/usr/lib/systemd/system/slskd.service"
  install -D -m 644 "${srcdir}/slskd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/slskd.conf"
}

