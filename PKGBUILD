pkgname='slskd-bin'
pkgver=0.24.4
pkgrel=2
pkgdesc='A modern client-server application for the Soulseek file-sharing network.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/slskd/slskd/'
license=('AGPL3')
options=("!debug" "!strip")
depends=(dotnet-runtime)

source_x86_64=("https://github.com/slskd/slskd/releases/download/${pkgver}/slskd-${pkgver}-linux-x64.zip")
source_aarch64=("https://github.com/slskd/slskd/releases/download/${pkgver}/slskd-${pkgver}-linux-arm64.zip")
source_armv7h=("https://github.com/slskd/slskd/releases/download/${pkgver}/slskd-${pkgver}-linux-arm.zip")

source=(
  'slskd.service'
  'slskd.sysusers'
  'slskd.tmpfiles'
)

sha256sums_x86_64=('2f1338866230a07593e9443f69f063bdbc241bc6df3b6c1c2052e4676fc99d9f')
sha256sums_aarch64=('d00aa55dbda866b29091974203e56beda35d60d5e92ec98b70ace66d6fee96be')
sha256sums_armv7h=('e50c92bc955666208ae9403cb965ca32a6b667ce92cb539dbd2b4837931ce0f4')

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

