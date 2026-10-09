# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>
# Contributor: masmu
# Contributor: Cygn
# Contributor: pika02 <pikakolendo02 ät gmail döt com>

pkgname=pulseaudio-dlna-cygn
pkgver=0.6.6.1
pkgrel=1
pkgdesc='Small DLNA server which brings DLNA/UPnP support to PulseAudio, Cygn edition'
arch=('any')
url=https://github.com/Cygn/pulseaudio-dlna/
license=('GPL-3.0-or-later')
provides=('pulseaudio-dlna')
depends=(
  'glib2'
  'gtk3'
  'librsvg'
  'python'
  'python-cairo'
  'python-chardet'
  'python-dbus'
  'python-docopt'
  'python-gobject'
  'python-lxml'
  'python-netaddr'
  'python-netifaces'
  'python-notify2'
  'python-psutil'
  'python-pychromecast'
  'python-pyroute2'
  'python-requests'
  'python-setproctitle'
)
makedepends=(
  'help2man'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'bash: to run the included scripts'
  'faac: AAC transcoding support'
  'ffmpeg: multiple formats support'
  'flac: FLAC transcoding support'
  'lame: MP3 transcoding support'
  'opus-tools: OPUS transcoding support'
  'sox: WAV transcoding support'
  'vorbis-tools: OGG transcoding support'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Cygn/pulseaudio-dlna/archive/pulseaudio-dlna-${pkgver%.*}-${pkgver##*.}.tar.gz"
  'setuptools-importlib-compat.patch'
  'python-314-compat.patch'
)
sha256sums=(
  '92445a47ca85c041042cb8e9e5718e525233710023929e64f785b056fbd9a397'
  'f9eac4689c9bab1b07cad23dda77c4044732ca170560bf8a8a5c1fa63198a05a'
  '871b56713a120294c7ab48c6d388e2e6f1cea73d3298c4085edd85c84df20295'
)

prepare() {
  mv "pulseaudio-dlna-pulseaudio-dlna-${pkgver%.*}-${pkgver##*.}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"

  echo >&2 'Fixing build-time warnings'
  sed -i -e '/License :: OSI Approved/d' setup.py
  sed -i -e 's/\\d/\\\\d/g' pulseaudio_dlna/{codecs,streamserver}.py
  sed -i -e 's/\\ /\\\\ /g' pulseaudio_dlna/pulseaudio.py

  echo >&2 'Replacing unavailable pkg_resources API with importlib'
  patch -p1 < ../setuptools-importlib-compat.patch

  echo >&2 'Replacing unavailable distutils API with shutil'
  sed -i -e 's/distutils\.spawn/shutil/' -e 's/find_executable/which/' \
    pulseaudio_dlna/encoders/__init__.py

  echo >&2 'Applying Python 3.14 compatibility fix'
  patch -p1 < ../python-314-compat.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Building the manpage'
  export USE_PKG_VERSION=1
  help2man -n "Stream audio to DLNA devices and Chromecasts" \
    python -m pulseaudio_dlna > man/pulseaudio-dlna.1
  gzip -fk man/pulseaudio-dlna.1

  echo >&2 'Building the wheel'
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    'README.md'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    'samples'

  echo >&2 'Packaging scripts'
  cp -R --preserve=mode -t "${pkgdir}/usr/share/${pkgname}" \
    'scripts'

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'LICENSE'
}
