# Maintainer: leuko <aur_et_aydos_de>
# Maintainer: bug <bug2000@gmail.com>
_pkgname=xpra
pkgname=${_pkgname}-git
pkgver=4.4.r1887.g4d73c3644
pkgrel=1
pkgdesc='multi-platform screen and application forwarding system screen for X11'
arch=(x86_64)
url='https://www.xpra.org'
license=(GPL2)

# https://github.com/Xpra-org/xpra/blob/master/docs/Build/Dependencies.md
# c => for client
# s => for server
depends=(
	# core
	gtk3  # UI toolkit cs

	# for GTK
	python-cairo  # pkg-config --libs py3cairo
	python-gobject  # pkg-config --libs gtk+-3.0 pygobject-3.0

	# network layer
	python-rencode  # packet encoding
	python-lz4  # packet compression
	openssl  # cs
	python-paramiko  # SSH integration (depends on python-cryptography)
	
	# encodings
	python-pillow  # png,jpeg,webp encoding and decoding, format conversion cs

	# xserver
	# pkg-config --libs x11 xtst xfixes xkbfile
	# pkg-config --libs x11 xtst xfixes xcomposite xdamage xext
	# pkg-config --libs x11 xres
	libx11
	libxtst
	libxfixes
	libxkbfile
	libxcomposite
	libxdamage
	libxext
	libxres
	xf86-video-dummy  # default virtual X server
	
	# pkg-config --libs libavutil
	ffmpeg
	# includes:
	# - libvpx (vp8 and 9 codecs for cs)
	# - libwebp (includes libpng, libjpeg(-turbo))
	# - x264
	# - libvorbis
	# - lame (MP3 encoder)
	# - opus
	# - speex
	
	qrencode  # Otherwise client menu does not work
	xorg-server  # Server requires an X executable

	# Above list contains the minimal dependencies. The following are optional but useful.
	gstreamer
	python-opengl
	#python-aioquic  # QUIC protocol, requires pylsqpack and ls-qpack
	python-zeroconf
	python-dbus
	libspng
	libavif
	openh264
)
optdepends=(
	# unless otherwise noted, the deps are both for client and server
	# To use these optional features, install them and then build the package
	# again. `setup.py` enables optional features only if the corresponding
	# package installations can be found.

	# core
	#'python-opengl: OpenGL rendering c'
	'python-opengl-accelerate: accelerated rendering c'
	'python-pycups: Printing cs'

	# network layer
	'python-pyaml: alternative packet encoder cs'
	#'python-aioquic: QUIC protocol cs'
	'python-zeroconf: Multicast DNS session publishing s'  # depends on -netifaces
	'python-dbus: desktop integration, server control interface cs'
	'sshpass: non-interactive SSH password authentication c'

	# authentication
	'python-gssapi: GSSAPI authentication s'
	'python-pykerberos: Kerberos authentication s'
	'python-ldap: LDAP authentication s'
	'python-ldap3: LDAP v3 authentication s'
	'python-pyu2f: U2F authentication s'

	# encoding
	'libspng: faster png encoding cs'
	'opencv: Webcam capture c'
	'libyuv: Colourspace conversion cs'
	'python-pycuda: NVENC s'
	'cuda: NVENC s'
	'python-pynvml: NVENC s'

	# audio forwarding
	# libogg is used by various codecs
	#'gstreamer: audio framework'
	'flac: flac codec (includes libogg)'
	'wavpack: wavpack codec'
	'faac: aac encoder'
	'faad: aac decoder'
	'twolame: MP2 encoder'

	# not listed on Github deps page but in setup.py
	'python-uinput: fine-grained scrolling using virtual input'
	'python-numpy: GPU accelerated capture and compression for NVIDIA cards'
	'python-pyinotify: watch for application menu changes'
	'xpra-html5: HTML5 client. Can be used with Xpra proxy'
	#'xf86-video-dummy-xpra-patch: Xdummy with constant-dpi. Recommended by Xpra' 
)
conflicts=(xpra)
provides=(xpra=$pkgver)
makedepends=(
	git
	cython
	pandoc
	brotli  # HTML client compression'
)
backup=(
	etc/xpra/xpra.conf
	etc/xpra/conf.d/05_features.conf
	etc/xpra/conf.d/10_network.conf
	etc/xpra/conf.d/12_ssl.conf
	etc/xpra/conf.d/15_file_transfers.conf
	etc/xpra/conf.d/16_printing.conf
	etc/xpra/conf.d/20_audio.conf
	etc/xpra/conf.d/30_picture.conf
	etc/xpra/conf.d/35_webcam.conf
	etc/xpra/conf.d/40_client.conf
	etc/xpra/conf.d/42_client_keyboard.conf
	etc/xpra/conf.d/50_server_network.conf
	etc/xpra/conf.d/55_server_x11.conf
	etc/xpra/conf.d/60_server.conf
	etc/xpra/conf.d/65_proxy.conf
	etc/default/xpra
	etc/pam.d/xpra
)
source=('git+https://github.com/Xpra-org/xpra')
md5sums=(SKIP)

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd $_pkgname
  python setup.py build -j $(nproc)
}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  mv "$pkgdir"/lib/* "$pkgdir"/usr/lib/

  # /lib exists already
  rmdir "$pkgdir"/lib

  #Move D-BUS Policy
  mkdir -p "$pkgdir"/usr/share/dbus-1
  mv "$pkgdir"/{etc,usr/share}/dbus-1/system.d
}
