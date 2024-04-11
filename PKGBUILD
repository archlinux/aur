pkgname='slskd-bin'
pkgver=0.20.1
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
sha256sums_x86_64=('9711ae5e30f23721ba8f9e1efa115eaf71f7f6a17e989cb854d7b05050687c80')
sha256sums_aarch64=('4272d9163e8f4a4a1ae7d05544b04e807cfcd93ac3ec49a00b3917ec2c137568')
sha256sums_armv7h=('9b1b4a09c699fd5c0a70d9d0102af2a4d80ad1cb8bd867ef6d074c7e38f4cb1e')

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

