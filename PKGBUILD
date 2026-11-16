# Maintainer: SjAudioSearch <dev@serverjonas.de>
#
# Baut das Paket direkt aus dem Git-Repository und installiert es systemweit
# unter /usr:
#
#   makepkg -si
#
# Das Repository ist ein Gitea unter https://git.serverjonas.de. Es gibt
# (noch) keinen Release-Tag, deshalb wird der Quelltext als Archiv eines
# festen Commits geladen. Fuer eine neue Version nur diese drei Stellen
# anpassen:
#
#   pkgver=<version>
#   _commit=<commit-sha>
#   sha256sums=('<sha256>')   # updpkgsums
#
# Sobald ein Tag existiert, kann stattdessen das Tag-Archiv verwendet werden:
#
#   source=("$pkgname-$pkgver.tar.gz::https://git.serverjonas.de/Serverjonas/sjmusicsearch/archive/v$pkgver.tar.gz")

pkgname=sjaudiosearch
pkgver=1.0.0
pkgrel=1
pkgdesc="Lokale Suchmaschine fuer Hoerspiele, Hoerbuecher und Audiosammlungen (faster-whisper + SQLite FTS5)"
arch=('any')
url="https://git.serverjonas.de/Serverjonas/sjmusicsearch"
license=('MIT')
depends=(
  'python'
  'python-typer'
  'python-rich'
  'python-faster-whisper'
  'python-rapidfuzz'
  'python-mutagen'
  'python-av'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'ffmpeg: Wiedergabe der Fundstellen ueber ffplay und Unterstuetzung fuer WMA'
  'mpv: alternative Wiedergabe der Fundstellen'
  'vlc: alternative Wiedergabe der Fundstellen'
  'python-ctranslate2-cuda: CUDA-Beschleunigung auf NVIDIA-GPUs'
)
# Hinweis: faster-whisper 1.2.1 benoetigt PyAV < 17 (Argument metadata_errors).
_commit=97e5c9ef4d3a9dfe9be37f839b53cd82a35d1844
source=("$pkgname-$pkgver.tar.gz::https://git.serverjonas.de/Serverjonas/sjmusicsearch/archive/$_commit.tar.gz")
sha256sums=('5b919dc66cda1ad88a9f105524abb4f728ad7a047fe34ce037b45a2da717f09f')
# Gitea entpackt das Archiv nach $srcdir/<repo-name>.
build() {
  cd "$srcdir/sjmusicsearch"
  python -m build --wheel --no-isolation --outdir "$srcdir/dist"
}

package() {
  cd "$srcdir/sjmusicsearch"

  python -m installer --destdir="$pkgdir" "$srcdir"/dist/*.whl

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}
