# Maintainer: okrinoggen <okrinoggen@users.noreply.github.com>
pkgname=voxn
pkgver=0.3.0
pkgrel=1
pkgdesc="Local-first voice and text note-taking suite"
arch=('any')
url="https://github.com/okrinoggen33/voxn"
license=('MIT')
depends=('python' 'python-typer' 'sox' 'fzf' 'sqlite')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
optdepends=(
  'python-faster-whisper: local speech transcription backend'
  'ollama: default local LLM provider'
  'wl-clipboard: copy notes from voxn browse'
  'libnotify: desktop notifications'
  'yt-dlp: ingest video URLs'
  'poppler: ingest PDF files'
)
conflicts=('voxn-git')
source=("https://files.pythonhosted.org/packages/source/v/voxn/voxn-${pkgver}.tar.gz")
sha256sums=('7ae4a587d5ff24d869ad81815f456c8ec2147c578cf6d8009ca7557ad9d86148')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 systemd/voxn-index.path "$pkgdir/usr/lib/systemd/user/voxn-index.path"
  install -Dm644 packaging/systemd/voxn-index.service "$pkgdir/usr/lib/systemd/user/voxn-index.service"
}
