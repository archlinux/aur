# Maintainer: delaosa <dev@delaosa.xyz>
pkgname=cero
pkgver=0.1.0
pkgrel=2
pkgdesc='Native Music Assistant player (GTK4, Sendspin, MPRIS2)'
arch=('any')
url='https://github.com/delaosa/cero'
license=('MIT')
depends=('python>=3.13' 'python-gobject' 'gtk4' 'libadwaita' 'gstreamer'
         'gst-plugins-base' 'gst-plugins-good' 'python-aiohttp' 'python-zeroconf'
         'python-orjson' 'python-cryptography' 'python-typing_extensions')
makedepends=('python-installer' 'python-build' 'python-setuptools' 'python-wheel' 'python-pip')
optdepends=('playerctl: control playback from the command line')
# Pure-Python libraries that are not in the official repos are bundled in /usr/lib/cero
# (a version-less directory, so Python upgrades do not break them)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'cero.sh' 'cero.desktop'
        "https://files.pythonhosted.org/packages/dc/8b/7b73b39e5f1a86d7ce29f86d0425ede07e4e298ff7beb66a314c72829265/music_assistant_client-1.8.1-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/6f/a9/0c036a0f4f17dd26e744eefc9c1306cec9233ae33bb366c6fd778c155def/music_assistant_models-1.1.242-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/df/5f/96297d664cd42f1450e6ecb27ea412a687606f495900c7422644c9faec55/aiosendspin-10.3.0-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/4e/eb/2c5e2b0df54c9c979d45bfa4820687ab24797fe1ad42d4fdfc0c8ece59f1/mashumaro-3.23-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/fa/e8/949c45844ad0d65d0112c2c4fa11cc8a7c4359fe2a20667e00c930860bef/cpace-0.1.0-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/9d/e1/76e4694201d67b93a6f1644b2588b4a3d965419fe189416e3496cf415db5/noiseprotocol-0.3.1-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/c2/76/783b75a21ce3563b8709050de030ae253853b147bd52e141edc1025aa268/anyascii-0.3.3-py3-none-any.whl")
noextract=(music_assistant_client-1.8.1-py3-none-any.whl music_assistant_models-1.1.242-py3-none-any.whl
           aiosendspin-10.3.0-py3-none-any.whl mashumaro-3.23-py3-none-any.whl
           cpace-0.1.0-py3-none-any.whl noiseprotocol-0.3.1-py3-none-any.whl
           anyascii-0.3.3-py3-none-any.whl)
sha256sums=('aed74848271d61be3fb490b0d1b0c8a52c88d939800f27535b2d0a62bfd6eb73'
            'SKIP' 'SKIP'
            '136c8095cc831790a3da0b4a3292789cbd813b79e5f88975b64f32dcf85fa832'
            '666230889a2b41cd18230f3e9ee1abd473c9a5a0cc61b9dd255a6cd19290f323'
            '1c5b39221c2912792bdf25c1c6a115814d02f36232d174cb5927b15bdd43dff6'
            'a671279ce93119d41c54adcd767753ae68adb32b9473de2f9d5d1720d2376231'
            '9fabb60a711a85934225be4081b3f5994e1ca4cd1335c5b9171770c8f1a2fda3'
            '2e1a603a38439636cf0ffd8b3e8b12cee27d368a28b41be7dbe568b2abb23111'
            'f5ab5e53c8781a36b5a40e1296a0eeda2f48c649ef10c3921c1381b1d00dee7a')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/python -m build --wheel --no-isolation
}

package() {
  local lib="$pkgdir/usr/lib/cero"
  /usr/bin/python -m pip install --no-deps --no-compile --target "$lib" \
    --disable-pip-version-check --root-user-action=ignore \
    "$srcdir/$pkgname-$pkgver"/dist/*.whl "$srcdir"/*.whl
  rm -rf "$lib/bin" "$lib/examples"
  rm -f "$lib"/*.dist-info/direct_url.json

  install -Dm755 "$srcdir/cero.sh" "$pkgdir/usr/bin/cero"
  install -Dm644 "$srcdir/cero.desktop" "$pkgdir/usr/share/applications/xyz.delaosa.CERO.desktop"
  cd "$pkgname-$pkgver"
  install -Dm644 cero.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/xyz.delaosa.CERO.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
