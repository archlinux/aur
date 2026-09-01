# Maintainer: Yakuda <yakuda-stack@users.noreply.github.com>
#
# Zwei Abhängigkeiten liegen im AUR, nicht in den offiziellen Repos:
# python-sounddevice und python-praat-parselmouth. Für Nutzer ist das
# unerheblich, paru und yay lösen das selbst auf. Zum Bauen von Hand
# reicht makepkg aber nicht, weil makepkg nur pacman kennt:
#   paru -Ui        (oder)   yay -Bi .
pkgname=dream-voicetraining
_repo=Dream-VoiceTraining          # das GitHub-Archiv entpackt unter diesem Namen
pkgver=1.0.0
pkgrel=1
pkgdesc="Voice analysis for training your speaking voice: pitch, formants, resonance and voice quality"
arch=('any')
url="https://github.com/yakuda-stack/Dream-VoiceTraining"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-numpy'
  'python-pyqtgraph'
  # pyqtgraph importiert colorama beim Laden, fuehrt es aber selbst nur als
  # Check-Abhaengigkeit. Ohne diesen Eintrag stuerzt das Programm beim Start
  # mit ModuleNotFoundError ab.
  'python-colorama'
  'pyside6'
  'python-sounddevice'
  'python-praat-parselmouth'
  'portaudio'
)
optdepends=(
  'libpulse: readable PipeWire/PulseAudio device names via pactl'
  'pipewire-pulse: same, on a PipeWire system'
  'python-setproctitle: show the program name instead of python3 in process lists'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1921c778ca81d402d71d8adf5070df62d5eb87621a34042bb1b7c19c321ee8e3')

check() {
  cd "$srcdir/$_repo-$pkgver"
  python -m pytest tests/ -q
}

package() {
  cd "$srcdir/$_repo-$pkgver"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -Dm644 ./*.py -t "$pkgdir/usr/lib/$pkgname"

  install -Dm755 packaging/dream-voicetraining.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 packaging/dream-voicetraining.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 packaging/dream-voicetraining.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "packaging/icons/$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES.md \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README.de.md "$pkgdir/usr/share/doc/$pkgname/README.de.md"
}
