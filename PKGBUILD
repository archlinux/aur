# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl
pkgver=2.3.1
pkgrel=1
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=('any')
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=(
  ffmpeg
  python-click
  python-httpx
  python-m3u8)
makedepends=(
  python-setuptools
  python-setuptools-scm
  # Documentation building
  mdbook
  python-pyaml
  scdoc
  # PEP 517 build requirements
  python-build
  python-installer
  python-wheel)
checkdepends=('python-pytest')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
b2sums=('c2207a625ea275ec922b3c48debcec59c492f569aa478c3971122f4cc9431e285f3d44b83a0ab0af9ab2188eb40f2c9d6798112cd5c01661599da60d282ca643')

prepare() {
  cd "$pkgname-$pkgver"
  make clean
}

build() {
  cd "$pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation

  # Make later commands use the built module
  export PYTHONPATH="$PWD/build/lib"

  make man docs

  # Make ad hoc `twitch-dl` script
  echo '#!'$(which python) > twitch-dl
  cat build/lib/twitchdl/__main__.py >> twitch-dl
  chmod +x twitch-dl

  # Generate completion files
  _shells=(bash fish zsh)
  for _shell in "${_shells[@]}"; do
    _TWITCH_DL_COMPLETE="${_shell}_source" ./twitch-dl > "$pkgname.${_shell}"
  done
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="$PWD/build/lib"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 twitch-dl.1.man "$pkgdir"/usr/share/man/man1/twitch-dl.1
  install -Dm644 -t "$pkgdir"/usr/share/doc/"$pkgname" {CHANGELOG,TODO,README}.md
  mv book "$pkgdir"/usr/share/doc/"$pkgname"/
  install -Dm644 -t "$pkgdir"/usr/share/fish/vendor_completions.d "$pkgname".fish
  install -Dm644 -T "$pkgname".bash "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
  install -Dm644 -T "$pkgname".zsh "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"
}
