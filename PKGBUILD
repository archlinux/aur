pkgname='slskd-bin'
pkgver=0.24.0
pkgrel=1
pkgdesc='A modern client-server application for the Soulseek file-sharing network.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/slskd/slskd/'
license=('AGPL3')
options=("!strip")

depends=(dotnet-runtime)

source_x86_64=("https://github.com/slskd/slskd/releases/download/${pkgver}/slskd-${pkgver}-linux-x64.zip")
source_aarch64=("https://github.com/slskd/slskd/releases/download/${pkgver}/slskd-${pkgver}-linux-arm64.zip")
source_armv7h=("https://github.com/slskd/slskd/releases/download/${pkgver}/slskd-${pkgver}-linux-arm.zip")

source=(
  'slskd.service'
  'slskd.sysusers'
  'slskd.tmpfiles'
)

sha256sums_x86_64=('575c2854669b72f13061b39cb1d8b02819e9cbdeb7fbce9c0c33a4691dc3c20d')
sha256sums_aarch64=('f4b10b1ff8bdb22824e84adc205a9b14bddd3bda3390cba59f4c834ae615e7e6')
sha256sums_armv7h=('7c39cecdd988f794170eea51efe4cffc95357344bdd35108f784c9248b430c17')

noextract=()
sha256sums=('535e14574a54723728fd2bddf62e54fa615a846afc0a0e69e249ae3850d503d4'
            '69545412a47b0d60b4af33faf61499168016202cd1a60da0c15f17f6da3c900b'
            '2f1d645115bbcf225be3e585aaeb598f1710277f17c41c64e0308eb25b8ed4f4')

#pkgver() {
	#curl -s https://api.github.com/repos/slskd/slskd/releases/latest | grep tag_name | sed 's/.*: "\([^"]\+\)".*/\1/'
	# Pkgver() incompatible with checksums
#}

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

