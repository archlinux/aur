# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributo: Jianhui Z <jianhui@outlook.com>
# Contributo: Tau Tsao <realturner at gmail.com>
# Contributor: Tomasz Zok <tomasz.zok [at] gmail.com>
# Contributor: techryda <techryda at silentdome dot com>
# Contributor: Mathias R. <pu154r@overlinux.org>
# Contributor: Alan Beale <the.mrabz@gmail.com>

pkgname=xrdp
pkgver=0.10.6.1
pkgrel=3
pkgdesc="An open source remote desktop protocol (RDP) server"
url="https://github.com/neutrinolabs/xrdp"
arch=(i686 x86_64 armv6h armv7l aarch64)
license=('Apache-2.0')
makedepends=('nasm' 'cmocka')
depends=('libxrandr' 'libfdk-aac' 'ffmpeg' 'imlib2' 'fuse3' 'x264')
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
	'arch-config.diff'
	'bitmap.patch'
	'sysusers.d'
	'tmpfiles.d')
sha256sums=('2f7beb5a3b2529c8d72dc0df9b8cdca31ab0e0c14d1e3421210f5e6ec0ab3b75'
            'a0d47d824f34088f3c819f7e5de53c2581fe0a1a0c0c1df4c41e09ded19cee80'
            '1d901d06727ff740e6f485005157a8a082aef9f3910577f377851d057732acbc'
            '72f2e1d945d91ddf7034fbe9b64d55e8fbe88d737b0cc3cedd779321b63d05c1'
            'd75eb05321d247ce792471a9f5176b1b03cf6166673d6bdd110da8fb7e8bd856')

prepare() {
  cd "${pkgname}-${pkgver//_/-}"
  patch -Np1 -b -z .orig < "../arch-config.diff"
  patch -Np1 -b -z .orig < "../bitmap.patch"
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
	      --with-imlib2 \
	      --enable-x264
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
  install -Dm644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/xrdp.conf"
  install -Dm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/xrdp.conf"
}
