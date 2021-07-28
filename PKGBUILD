# Maintainer: bug <bug2000@gmail.com>
# Maintainer: leuko <aur_et_aydos_de>
_pkgname=xpra
pkgname=${_pkgname}-git
pkgver=v4.2.r429.g91bdd984e
pkgrel=1
pkgdesc="multi-platform screen and application forwarding system screen for X11"
arch=('x86_64')
url='https://www.xpra.org'
license=('GPL2')

# https://github.com/Xpra-org/xpra/blob/master/docs/Build/Dependencies.md
depends=(
	# core
	'gtk3'  # UI toolkit

	# network layer
	'python-rencode'  # packet encoding
	'python-lz4'  # packet compression
	'openssl'
	'python-paramiko'  # SSH integration
	
	# encodings
	'python-pillow'  # png,jpeg,webp encoding and decoding, format conversion

	# for GTK3
	'python-cairo'
	'python-gobject'

	# xserver
	'libxtst'
	'xf86-video-dummy'
	'libxkbfile'
)
optdepends=(
	# unless otherwise noted, the deps are both for client and server
	# To use these optional features, install them and then build the package
	# again. `setup.py` enables optional features only if the corresponding
	# package installations can be found.

	# core
	'python-opengl: client OpenGL accelerated rendering (client)'
	'python-pycups: Printing'
	'xf86-video-dummy-xpra-patch: Xdummy with constant-dpi. Recommended by Xpra' 

	# network layer
	'python-pyaml: alternative packet encoder'
	'python-cryptography: encryption'
	'python-zeroconf: Multicast DNS session publishing (server)'
	'python-netifaces: Multicast DNS session publishing (server)'
	'python-dbus: desktop integration, server control interface'
	'python-paramiko: ssh integration'
	'sshpass: non-interactive SSH password authentication'
	'brotli: HTML client compression'

	# authentication
	'python-gssapi: GSSAPI authentication (server)'
	'python-pykerberos: Kerberos authentication (server)'
	'python-ldap: LDAP authentication (server)'
	'python-ldap3: LDAP v3 authentication (server)'
	'python-pyu2f: U2F authentication (server)'

	# encoding
	'x264: h264 encoding (server)'
	'ffmpeg: h264, h265, vp8 and vp9 decoding (client)'
	'libvpx: vp8 and vp9 codec'
	'libwebp: webp codec'
	'libpng: png encoding'
	'libjpeg-turbo: jpeg encoding'
	'opencv: Webcam capture (client)'
	'libyuv: Colourspace Conversion'
	'python-pycuda: NVENC (server)'
	'python-pynvml: NVENC (server)'

	# audio forwarding
	'gstreamer: audio framework'
	'libogg: ogg container format'
	'opus: opus codec'
	'flac: flac codec'
	'speex: speex codec'
	'libvorbis: vorbis codec'
	'wavpack: wavpack codec'
	'faac: aac encoder'
	'faad: aac decoder'
	'lame: MP3 encoder'
	'twolame: MP2 encoder'
	'libmad: MP3 encoder'

	# not listed on Github deps page but in setup.py
	'python-numpy: GPU accelerated capture and compression for NVIDIA cards'
	'python-pyinotify: watch for application menu changes'
	'xpra-html5: HTML5 client. Can be used with Xpra proxy'

	# https://github.com/Xpra-org/xpra/blob/91bdd984e4558dafe6d47317fd2802b75fc1b051/setup.py#L1667
	'python-uinput: fine-grained scrolling using virtual input'
	
)
conflicts=('xpra' 'run_scaled-git')
provides=('xpra')
makedepends=(
	'git'
	'python-setuptools'
	'cython'
	'pandoc'
#	'uglify-js'
)
backup=(
	'etc/xpra/xpra.conf' 'etc/xpra/xorg.conf'
	'etc/xpra/conf.d/05_features.conf'
	'etc/xpra/conf.d/10_network.conf'
	'etc/xpra/conf.d/12_ssl.conf'
	'etc/xpra/conf.d/15_file_transfers.conf'
	'etc/xpra/conf.d/16_printing.conf'
	'etc/xpra/conf.d/20_sound.conf'
	'etc/xpra/conf.d/30_picture.conf'
	'etc/xpra/conf.d/35_webcam.conf'
	'etc/xpra/conf.d/40_client.conf'
	'etc/xpra/conf.d/42_client_keyboard.conf'
	'etc/xpra/conf.d/50_server_network.conf'
	'etc/xpra/conf.d/55_server_x11.conf'
	'etc/xpra/conf.d/60_server.conf'
	'etc/xpra/conf.d/65_proxy.conf'
	'etc/default/xpra'
	'etc/pam.d/xpra' )
source=("git+https://github.com/Xpra-org/xpra")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  sed -i 's|/build/xpra/pkg/xpra/etc/xpra/xorg.conf|/etc/xpra/xorg.conf|' "$pkgdir"/etc/xpra/conf.d/55_server_x11.conf
  mv "$pkgdir"/lib/* "$pkgdir"/usr/lib/
  rmdir "$pkgdir/lib"
  mkdir -p "$pkgdir"/usr/share/dbus-1
  #Move D-BUS Policy
  mv "$pkgdir"/{etc,usr/share}/dbus-1/system.d
}
