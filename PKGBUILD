# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: rabyte <rabyte.at.pen.dot.tj>

pkgname=freepats-legacy
pkgver=20060219
pkgrel=1
pkgdesc="A free and open set of instrument patches for use with softsynths (old version)"
arch=('any')
url="https://freepats.zenvoid.org/SoundSets/general-midi.html"
license=('GPL')
provides=("timidity-freepats=$pkgver")
conflicts=("timidity-freepats=$pkgver")
optdepends=('timidity++: MIDI Sequencer and converter'
            'wildmidi: Another MIDI Synthesizer')
install=$pkgname.install
source=("https://freepats.zenvoid.org/freepats-$pkgver.tar.xz"
        'freepats.cfg')
sha256sums=('500c61782ff4b22de6887c0a32e68dd98b511c4396ddf89e8cab482c7dcea89e'
            '7a37808753321ac31554b2f2ad9b063f73a9a9bf64799cbb2165bd9247140fc2')

prepare() {
  # wildmidi does not support soundfont settings, so remove them
  tail -n3 freepats.cfg > wildmidi-freepats.cfg
}

package() {
  install -d "$pkgdir"/usr/share/freepats/{Drum,Tone}_000
  install -m644 freepats.cfg "$pkgdir"/usr/share/freepats/timidity-freepats.cfg
  install -m644 wildmidi-freepats.cfg "$pkgdir"/usr/share/freepats/wildmidi-freepats.cfg

  cd freepats
  install -m644 Drum_000/*.{pat,txt} "$pkgdir"/usr/share/freepats/Drum_000
  install -m644 Tone_000/*.{pat,txt} "$pkgdir"/usr/share/freepats/Tone_000
  install -m644 crude.cfg "$pkgdir"/usr/share/freepats/freepats.cfg
  install -Dm644 README "$pkgdir"/usr/share/doc/freepats/README

  # support old paths (from old timidity-freepats package)
  install -d "$pkgdir"/usr/share/timidity
  ln -s /usr/share/freepats "$pkgdir"/usr/share/timidity/freepats
  install -d "$pkgdir"/etc/timidity++/freepats
  ln -s /usr/share/freepats/freepats.cfg "$pkgdir"/etc/timidity++/freepats/freepats.cfg
}
