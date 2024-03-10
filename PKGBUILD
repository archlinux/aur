# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributo: Jianhui Z <jianhui@outlook.com>
# Contributo: Tau Tsao <realturner at gmail.com>
# Contributor: Tomasz Zok <tomasz.zok [at] gmail.com>
# Contributor: techryda <techryda at silentdome dot com>
# Contributor: Mathias R. <pu154r@overlinux.org>
# Contributor: Alan Beale <the.mrabz@gmail.com>

pkgname=xrdp
pkgver=0.10.0_beta.1
pkgrel=1
pkgdesc="An open source remote desktop protocol (RDP) server"
url="https://github.com/neutrinolabs/xrdp"
arch=(i686 x86_64 armv6h armv7l aarch64)
license=('Apache-2.0')
makedepends=('nasm' 'cmocka')
depends=('libxrandr' 'fuse' 'libfdk-aac' 'ffmpeg' 'imlib2')
checkdepends=('check')
optdepends=('tigervnc' 'tightvnc' 'realvnc-vnc-server')
backup=('etc/xrdp/sesman.ini'
	'etc/xrdp/xrdp.ini'
	'etc/xrdp/cert.pem'
	'etc/xrdp/key.pem'
	'etc/xrdp/startwm.sh'
	'etc/xrdp/reconnectwm.sh'
	'etc/default/xrdp')
install="${pkgname}.install"
source=("https://github.com/neutrinolabs/xrdp/releases/download/v${pkgver//_/-}/xrdp-${pkgver//_/-}.tar.gz"
	"arch-config.diff")
sha256sums=('4e2ce2d4298eccf18edeaa3da040bf457ef3f349a1ca5f9a3bef2cff08842908'
            'e0ffce5b1a436990281fe2cc4a3cd9c2840a1dad99740aeaea866ccd9ef56db0')

prepare() {
  cd "${pkgname}-${pkgver//_/-}"
  patch -Np2 -b -z .orig <../arch-config.diff
  ./bootstrap
}

build() {
  cd "${pkgname}-${pkgver//_/-}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --sbindir=/usr/bin \
              --with-systemdsystemunitdir=/usr/lib/systemd/system \
              --enable-jpeg \
              --enable-tjpeg \
              --enable-fuse \
	      --enable-fdkaac \
	      --enable-opus \
	      --enable-rfxcodec \
	      --enable-mp3lame \
	      --enable-pixman \
	      --enable-painter \
	      --enable-vsock \
	      --enable-ipv6 \
	      --enable-pam-config=arch \
	      --enable-rdpsndaudin \
	      --with-imlib2
  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool
  make
}

check () {
  cd "${pkgname}-${pkgver//_/-}"
  make check
}

package() {
  cd "${pkgname}-${pkgver//_/-}"
  sed -i 's^param=Xorg^param=/usr/lib/Xorg^g' sesman/sesman.ini
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/etc/xrdp/rsakeys.ini
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 instfiles/default/xrdp "$pkgdir"/etc/default/xrdp
}
