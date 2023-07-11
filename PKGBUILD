# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Christoph Reiter <reiter.christoph@gmail.com>

pkgname=quodlibet-git
pkgver=r11444.4aff05b37
pkgrel=1
pkgdesc="Music player and music library manager"
arch=(any)
url="https://quodlibet.readthedocs.io"
license=(GPL2)
depends=(dbus-python gtk3 libsoup3 python-cairo python-feedparser python-gobject python-mutagen)
makedepends=(gettext git python-sphinx_rtd_theme)
optdepends=('gst-libav: Extra media codecs for the GStreamer backend'
            'gst-plugins-bad: Extra media codecs for the GStreamer backend; Audio Pitch / Speed, Crossfeed, Submit Acoustic Fingerprints plugins'
            'gst-plugins-base: Default audio backend'
            'gst-plugins-good: Extra media codecs, PulseAudio support for the GStreamer backend; Audio Compressor, Karaoke, Replay Gain plugins'
            'gst-plugins-ugly: Extra media codecs for the GStreamer backend'
            'gtksourceview3: Undo and redo support in multiline text fields'
            'kakasi: Kana/Kanji Simple Inverter plugin'
            'libappindicator-gtk3: Appindicator support in the Tray Icon plugin'
            'libkeybinder3: Multimedia key support under non Gnome setups'
            'libmodplug: MOD support'
            'python-musicbrainzngs: MusicBrainz Lookup, MusicBrainz Sync plugins'
            'python-paho-mqtt: MQTT Publisher plugin'
            'python-pyinotify: Automatic Library Update plugin'
            'rygel: UPnP AV Media Server plugin'
            'webkit2gtk: Web Lyrics plugin'
            'xine-lib: Alternative audio backend')
provides=('quodlibet')
conflicts=('quodlibet')
source=(${pkgname}::git+https://github.com/quodlibet/quodlibet.git)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  # Fix zsh completions dir
  sed -e 's|vendor-completions|site-functions|' -i gdist/zsh_completions.py
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -vDm 644 {README,NEWS}.rst -t "${pkgdir}"/usr/share/doc/${pkgname}
}
